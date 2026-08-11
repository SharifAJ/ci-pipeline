# 1. Use a specific, lightweight base image instead of 'latest'
FROM nginx:1.27-alpine-slim

# 2. Add metadata for better maintainability
LABEL maintainer="you@example.com" \
      description="Lightweight Nginx container for static HTML" \
      version="1.0"

# 3. Explicitly set the working directory
WORKDIR /usr/share/nginx/html

# 4. Copy the static files into the working directory
COPY index.html ./

# 5. Document the port the container listens on
EXPOSE 80

# 6. Add a health check so Docker knows if the web server fails
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q -O /dev/null http://localhost/ || exit 1

# 7. Explicit startup command (the base image does this, but explicit is better)
CMD ["nginx", "-g", "daemon off;"]
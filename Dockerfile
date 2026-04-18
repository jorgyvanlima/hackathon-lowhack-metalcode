FROM nginx:stable-alpine

# Remove default config and add our own
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy site content
COPY site /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

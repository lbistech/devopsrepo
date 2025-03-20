# Use the official Nginx image
FROM nginx:alpine

# Copy the index.html file into the Nginx HTML directory
COPY index.html /usr/share/nginx/html/index.html

# Expose the HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
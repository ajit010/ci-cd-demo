# Using the official Nginx image from DockerHub as the base image
FROM nginx:alpine

# Copy the custom index.html file to the default Nginx HTML directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to allow external access to the web server
EXPOSE 80
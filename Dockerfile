# FROM node:18-alpine
# WORKDIR /app
# COPY . /app
# RUN npm install
# EXPOSE 3000
# CMD ["node" "index.js" ]


#Simple nginx image 
# Use the Ubuntu Bionic as the base image
FROM ubuntu:bionic

# Set the Nginx version
ENV NGINX_VERSION 1.21.3

# Update package lists and install necessary dependencies
RUN apt-get update && \
    apt-get install -y nginx

# # Remove the default Nginx configuration file
# RUN rm /etc/nginx/nginx.conf

WORKDIR /var/www/html

# # # Copy the custom Nginx configuration file
# COPY ./nginx.conf /etc/nginx/nginx.conf
COPY index.html ./ 

# Expose port 80 to allow incoming connections
EXPOSE 80

# Set the command to start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]

STOPSIGNAL SIGTERM
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "executable" ]

# Base image: CentOS
FROM centos:latest

# Maintainer information
MAINTAINER snsbr2004@gmail.com

# Install necessary package: httpd (Apache)
RUN yum install -y httpd

# Download content from the new URL
ADD https://www.chess.com/play /var/www/html/

# Set the working directory to the web server's root directory
WORKDIR /var/www/html/

# Start Apache in the foreground so that the container keeps running
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for HTTP traffic
EXPOSE 80


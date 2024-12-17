# Use CentOS as the base image
FROM centos:7

# Install updates, Python 3, pip, and supervisord
RUN yum -y update && \
    yum -y install python3 python3-pip && \
    yum -y install epel-release && \
    yum -y install supervisor && \
    yum clean all

# Set the working directory in the container
WORKDIR /app

# Copy application files to the container
COPY app1.py app2.py app3.py app4.py supervisord.conf ./

# Install Flask
RUN pip3 install flask

# Expose the ports used by the Flask applications
EXPOSE 5000 5001 5002 5003

# Run supervisord to manage multiple processes
CMD ["/usr/bin/supervisord", "-c", "/app/supervisord.conf"]

FROM centos:stream8

# Update the repositories to use the baseurl instead of mirrorlist
RUN sed -i 's|^mirrorlist=|#mirrorlist=|' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://mirror.stream.centos.org/8-stream/BaseOS/x86_64/os/|' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://mirror.stream.centos.org/8-stream/AppStream/x86_64/os/|' /etc/yum.repos.d/CentOS-AppStream.repo && \
    yum clean all && \
    yum makecache && \
    yum install -y httpd

# Start the Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

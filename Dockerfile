FROM quay.io/centos/centos:stream8

# Manually add the CentOS repo if missing
RUN echo -e "[BaseOS]\nname=CentOS-8 - Base\nbaseurl=http://mirror.stream.centos.org/8-stream/AppStream/$basearch/os//\nenabled=1\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial" > /etc/yum.repos.d/CentOS-Base.repo && \
    echo -e "[AppStream]\nname=CentOS-8 - AppStream\nbaseurl=http://mirror.stream.centos.org/8-stream/AppStream/$basearch/os/\nenabled=1\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial" > /etc/yum.repos.d/CentOS-AppStream.repo && \
    yum clean all && \
    yum makecache && \
    yum install -y httpd

# Start the Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


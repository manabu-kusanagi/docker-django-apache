FROM centos:centos7
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code

# Python env
RUN yum install -y python3 python3-devel python3-libs httpd-devel gcc make mariadb-devel wget
RUN curl https://bootstrap.pypa.io/get-pip.py | python3

ADD requirements.txt /code/
ADD wsgi.conf /etc/httpd/conf.d/
RUN pip install -r requirements.txt

RUN systemctl enable httpd

CMD ["/sbin/init"]
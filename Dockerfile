FROM centos
RUN yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel -y
RUN curl https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz --output /tmp/Python-3.7.9.tgz
WORKDIR /tmp
RUN tar xzf Python-3.7.9.tgz
WORKDIR /tmp/Python-3.7.9
RUN ./configure --enable-optimizations
RUN yum install make -y
RUN make altinstall
RUN yum install which -y
WORKDIR /tmp
RUN rm -r Python-3.7.9.tgz
RUN yum -y install epel-release
RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
RUN python3.7 get-pip.py
RUN python3.7 -m pip install --upgrade pip
RUN echo "boto3==1.15.11" > requirements.txt
RUN pip install -r requirements.txt

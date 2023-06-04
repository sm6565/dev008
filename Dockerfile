FROM ubuntu
RUN apt update -y
RUN /bin/bash -c echo 'test'
ENV EnvVar="This is Example"
#
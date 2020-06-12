FROM debian:buster-slim

RUN apt-get update -y \
  && apt-get install -y curl git build-essential zlib1g-dev libssl-dev libncurses-dev libffi-dev libsqlite3-dev libreadline-dev libbz2-dev \
  && git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git \
  && ./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer \
  && apt-get clean \
  && rm -rf aws-elastic-beanstalk-cli-setup

ENV PATH=/root/.ebcli-virtual-env/executables:$PATH
ENV PATH=/root/.pyenv/versions/3.7.2/bin:$PATH

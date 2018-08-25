FROM atlassian/default-image:latest

RUN \

  # install JDK 8
  sudo apt-get install --reinstall ca-certificates && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \

  # install utilities
  apt-get install -y \
     wget \
     curl \
     git \
     bzip2 \
     fontconfig \
     python \
     g++ \
     build-essential &&\
   
  # install node
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -  && \
  sudo apt-get install -y nodejs  && \

  # upgrade npm
  npm install -g npm && \

  # install yeoman bower gulp
  npm install -g \
    yo \
    bower \
    gulp-cli && \
    
  # install yarn
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
  sudo apt-get update && \
  sudo apt-get install yarn && \
  
  # cleanup
  apt-get clean && \
  rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \

  # make it possible to run bower with root
  echo '{ "allow_root": true }' > /root/.bowerrc

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
CMD ["bash"]

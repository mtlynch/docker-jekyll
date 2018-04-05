FROM docker.io/node:8-stretch

# Speed up installation of html-proofer.
ENV NOKOGIRI_USE_SYSTEM_LIBRARIES true

# Install Ruby.
RUN apt-get update && \
      apt-get install -y ruby ruby-dev

# Install bundler.
RUN gem install bundler

# Clean up.
RUN rm -rf /var/lib/apt/lists/* && \
    rm -Rf /usr/share/doc && \
    rm -Rf /usr/share/man && \
    apt-get autoremove -y && \
    apt-get clean

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /app

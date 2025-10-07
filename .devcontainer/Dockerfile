FROM ruby:3.1.2

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    postgresql-client \
    git \
    curl \
    wget \
    vim \
    nano \
    sudo \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Generate locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Create a non-root user
RUN useradd -m -s /bin/bash vscode && \
    usermod -aG sudo vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set up bundler cache directory
ENV BUNDLE_PATH=/usr/local/bundle
RUN mkdir -p $BUNDLE_PATH && \
    chown -R vscode:vscode $BUNDLE_PATH

# Install global gems
RUN gem install bundler:2.3.26 rails solargraph

# Set working directory
WORKDIR /workspace

# Switch to non-root user
USER vscode

# Set up shell for interactive use
RUN echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "' >> ~/.bashrc

# Default command
CMD ["sleep", "infinity"]
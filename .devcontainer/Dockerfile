# Use the official Microsoft devcontainer base image
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install system dependencies for Rails development
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
        build-essential \
        libpq-dev \
        postgresql-client \
        openssh-client \
        vim \
        nano \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Set up bundler cache directory
ENV BUNDLE_PATH=/usr/local/bundle
RUN mkdir -p $BUNDLE_PATH && \
    chown -R vscode:vscode $BUNDLE_PATH

# Set working directory
WORKDIR /workspace

# Switch to non-root user
USER vscode

# Set up shell for interactive use
RUN echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "' >> ~/.bashrc

# Default command
CMD ["sleep", "infinity"]
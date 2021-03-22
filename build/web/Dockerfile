FROM parrotsec/core:rolling-amd64
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.8-3

# Don't configure resolvconf symlink
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

# Install required dependencies
RUN apt-get update && apt-get -y full-upgrade && apt-get -y --allow-downgrades install hugo jekyll ruby-jekyll-* mkdocs mkdocs-* staticsite; rm -rf /var/lib/apt/lists/*


ENTRYPOINT bash -c "$@"
CMD bash -c "$@"

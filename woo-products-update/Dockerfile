FROM debian:stable-slim

LABEL "com.github.actions.name"="WooCommerce Plugin Deploy"
LABEL "com.github.actions.description"="Deploy to the WOocommerce Store"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

LABEL maintainer="Sébastien SERRE <sebastien@thivinfo.com>"
LABEL version="1.0.0"
LABEL repository="https://github.com/sebastienserre/wordpress-actions"

RUN apt-get update \
	&& apt-get install -y subversion rsync git \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& git config --global user.email "sebastien@thivinfo.com" \
	&& git config --global user.name "Sebastien SERRE"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

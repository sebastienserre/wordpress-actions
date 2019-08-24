FROM debian:stable-slim

LABEL "com.github.actions.name"="WordPress Plugin Deploy"
LABEL "com.github.actions.description"="Deploy to the WordPress Plugin Repository"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

LABEL maintainer="Pierre Lannoy <pierre@lannoy.fr>"
LABEL version="1.0.0"
LABEL repository="https://github.com/Pierre-Lannoy/wordpress-actions"

RUN apt-get update \
	&& apt-get install -y subversion rsync git \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& git config --global user.email "pierre@lannoy.fr" \
	&& git config --global user.name "Pierre Lannoy"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

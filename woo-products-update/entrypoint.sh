#!/bin/bash

if [[ -z "$SSH_USERNAME" ]]; then
	echo "Set the SSH_USERNAME"
	exit 1
fi

if [[ -z "$SSH_URL" ]]; then
	echo "Set the SSH_URL"
	exit 1
fi

rsync -avz / $SSH_USERNAME@$SSH_URL:/var/www/thivinfo.com/web/deploy

echo "deployed"
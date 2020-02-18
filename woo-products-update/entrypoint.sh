#!/bin/bash
set -eu
SSH_USERNAME=sebastienerre
SSH_URL=176.31.56.134:61212

if [[ -z "$SSH_USERNAME" ]]; then
	echo "Set the SSH_USERNAME"
	exit 1
fi

if [[ -z "$SSH_URL" ]]; then
	echo "Set the SSH_URL"
	exit 1
fi

DEPLOY_KEY: ${{ secrets.SERVER_SSH_KEY }}
ARGS: "-e -c -r --delete"
SERVER_PORT: 61212
FOLDER: "./"
SERVER_IP: 176.31.56.134
USERNAME: sebastienserre
SERVER_DESTINATION: /var/www/thivinfo.com/web/deploy
SSHPATH="$HOME/.ssh"
mkdir "$SSHPATH"
echo "$DEPLOY_KEY" > "$SSHPATH/key"
chmod 600 "$SSHPATH/key"
SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"

#rsync -avz / $SSH_USERNAME@$SSH_URL:/var/www/thivinfo.com/web/deploy
sh -c "rsync $ARGS -e 'ssh -i $SSHPATH/key -o StrictHostKeyChecking=no -p $SERVER_PORT' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
echo "deployed"
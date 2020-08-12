#!/bin/bash
set -eu
SSH_USERNAME=XXXX
SSH_URL=XXXX

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
SERVER_PORT: XXX
FOLDER: "./"
SERVER_IP: 1XXXX
USERNAME: XXXX
SERVER_DESTINATION: XXXX
SSHPATH="$HOME/.ssh"
mkdir "$SSHPATH"
echo "$DEPLOY_KEY" > "$SSHPATH/key"
chmod 600 "$SSHPATH/key"
SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"

#rsync -avz / $SSH_USERNAME@$SSH_URL:/var/www/thivinfo.com/web/deploy
sh -c "rsync $ARGS -e 'ssh -i $SSHPATH/key -o StrictHostKeyChecking=no -p $SERVER_PORT' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
echo "deployed"

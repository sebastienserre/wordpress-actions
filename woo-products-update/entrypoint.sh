#!/bin/bash

if [[ -z "$SSH_USERNAME" ]]; then
	echo "Set the SSH_USERNAME secret"
	exit 1
fi

if [[ -z "$SSH_URL" ]]; then
	echo "Set the SSH_URL"
	exit 1
fi
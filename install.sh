#!/bin/bash -ex

DIR="/usr/local/LoginQuote"

mkdir -p $DIR
cp quote.py $DIR/quote.py
cp run.sh $DIR/run.sh
chmod +x $DIR/run.sh

launchctl unload "/Library/LaunchAgents/com.spuf.loginquote.plist"
cp "com.spuf.loginquote.plist" "/Library/LaunchAgents/com.spuf.loginquote.plist"
launchctl load -F "/Library/LaunchAgents/com.spuf.loginquote.plist"
launchctl list | grep "com.spuf.loginquote"

#!/bin/bash -ex

sudo launchctl unload "/Library/LaunchAgents/com.spuf.loginquote.plist"
sudo cp "com.spuf.loginquote.plist" "/Library/LaunchAgents/com.spuf.loginquote.plist"
sudo launchctl load -F "/Library/LaunchAgents/com.spuf.loginquote.plist"
sudo launchctl list | grep "com.spuf.loginquote"

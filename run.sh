#!/bin/bash

python quote.py | xargs -0 defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText

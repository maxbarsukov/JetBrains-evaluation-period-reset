#!/usr/bin/env bash

rm -rf ~/.config/JetBrains/RubyMine*/eval
rm -rf ~/.config/JetBrains/RubyMine*/options/other.xml
sed -i -E 's/<property name=\"evl.*\".*\/>//' ~/.config/JetBrains/RubyMine*/options/other.xml
rm -rf ~/.java/.userPrefs/jetbrains/pycharm
echo "RubyMine evaluation period has been reset. Please, buy it if you like it!"

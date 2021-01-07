#!/usr/bin/env bash

rm -rf ~/.config/JetBrains/PhpStorm*/eval
rm -rf ~/.config/JetBrains/PhpStorm*/options/other.xml
sed -i -E 's/<property name=\"evl.*\".*\/>//' ~/.config/JetBrains/PhpStorm*/options/other.xml
rm -rf ~/.java/.userPrefs/jetbrains/phpstorm
echo "PhpStorm evaluation period has been reset. Please, buy it if you like it!"

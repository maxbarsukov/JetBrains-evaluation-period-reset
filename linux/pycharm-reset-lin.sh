#!/usr/bin/env bash

rm -rf ~/.config/JetBrains/PyCharm*/eval
rm -rf ~/.config/JetBrains/PyCharm*/options/other.xml
sed -i -E 's/<property name=\"evl.*\".*\/>//' ~/.config/JetBrains/PyCharm*/options/other.xml
rm -rf ~/.java/.userPrefs/jetbrains/pycharm
echo "PyCharm evaluation period has been reset. Please, buy it if you like it!"

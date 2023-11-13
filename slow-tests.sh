#!/usr/bin/env bash
# brew install xmlstarlet

echo \<parent\>>/tmp/slow.xml
grep -h -e "<testcase.*/>" `find . -iname "TEST-*.xml"` >>/tmp/slow.xml
echo \</parent\>>>/tmp/slow.xml
xmlstarlet sel -t -m "//testcase" -v "concat(@time,' ', @classname, ' ', @name)" -n /tmp/slow.xml | sort -r -g | head -n 25

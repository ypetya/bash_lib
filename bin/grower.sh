#!/bin/bash
function grow() {
echo "This is grower"
echo "Executed : $1"
}
grow 15
while read line ; do
if [ "${line:0:4}" = 'grow' ] ; then
echo "grow $(expr $(echo $line | cut -d' ' -f2) + 1)" >> $0.1
else
echo $line >> "$0.1"
fi
done < $0

(
mv "$0.1" $0
) &

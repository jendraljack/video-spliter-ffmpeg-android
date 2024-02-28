#!/system/bin/sh
curpath2="$(dirname $(realpath $0))"
###
if [ ! -d "$curpath2/normaL" ]
then
mkdir $curpath2/normaL
fi
find $curpath2/normaL -name "*.mp4" -type f -exec sh $curpath2/encodeNormal.sh {} \;
echo "$0 done"
 
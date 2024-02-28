#!/system/bin/sh
curdir="$(dirname $(realpath $0))"
echo $curdir
find $curdir/normaLaudio -name "*_2.srt" -type f -exec sh $curdir/fix1Quote2.sh {} \;

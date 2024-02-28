#!/system/bin/sh
workdir="$(realpath $(dirname $0))"
checksrt="$(ls $workdir/*.srt)"
echo "Split video by subrip times.."
if [ "$checksrt" = "" ]
then
echo "Please,.. place srt file in $workdir"
kill -9 $$
fi

if [ ! -d "$workdir/sksh" ]
then
mkdir $workdir/sksh
fi

if [ ! -d "$workdir/output" ]
then
mkdir $workdir/output
fi

if [ ! -d "$workdir/txt" ]
then
mkdir $workdir/txt
fi

if [ ! -d "$workdir/rev" ]
then
mkdir $workdir/rev
fi

if [ ! -f "$workdir/00spliter.Video.sh" ]
then
echo "No $workdir/00spliter.Video.sh"
kill -9 $$
fi
/system/bin/sh $workdir/00spliter.Video.sh
#####
 if [ ! -f "$workdir/01dumpTextToTexts.sh" ]
then
echo "no $workdir/01dumpTextToTexts.sh"
kill -9 $$
fi 
/system/bin/sh $workdir/01dumpTextToTexts.sh
######
if [ ! -f "$workdir/02compSkrip.main.sh" ]
then
echo "no $workdir/02compSkrip.main.sh"
kill -9 $$
fi 
/system/bin/sh $workdir/02compSkrip.main.sh
#####
if [ ! -f "$workdir/03finalsplit.sh" ]
then
echo "no $workdir/03finalsplit.sh"
kill -9 $$
fi 
/system/bin/sh $workdir/03finalsplit.sh
/system/bin/sh $workdir/04convert.sh
#/system/bin/sh $workdir/05move.Video.sh
sleep 2
echo "OKe.."
echo "$(basename $0) executed.."
rm "$workdir"/sksh/*
rm "$workdir"/txt/*

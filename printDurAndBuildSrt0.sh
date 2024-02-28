#!/system/bin/sh
if [ -z "$1" ]
then
echo "Usage: $0 /path/subrip.srt"
kill -9 $$
fi
curdir="$(dirname $(realpath $0))"
echo "#!/system/bin/sh" > $curdir/print2.sh
cat "$@"|busybox tr '\n\n' '##' > "$@"2.log
busybox sed -i "s|##|\n|g" "$@"2.log
busybox sed -i "s|#| |g" "$@"2.log
busybox sed -i "s|:||g" "$@"2.log
busybox sed -i "s|,||g" "$@"2.log
busybox sed -i "s|'| |g" "$@"2.log
cat "$@"2.log|busybox awk '{print "busybox echo \"" $0 "\" > \$(dirname \$(realpath \$0))/normaLaudio/" $2 ".log"}' >> $curdir/print2.sh
/system/bin/sh $curdir/print2.sh
echo "print2.sh executed"
echo "$0 executed."

#!/system/bin/sh
curdir="$(realpath $(dirname $0))"
echo "executing $0 for building script mp4 spliter..."
echo "#!/system/bin/sh\necho \"Select 1 mp4 below you want split in \$(dirname \$0) (without path and space)...\"\nls \$(dirname \$0)/*.mp4\nread video\ncase \$video in\n \"*.mp4\");;\nesac;\n" > $(dirname $0)/04convert.sh
ls $curdir/sksh > $curdir/sksh.log
cat $curdir/sksh.log|busybox awk '{print "/system/bin/sh \$(realpath \$(dirname \$0))/sksh/" $0 " \"\$(realpath \$(dirname \$0))/\$video\""}' >> $curdir/04convert.sh
#echo "$0 done...!"
echo "$(basename $0) executed.."

#!/system/bin/sh
cwd="$(dirname $(realpath $0))"
if [ ! -e "$cwd/txt" ]
then
mkdir $cwd/txt
fi

checktxt="$(ls $cwd/txt)"
if [ ! -z "$checktxt" ]
then
rm -f $cwd/txt/*.txt
fi
###
if [ ! -e "$cwd/spliter2.log" ]
then
echo "run $cwd/00spliter.Video.sh for first"
kill -9 $$
fi
####
echo "#!/system/bin/sh\ncd $cwd/txt" > "$cwd/makertxt.sh"
cat "$cwd/spliter2.log"|busybox awk '{print "nomoR" NR+0 "=" NR+0 "\nstring" NR+0 "=\"" $0 "\"\nfile" NR+0 "=\$(busybox printf \x27%05d.%s\\n\x27 \"\$nomoR" NR+0 "\" \"txt\")\necho \"\$string" NR+0 "\" > \"\$file" NR+0 "\"" }' >> $cwd/makertxt.sh
echo "echo \"\$0 was done..\"" >> $cwd/makertxt.sh
sleep 1
sh $cwd/makertxt.sh
echo "$(basename $0) done.."

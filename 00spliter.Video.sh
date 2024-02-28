#!/system/bin/sh
cdr="$(realpath $(dirname $0))"
#subrip="$@"
echo "$(basename $0) executing.."
############################
ls $(dirname $0)/*.srt
echo "Select 1 srt at above for split your video. (without path)... "
read subrip
 case $subrip in
  "*.srt");;
  esac;
  
cat "$cdr/$subrip"|grep -e "-->" > "$cdr"/spliter.log
cat $cdr/spliter.log|busybox awk '{print $1,$3}' > $cdr/spliter2.log
echo "#!/system/bin/sh\n" > "$cdr"/Stringcompiler.sh
busybox sed -i "s|:| |g" "$cdr"/spliter2.log
busybox sed -i "s|,| |g" "$cdr"/spliter2.log
# skrip serentak pemisah video menurut waktu di subtitle.srt
sleep 1
echo "$(basename $0) executed.."

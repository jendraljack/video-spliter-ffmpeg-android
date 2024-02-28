#!/system/bin/sh
check="$(ls $(dirname $(realpath $0))/rev/*.ts)"
cd $(dirname $(realpath $0))
if [ -z "$check" ]
then
echo "No video.ts"
kill -9 $$
fi
#### script ts video merge generator ####
ls $(dirname $(realpath $0))/rev/*.ts > ./0con.log
echo "x \"\$(dirname \$0)\"/\"\$(date +%s)\".4" >> ./0con.log
cat 0con.log|busybox tr '\n' '|' > ./1con.log
busybox sed -i "s|\|x|\" -c copy |g" ./1con.log
busybox sed -i "s|4\||mkv|g" ./1con.log
echo "ffmpeg -i \"concat" > ./ffmpeg.log
cat ./1con.log >> ./ffmpeg.log
cat ./ffmpeg.log|busybox tr '\n' ':' > ./conFfmpeg.log
echo "#!/system/bin/sh" > $(dirname $(realpath $0))/mergets.sh
cat ./conFfmpeg.log >> $(dirname $(realpath $0))/mergets.sh
echo "\n" >> $(dirname $(realpath $0))/mergets.sh
/system/bin/sh $(dirname $(realpath $0))/mergets.sh
echo "$(basename $0) executed.."

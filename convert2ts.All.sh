#!/system/bin/sh
vidfile="$(ls $(dirname $0)/rev/*.mp4)"
echo "Reversing all mp4"
if [ -z "$vidfile" ]
then
echo "No *.mp4 in $(dirname $0)/rev"
kill -9 $$
fi

if [ ! -f "$0_2.sh" ]
then
echo "#!/system/bin/sh\nffmpeg -i \"\$@\" -c copy \"\$@.ts\"\nrm \"\$@\"" > "$0_2.sh"
fi

find $(dirname $0)/rev -type f -name "*.mp4" -exec /system/bin/sh "$0"_2.sh {} \;
echo "$0 oke"
sleep 3
#rm "$(dirname $0)"/rev/*.mp4
rm "$0"_2.sh
echo "Building concat ts script.."
/system/bin/sh $(dirname $0)/concatTS_script_builder.sh
sleep 3
rm "$(dirname $0)"/rev/*.ts

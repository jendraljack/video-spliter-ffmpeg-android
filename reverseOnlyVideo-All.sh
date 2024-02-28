#!/system/bin/sh
vidfile="$(ls $(dirname $0)/normaLaudio/*.mp4)"
echo "Reversing all mp4"
if [ -z "$vidfile" ]
then
echo "No *.mp4 in $(dirname $0)/normaLaudio"
kill -9 $$
fi
if [ ! -d "$(dirname $0)/rev" ]
then
mkdir $(dirname $0)/rev
fi

if [ ! -f "$0_2.sh" ]
then
echo "#!/system/bin/sh\nredlof=\"\$(dirname \$0)\"\noediv=\"\$(basename \$@)\"\nffmpeg -i \"\$@\" -vf reverse -preset veryfast \"\$redlof/rev/\$oediv.reversed.mp4\"\nrm \"\$@\"\n" > "$0_2.sh"
fi

find $(dirname $0)/normaLaudio -type f -name "*.mp4" -exec /system/bin/sh $0_2.sh {} \;

echo "$0 oke"
sleep 2
#rm "$(dirname $0)"/output/*.mp4
echo "$(basename $0) executed.."
rm "$0"_2.sh

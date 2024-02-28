#!/system/bin/sh
curdir="$(dirname $(realpath $0))"
echo "Reverse video maker.."
if [ -z "$1" ]
then
echo "usage: $0 /path/subrip"
kill -9 $$
fi
echo "Starting.."
echo "Subrip File: $(basename $@)"
sh "$curdir/05move.Video.sh" "$@"
sleep 1
sh "$curdir/printDurAndBuildSrt0.sh" "$@"
sleep 1
sh "$curdir/printDurAndBuildSrt.sh"
sleep 1
sh "$curdir/NewLineBuilder2.sh"
sleep 1
sh "$curdir/ReplacerQuotAll.sh"
sleep 1
sh "$curdir/printDurAndBuildSrt.sh13.sh"
sleep 1
sh "$curdir/reverse2All.sh"
echo "Everything is Ok.."

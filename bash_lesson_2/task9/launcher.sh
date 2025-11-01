T=${1:-127.0.0.1}
O=${2:-scan_results.txt}
bash check_ping.sh "$T" "$O" &
bash check_ports.sh "$T" "$O" &
wait
cat "$O"
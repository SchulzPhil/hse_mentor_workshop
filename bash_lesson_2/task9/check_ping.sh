OUT=${2:-scan_results.txt}
: >"$OUT"
echo "Ping ${1:-127.0.0.1} $(date)" >>"$OUT"
ping -c4 "${1:-127.0.0.1}" >>"$OUT" 2>&1
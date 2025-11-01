OUT=${2:-scan_results.txt}
echo "Nmap ${1:-127.0.0.1} $(date)" >>"$OUT"
nmap -Pn -p- --open "${1:-127.0.0.1}" -oG - 2>/dev/null | awk -F'Ports: ' '/Ports:/{print $2}' | tr ',' '\n' >>"$OUT"



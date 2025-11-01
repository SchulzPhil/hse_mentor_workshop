threshold=80
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
mem=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
disk=$(df -h --total | grep 'total' | awk '{print $5}')
echo "утилизация CPU: ${cpu}%"
echo "утилизация памяти: ${mem}%"
echo "утилизация диска: ${disk}"
echo

if (( "$mem" > "$threshold" )); then
    echo "утилизация памяти более ${threshold}%"
    echo "Топ-5 процессов по использованию памяти:"
    ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6
else
    echo "использованию оперативной памяти в норме(<${threshold}%)"
fi

find "$1" -type f -name "*.log" -printf '%T+ %p\n' | sort | head -n 5 |
while read -r line; do
    timestamp=$(echo "$line" | awk '{print $1}')
    filepath=$(echo "$line" | awk '{print $2}')
    echo "created: $timestamp | name: $filepath"
done

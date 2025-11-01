source_dir=$1
log="${2:-sort.log}"

if [[ ! -d "$source_dir" ]]; then
    echo "$source_dir не существует" | tee -a "$log"
    exit 1
fi

images="$source_dir/Images"
docs="$source_dir/Documents"
mkdir -p "$images" "$docs"

for file in "$source_dir"/*; do
    [[ -f "$file" ]] || continue

    ext="${file##*.}"
    ext_lower="${ext,,}"

    case "$ext_lower" in
        jpg|png|gif)
            mv "$file" "$images/"
            echo "$(basename "$file") → Images/" | tee -a "$log"
            ;;
        txt|pdf|docx)
            mv "$file" "$docs/"
            echo "$(basename "$file") → Documents/" | tee -a "$log"
            ;;
        *)
            ;;
    esac
done


cron="0 0 * * * $PWD/$(basename "$0") $source_dir $log"
crontab -l 2>/dev/null | grep -F "$PWD/$(basename "$0")" >/dev/null
if [[ $? -ne 0 ]]; then
    (crontab -l 2>/dev/null; echo "$cron") | crontab -
    echo "cron установлен на ежедневный запуск в 00:00" | tee -a "$log"
else
    echo "cron установлен" | tee -a "$log"
fi

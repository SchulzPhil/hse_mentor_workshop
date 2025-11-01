read -p "Введите путь до директории с файлами для бэкапа:" dir_path
read -p "Введите название директории в которую положить бэкап файлы:" backup_dir_path

if [[ ! -d "$dir_path" ]]; then
    echo "директория для бэкапа не существует"
    exit 1
fi

mkdir -p "${backup_dir_path}"

for item in "$dir_path"/*; do
    if [[ -e "$item" ]]; then
        name=$(basename "$item")
        backup_filename="$backup_dir_path/backup_$name"

        if [[ -f "$item" ]]; then
            cp "$item" "$backup_filename"
        elif [[ -d "$item" ]]; then
            cp -r "$item" "$backup_filename"
        fi
    fi
done

echo "Бэкап завершён"
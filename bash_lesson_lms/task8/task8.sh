from=$1
to=$2
log=$3
log_file=${log:-"backup.log"}
today=$(date +"%Y-%m-%d")

ls "$from" > /dev/null 2> >(tee -a "$log_file" >&2)
mkdir -p "$to"

copied=0
for obj in "$from"/*; do
    if [[ -f "$obj" ]]; then
      filename=$(basename "$obj")
      cp "$obj" "$to/${filename}_${today}"
      ((copied++))
      echo "file:$filename -> ${to}/${filename}_${today}" | tee -a "$log_file"


    elif [[ -d "$obj" ]]; then
      dirname=$(basename "$obj")
      cp -r "$obj" "$to/${dirname}_${today}"
      ((copied++))
      echo "dir:$dirname -> ${to}/${dirname}_${today}" | tee -a "$log_file"
    fi
done


echo "резервное копирование выполнено успешно"
echo "$from->$to, кол-во объектов: $copied"
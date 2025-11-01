check="$1"

echo "Список файлов и их типы в текущей директории:"
for file in *; do
  if [ -f "$file" ]; then
    file_type="файл"
  elif [ -d "$file" ]; then
    file_type="каталог"
  elif [ -L "$file" ]; then
    file_type="символьная ссылка"
  else
    file_type="другое"
  fi
  echo "$file: $file_type"
done

echo

if [ -e "$check" ]; then
  echo "$check' существует"
else
  echo "$check' не существует"
fi

echo

echo "Имя файла и права доступа:"
for file in *; do
  [ -e "$file" ] || continue
  permissions=$(ls -ld "$file" | awk '{print $1}')
  echo "$file: $permissions"
done

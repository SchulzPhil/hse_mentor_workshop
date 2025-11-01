read -p "Введите путь до файла:" file_path
if [[ -f $file_path ]]; then
  echo "Файл найден, считаем строки..."
  lines_count=$(wc -l < "$file_path")
  echo "Кол-во строк в файле: ${lines_count}"
else
  echo "Файл не существует"
fi
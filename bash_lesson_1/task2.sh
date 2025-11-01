read -p "Введите путь до файла:" file_path
if [[ -f $file_path ]]; then
  echo "Файл существует"
else
  echo "Файл не существует"
fi
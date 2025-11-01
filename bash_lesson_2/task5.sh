for file in "$1"/*; do
  mv "$file" "${file,,}"
done

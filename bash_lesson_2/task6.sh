f="$1"; t=$(stat -c %Y "$f")
while sleep 1;

  do [ "$(stat -c %Y "$f")" != "$t" ] && echo "произошло изменение: $f" && t=$(stat -c %Y "$f");

done

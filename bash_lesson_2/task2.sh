if [[ $1 < $2 ]]; then
  echo "$1<$2"
elif  [[ $1 > $2 ]]; then
  echo "$1>$2"
else
  echo "$1 == $2"
fi
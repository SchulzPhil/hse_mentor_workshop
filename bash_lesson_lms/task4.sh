greet() {
  echo "Hello, $1"
}

sum() {
  echo $(($1+$2))
}

greet "$1"
sum "$2" "$3"

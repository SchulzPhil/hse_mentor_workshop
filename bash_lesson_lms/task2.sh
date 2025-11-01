add_to_path="$1"

echo "current: $PATH"

export PATH="$PATH:$add_to_path"
echo
echo "new: $PATH"

echo

echo "чтобы изменения стали постоянными, нужно заменить текущее значение переменной
PATH в ~/.bashrc на export PATH=$PATH:$add_to_path"

echo

echo "для применения изменений в текущем терминале выполните команду: source ~/.bashrc"

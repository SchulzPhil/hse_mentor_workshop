stopper() {
  echo
  echo "wait 5 second before stop task $2"
  sleep 5
  kill -STOP "$1"
  echo "task $2 was stopped"
}


sleep 10 &
sleep1=$!
sleep 15 &
sleep2=$!
sleep 20 &
sleep3=$!

jobs
echo

stopper $sleep3 3 &
echo "task 3 on foreground"
fg %3
echo
jobs

echo
sleep 1
echo "task 3 continue on background"
bg %3
echo
jobs

echo "В данном примере было показано как работают команды jobs, fg, bg
fg - foreground то есть вывести задачу на передний план и ждать её завершения
bg - вернуть задачу на фоновое выполнение"
echo "В нашем примере я провожу действия с задачей 3,
сначала она запускается в фоновом режиме, затем я запускаю функцию stopper,
которая остановит её через 5 секунд и параллельно вывожу задачу 3 на foreground
с помощью команды fg %3, задача начинает foreground исполнение затем функция stopper её приостанавливает
после чего печатается jobs где можно увидеть такую запись: [3]+  Остановлен       sleep 20
далее с помощью команды bg я возвращаю задачу 3 на background исполнение, и снова печатаю jobs
и запись со статусом 3ей задачи изменится -> [3]+  Запущен             sleep 20 &"
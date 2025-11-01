utilization=$(df -h --total | grep total | awk '{print $5}' | tr -d "%")
if [[ $utilization -gt 80 ]]; then
  echo "Диск заполнен более чем на 80%"
fi
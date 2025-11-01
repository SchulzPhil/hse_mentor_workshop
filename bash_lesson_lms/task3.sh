user_num=$1
if [ "$user_num" -gt 0 ]; then
  echo "$user_num>0"
  count=1
  while [ $count -le "$user_num" ]; do
      echo "$count"
      ((count++))
  done
elif [ "$user_num" -lt 0 ]; then
  echo "$user_num<0"
else
  echo "$user_num==0"
fi

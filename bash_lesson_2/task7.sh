TOKEN="---"
message="$1"
user_id="1469261977" # мой telegram_id

curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
     -d chat_id="$user_id" \
     -d text="$message"
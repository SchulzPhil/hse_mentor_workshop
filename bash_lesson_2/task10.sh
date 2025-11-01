TOKEN="---"
API="https://api.telegram.org/bot$TOKEN"

update_index=0
while true; do
  updates=$(curl -s "$API/getUpdates?offset=$update_index")
  message=$(echo "$updates" | jq -r '.result[-1]')
  update_index=$(($(echo "$message" | jq -r '.update_id') + 1))
  chat_id=$(echo "$message" | jq -r '.message.chat.id')
  text=$(echo "$message" | jq -r '.message.text' | tr '[:upper:]' '[:lower:]')

  if [[ "$text" == "дата" ]]; then
    curl -s "$API/sendMessage" -d chat_id="$chat_id" -d text="$(date)"
  fi
done
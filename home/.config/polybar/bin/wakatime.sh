# Get the api_key from the wakatime config file

wakatime_conf_file=$HOME/.wakatime.cfg
api_key=$(awk -F "= " '/api_key/ {print $2}' $wakatime_conf_file)

API_URL=https://wakatime.com/api/v1
ENDPOINT=users/current/summaries?range=Today

response=$(curl -s "$API_URL/$ENDPOINT" -H "Authorization: Basic $api_key")
total=$(echo $response | jq '.cumulative_total.text' | sed 's/"//g')

echo "$total"

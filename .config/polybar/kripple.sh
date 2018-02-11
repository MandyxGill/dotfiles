# !/bin/bash
# data=$(curl -s -X POST   https://pocketbits.in/AltCoins/GetFrontDataBuySell   -H 'Cache-Control: no-cache' -H 'Content-Length: 0' > /tmp/pb.json )
# last=$(cat /tmp/koinex.json | jq ".stats.XRP.last_traded_price")
last=$(cat /tmp/koinex.json | jq ".stats.XRP.lowest_ask" | sed -e 's/\"//g')
min=$(cat /tmp/koinex.json | jq ".stats.XRP.min_24hrs" | sed -e 's/\"//g')
max=$(cat /tmp/koinex.json | jq ".stats.XRP.max_24hrs" | sed -e 's/\"//g')
printf %2.1f $last
printf '('
printf %2.1f $min
printf '/'
printf %2.1f $max
printf ')'

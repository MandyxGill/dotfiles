#!/bin/bash
# data=$(curl -s -X POST   https://pocketbits.in/AltCoins/GetFrontDataBuySell   -H 'Cache-Control: no-cache' -H 'Content-Length: 0' > /tmp/pb.json )
sell=$(cat /tmp/pbx.json | jq ".[9].CurSellRate" | sed -e 's/\"//g')
buy=$(cat /tmp/pbx.json | jq ".[9].CurBuyRate" | sed -e 's/\"//g')
printf %2.1f $buy
printf '/'
printf %2.1f $sell

#!/bin/bash
# data=$(curl -s -X POST   https://pocketbits.in/AltCoins/GetFrontDataBuySell   -H 'Cache-Control: no-cache' -H 'Content-Length: 0' > /tmp/pb.json )
buy=$(cat /tmp/pbx.json | jq ".[5].CurBuyRate" | sed -e 's/\"//g')
printf "%'.0f" $buy

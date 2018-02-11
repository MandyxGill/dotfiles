#!/bin/bash
source /home/mandy/.bashrc
curl -s -X POST https://pocketbits.in/AltCoins/GetFrontDataBuySell -H 'Cache-Control: no-cache' -H 'Content-Length: 0' > /tmp/pbx.json

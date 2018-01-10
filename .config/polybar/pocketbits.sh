#!/bin/bash
curl -S -X POST   https://pocketbits.in/AltCoins/GetFrontDataBuySell   -H 'Cache-Control: no-cache' -H 'Content-Length: 0' | jq ".[9]"

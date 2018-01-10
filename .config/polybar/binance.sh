#!/bin/bash
curl -S https://api.binance.com/api/v1/exchangeInfo | jq "."

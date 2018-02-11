#!/bin/bash
curl -s https://koinex.in/api/ticker | jq "." > /tmp/koinex.json

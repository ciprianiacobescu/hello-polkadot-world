#!/bin/bash

chmod 777 -R /app-dev/substrate-front-end-template/public

nohup /app-dev/substrate-node-template/target/release/node-template --dev --ws-external --tmp > pnode.log &

# /app-dev/substrate-node-template/target/release/node-template --dev --ws-external --tmp 

sleep 15s


cd /app-dev/substrate-front-end-template #&& yarn start

yarn start

sleep 15s



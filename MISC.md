
# tzdata non interactive
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

# WOAM  - won't work outside docker if you do not ws-external 
./target/release/node-template --dev --ws-external --tmp 
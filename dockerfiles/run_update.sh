#!/bin/bash

# Load settings into the current shell script if you can't use rustup command
# If you've run this before, you don't need to run it again. But doing so is harmless.
source ~/.cargo/env

# Update Rust
rustup update nightly
rustup update stable

# Add Wasm target
rustup target add wasm32-unknown-unknown --toolchain nightly

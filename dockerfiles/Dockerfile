from ubuntu:20.04


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata curl git ca-certificates yarn nodejs 

RUN apt install -y --no-install-recommends cmake pkg-config libssl-dev git gcc build-essential git clang libclang-dev

RUN mkdir /app-dev && chmod 777 -R /app-dev

WORKDIR /app-dev

COPY run_update.sh /run_update.sh
COPY getsubstrate.sh /getsubstrate.sh

RUN chmod 755 /getsubstrate.sh 

RUN bash /getsubstrate.sh --fast

ENV PATH="/root/.cargo/bin:$PATH"

RUN chmod 755 /run_update.sh && bash /run_update.sh

ENV WASM_BUILD_TOOLCHAIN=nightly-2020-10-05
RUN   cd /app-dev/ && git clone -b v2.0.0 --depth 1 https://github.com/substrate-developer-hub/substrate-node-template && pwd && ls -al 
# && cd /app-dev/substrate-node-template/ && cargo build --release

RUN cd /app-dev/substrate-node-template/ && cargo build --release

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt install -y gnupg2 && \
 curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
 apt update && apt install -y --upgrade nodejs && apt install -y yarn 

RUN apt install -y  --no-install-recommends libmagickwand-dev


RUN pwd && cd /app-dev && git clone -b v2.0.0 --depth 1 https://github.com/substrate-developer-hub/substrate-front-end-template && \
       cd /app-dev/substrate-front-end-template && yarn install

RUN chmod +x /app-dev/substrate-node-template/target/release/node-template 

EXPOSE 8000
EXPOSE 9944
#VOLUME [ "/app-dev" ]
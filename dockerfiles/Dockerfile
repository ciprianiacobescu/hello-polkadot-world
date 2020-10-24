from ubuntu:20.04


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata curl git yarn nodejs

RUN mkdir /app-dev && chmod 777 -R /app-dev

VOLUME [ "/app-dev" ]
WORKDIR /app-dev

COPY run_update.sh /run_update.sh
COPY getsubstrate.sh /getsubstrate.sh

RUN bash -s /getsubstrate.sh --fast

ENV PATH="/root/.cargo/bin:$PATH"

RUN chmod 755 /getsubstrate.sh && chmod 755 /run_update.sh && sh -c /run_update.sh

RUN  git clone -b v2.0.0 --depth 1 https://github.com/substrate-developer-hub/substrate-node-template

RUN cd substrate-node-template/ && cargo build --release

RUN cd /app-dev && git clone -b v2.0.0 --depth 1 https://github.com/substrate-developer-hub/substrate-front-end-template && \
        cd substrate-front-end-template && yarn install


EXPOSE 8000

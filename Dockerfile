FROM ubuntu:22.04

RUN apt update
RUN apt install -y gcc g++ cmake git make

COPY . /lab08
WORKDIR /lab08

RUN git submodule update --init --recursive || true
RUN rm -rf _build
RUN cmake -H. -B_build -DBUILD_TESTS=ON
RUN cmake --build _build

CMD ["./_build/main"]

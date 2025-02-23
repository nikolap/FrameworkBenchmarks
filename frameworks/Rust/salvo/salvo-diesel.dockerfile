FROM rust:1.62.1

RUN apt-get update -yqq && apt-get install -yqq cmake g++

ADD ./ /salvo
WORKDIR /salvo

RUN cargo clean
RUN RUSTFLAGS="-C target-cpu=native" cargo build --release

EXPOSE 8080

CMD ./target/release/main-diesel

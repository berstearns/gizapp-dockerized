FROM debian:bullseye-slim
WORKDIR /app/

RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install make -y
RUN apt-get install g++ -y

RUN git clone https://github.com/moses-smt/giza-pp.git
RUN cd ./giza-pp;make  

COPY giza_example /app/giza-pp/giza_example
COPY testing_giza.sh /app/giza-pp/testing_giza.sh

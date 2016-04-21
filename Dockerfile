FROM debian:latest

MAINTAINER lehkost <frafis@gmail.com> 

RUN apt-get update && apt-get install -yq \ 
  curl \
  default-jre-headless \
  git \
  libsaxonb-java \
  wget \
  xml-twig-tools

RUN useradd -m elasticsearch

USER elasticsearch 

WORKDIR /home/elasticsearch

ENV ES_VERSION 2.1.1 

RUN wget -nv https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ES_VERSION}/elasticsearch-${ES_VERSION}.tar.gz && \
    tar zxf elasticsearch-${ES_VERSION}.tar.gz && \
    rm -f elasticsearch-${ES_VERSION}.tar.gz && \
    mv elasticsearch-${ES_VERSION} elasticsearch

ENV KIBANA_VERSION 4.3.1 

RUN wget -nv https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
    tar zxf kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
    rm -f kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
    mv kibana-${KIBANA_VERSION}-linux-x64 kibana

RUN kibana/bin/kibana plugin --install elastic/sense

#RUN git clone https://github.com/lehkost/DNBTitel-Elasticsearch.git

COPY dnb2es /home/elasticsearch/dnb2es

CMD elasticsearch/bin/elasticsearch -Des.logger.level=OFF & kibana/bin/kibana -q

EXPOSE 9200 5601


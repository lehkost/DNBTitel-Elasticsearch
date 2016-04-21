FROM debian:latest

MAINTAINER lehkost <frafis@gmail.com> 

RUN apt-get update && apt-get install -yq \ 
  curl \
  default-jre-headless \
  libsaxonb-java \
  wget \
  xml-twig-tools \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

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

COPY dnb2es /home/elasticsearch/dnb2es

USER root
RUN chown -R elasticsearch /home/elasticsearch/dnb2es
USER elasticsearch

CMD elasticsearch/bin/elasticsearch -Des.logger.level=OFF & kibana/bin/kibana -q

EXPOSE 9200 5601


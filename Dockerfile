#
# IK Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM lingpin/elasticsearch:1.3.1
MAINTAINER zhihang.yu@gmail.com

#Bundle ik and config files
RUN rm -rf /elasticsearch/config
ADD  ./config /elasticsearch/config/

#Install Marvel
RUN ["/elasticsearch/bin/plugin", "-i", "elasticsearch/marvel/latest"]
ADD ./elasticsearch-analysis-ik-1.2.6.jar /elasticsearch/plugins/analysis-ik/

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.

CMD ["/elasticsearch/bin/elasticsearch"]
EXPOSE 9200

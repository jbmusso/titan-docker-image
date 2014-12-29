FROM dockerfile/java:oracle-java8

# Specify versions.
ENV TDB_VERSION 0.5.2
ENV HADOOP_VERSION 1

# Donwload titan.
RUN \
  curl -o /opt/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-${TDB_VERSION}-hadoop${HADOOP_VERSION}.zip

# Unzip titan.
RUN unzip /opt/titan.zip -d /opt/ && \
    rm /opt/titan.zip && \
    mv /opt/titan-${TDB_VERSION}-hadoop${HADOOP_VERSION} /opt/titan

# Use the patched gremlin.sh.
RUN curl -o /opt/titan/bin/gremlin.sh https://gist.githubusercontent.com/dkuppitz/b7c804ef71f0d8bd86ca/raw/4bc543f01b8568ed28bc28bffd268ccb16273f10/gremlin.sh && \
  chmod +x /opt/titan/bin/gremlin.sh

# Define working directory.
WORKDIR /opt/titan

# Add run.
ADD ./start.sh /opt/titan/bin/

# Expose ports.
EXPOSE 8182 8184

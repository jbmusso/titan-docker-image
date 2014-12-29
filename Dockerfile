FROM dockerfile/java:oracle-java8

# Donwload titan.
RUN \
  curl -o /opt/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-0.5.2-hadoop2.zip

# Unzip titan.
RUN unzip /opt/titan.zip -d /opt/ && \
    rm /opt/titan.zip && \
    mv /opt/titan-0.5.2-hadoop2 /opt/titan

# Define working directory.
WORKDIR /opt/titan

# Add run.
ADD run.sh /

# Basic command.
# ENTRYPOINT ["/run.sh"]

# Expose ports.
EXPOSE 8182 8184

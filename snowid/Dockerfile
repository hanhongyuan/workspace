# Start from a Java image.
FROM java:8

# version
ENV SNOWID_VERSION=1.0.1

# home
ENV SNOWID_HOME=/opt/snowid-${SNOWID_VERSION}

ENV CENT_ID=1

ENV PROCESS_ID=1

WORKDIR  ${SNOWID_HOME}

COPY . .

EXPOSE 16830 16831

ENTRYPOINT [ "sh", "run.sh" ]

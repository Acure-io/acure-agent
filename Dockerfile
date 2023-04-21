FROM debian:bullseye-slim AS downloader

ADD https://downloads.acure.io/tools/acure-agent/v1.2.0/linux-x64/acure-agent.zip /tmp/
ADD https://downloads.acure.io/agent-plugins/k8sMetricsDataFlow/v1.0.0/k8sMetricsDataFlow.zip /tmp/plugins/
ADD https://downloads.acure.io/agent-plugins/k8sTopologySync/v1.0.0/k8sTopologySync.zip /tmp/plugins/

RUN apt-get update && \
    apt-get -y install unzip && \
    unzip /tmp/acure-agent.zip -d /app && \
    for plugin in $(find /tmp/plugins/ -name "*.zip"); do unzip $plugin -d /app/plugins; done

FROM debian:bullseye-slim
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true
RUN apt-get update && apt-get -y install ca-certificates && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /app
COPY --from=downloader /app ./
ENTRYPOINT ["./acure-agent", "start"]
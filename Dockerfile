FROM yaman/gocd-agent-jdk

USER root

RUN curl `curl -s https://api.github.com/repos/getgauge/gauge/releases | grep browser_download_url | grep 'linux.x86_64.zip' | head -n 1 | cut -d '"' -f 4` -L -o /tmp/gauge.zip && \
    unzip -d /tmp/gauge /tmp/gauge.zip && \
    cp /tmp/gauge/gauge /usr/local/bin/ && \
    rm -rf gauge gauge.zip ~/.gauge/config ~/.gauge/logs 

RUN gauge install java



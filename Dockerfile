FROM myoung34/github-runner:latest

RUN  sed -i -e 's/ulimit -p unlimited/echo ""/g'  /etc/init.d/docker

ENV START_DOCKER_SERVICE='true'
ENV EPHEMERAL='true'

COPY entrypoint.sh /

WORKDIR /actions-runner

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]
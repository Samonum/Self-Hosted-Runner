FROM myoung34/github-runner:latest

RUN  sed -i -e 's/ulimit -p unlimited/echo ""/g'  /etc/init.d/docker

WORKDIR /actions-runner

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]
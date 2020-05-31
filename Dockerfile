FROM some:java:9

WORKDIR /src
COPY . /src

COPY --chown=appuser:appuser target/auditing_service-*.jar /home/appuser/app.jar
EXPOSE $SERVER_PORT

ENTRYPOINT ["/bin/bash"]
CMD ["/src/run.sh"]
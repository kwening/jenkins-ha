FROM busybox

#docker create -v /usr/share/jenkins/ref --name em124-config busybox
#docker cp default-user.groovy em124-config:/usr/share/jenkins/ref/init.groovy.d/

RUN mkdir -p /usr/share/jenkins/cdc/
#COPY  default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

VOLUME /usr/share/jenkins/cdc
ENTRYPOINT ["tail", "-f", "/dev/null"]

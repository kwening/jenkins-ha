FROM jenkins/jenkins:lts

RUN /usr/local/bin/install-plugins.sh git matrix-auth workflow-aggregator docker-workflow blueocean credentials-binding kubernetes

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

USER root

RUN mkdir /var/jenkins_build \
    && mkdir /var/jenkins_workspace \
    && chown -R jenkins.jenkins /var/jenkins_build /var/jenkins_workspace

USER jenkins

# Skip initial setup
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -Djenkins.model.Jenkins.workspacesDir=/var/jenkins_workspace -Djenkins.model.Jenkins.buildsDir=/var/jenkins_build/\$\{ITEM_FULL_NAME\}"

#COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY custom-entrypoint.sh /usr/local/bin/custom-entrypoint.sh

VOLUME /var/jenkins_home

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/custom-entrypoint.sh"]

#COPY basic-security.groovy /usr/share/jenkins/ref/init.groovy.d/basic-security.groovy
#COPY jenkins.install.UpgradeWizard.state /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

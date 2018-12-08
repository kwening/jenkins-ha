FROM jenkins/jenkins:lts

RUN /usr/local/bin/install-plugins.sh git matrix-auth workflow-aggregator docker-workflow blueocean credentials-binding kubernetes configuration-as-code

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV CASC_JENKINS_CONFIG ${JENKINS_HOME}/casc_configs/

USER root

RUN mkdir -p /var/jenkins_data/build \
    && mkdir /var/jenkins_data/workspace \
    && chown -R jenkins.jenkins /var/jenkins_data

USER jenkins

# Skip initial setup
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -Djenkins.model.Jenkins.workspacesDir=/var/jenkins_data/workspace -Djenkins.model.Jenkins.buildsDir=/var/jenkins_data/build/\$\{ITEM_FULL_NAME\}"

#COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY custom-entrypoint.sh /usr/local/bin/custom-entrypoint.sh

VOLUME /var/jenkins_home

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/custom-entrypoint.sh"]

#COPY basic-security.groovy /usr/share/jenkins/ref/init.groovy.d/basic-security.groovy
#COPY jenkins.install.UpgradeWizard.state /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

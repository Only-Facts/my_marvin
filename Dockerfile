FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y make gcc build-essential

USER jenkins

COPY --chown=jenkins:jenkins ./plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

ENV CASC_JENKINS_CONFIG=/var/jenkins_home/my_marvin.yml

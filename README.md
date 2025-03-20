Documentation of the base image : https://hub.docker.com/r/jenkins/inbound-agent

docker build . -t jenkins_agent_symfony

docker run --name jenkins_agent_symfony_container --init jenkins_agent_symfony -url http://172.17.0.2:8080 37d555787c050aaf77a11b45266d9d69121584724e21870cbbe9a9fbf8684640 JenkinsAgent_composer

To get the <IPAdresse_of_jenkins_master>, make this command :
docker inspect jenkins_master_container

<password> and <node_name> are given by the jenkins_master when you create a node
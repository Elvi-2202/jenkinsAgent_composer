Documentation of the base image : https://hub.docker.com/r/jenkins/inbound-agent

docker build . -t jenkins_agent_symfony

docker run --name jenkins_agent_symfony_container --init jenkins_agent_symfony -url http://<IPAdresse_of_jenkins_master>:8080 <password> <node_name>

To get the <IPAdresse_of_jenkins_master>, make this command :
docker inspect jenkins_master_container

<password> and <node_name> are given by the jenkins_master when you create a node
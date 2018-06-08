#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

#deploy all projects found in deploy

#generazione del war SpringBootBasic.war
cd /home/asw/_shared/deploy/SpringBootBasic
mvn clean package

sudo cp /home/asw/_shared/deploy/SpringBootBasic/target/SpringBootBasic.war /usr/local/wildfly-11.0.0.Final/standalone/deployments/

sudo cp /home/asw/_shared/deploy/hello.war /usr/local/wildfly-11.0.0.Final/standalone/deployments/


#deploy all projects found in deploy

 for proj_war in /usr/local/wildfly-11.0.0.Final/standalone/deployments/*.war; do
        echo "deploying $proj_war"
        /usr/local/wildfly-11.0.0.Final/bin/jboss-cli.sh -c "connect"
        /usr/local/wildfly-11.0.0.Final/bin/jboss-cli.sh -c "deploy $proj_war"
    done

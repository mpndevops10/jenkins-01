pipeline {
  agent any
  tools {
    maven 'maven'
  }
  stages{
    stage('1-cloning project repo'){
      steps{
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/mpndevops10/jenkins-01.git']])
        sh 'cd jenkins-01/MavenEnterpriseApp-web'
      }
    }
    stage('2-cleanws'){
      steps{
        sh 'mvn clean'
      }
    }
    stage('3-mavenbuild'){
      steps{
        sh 'mvn package'
      }
    }
    stage('4-codequality'){
        steps{
       sh "mvn clean verify sonar:sonar \
  -Dsonar.projectKey=team10 \
  -Dsonar.host.url=http://18.222.84.91:9000 \
  -Dsonar.login=ssqp_16517fe8f80ef63a69b758bfee435cf562cdb283"
      }
    }
    stage('5-deploy-to-tomcat') {
        steps {
            withEnv(['WAR_FILE_PATH=~/workspace/maven-build/MavenEnterpriseApp-web/target/MavenEnterpriseApplication.war']) {
            sshagent(['tomcat']) {
              sh """scp -o StrictHostKeyChecking=no ${WAR_FILE_PATH} ubuntu@18.218.13.227:/opt/tomcat/apache-tomcat-9.0.93/webapps"""
            }
        }
    }
}


  }
}

pipeline {
	environment {
    registry = "manthan/spe-assignment-image"
    registryCredential = 'docker-hub-credentials'
    dockerImage = ''
    dockerImageLatest = ''
  }
      agent any
      stages {
            stage('Init') {
                  steps {
                        echo 'Hi, this is Manthan Fursule'
                        echo 'I am executing calculator program via piipeline'
                  }
            }
		stage('Cloning Git') {
      steps {
        git 'https://github.com/montsss19/SPE-assignment.git'
      }
    }
 
            stage('Build') {
                  steps {
                        sh 'mvn -f pom.xml clean package'
                  }
		
            }
	    stage('Building image') {
      steps{
		sh "pwd"
                sh "ls -a"
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
          dockerImageLatest = docker.build registry + ":latest"
        }
      }
    }	
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            dockerImageLatest.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }	
            
      }
}

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
 
            stage('Build') {
                  steps {
                        build job: 'SPE_Assignment_Calculator'
                  }
		post {
                success {
                    echo "Now Archiving the Artifacts...."
                    archiveArtifacts artifacts: 'Calculator-1.0-SNAPSHOT.jar'
                }
            }
            }
            stage('Test') {
                  steps {
                        build job: 'SPE_Assignment_Calculator_Test'
                  }
            }
	    stage('Building image') {
      steps{
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

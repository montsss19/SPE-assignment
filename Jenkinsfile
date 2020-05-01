pipeline {
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
            }
            stage('Test') {
                  steps {
                        build job: 'SPE_Assignment_Calculator_Test'
                  }
            }
            
      }
}

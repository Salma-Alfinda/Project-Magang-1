pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('salmaalfinda-DockerHub')
    }
    stages { 

        stage('Build docker image') {
            steps {  
                sh 'docker build -t salmaalfinda/tugas1:$BUILD_NUMBER .'
            }
        }
        stage('Login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push image') {
            steps{
                sh 'docker push salmaalfinda/tugas1:$BUILD_NUMBER'
            }
        }
         stage('Run') {
            steps{
                sh 'docker run -p 3000:3000 -d salmaalfinda/tugas1:$BUILD_NUMBER'
            }
        }
        
}
post {
        always {
            sh 'docker logout'
        }
    }
}

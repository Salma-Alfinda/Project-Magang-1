pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('salmaalfinda-DockerHub')
    }
    stages { 

        stage('Build docker image') {
            steps {  
                sh 'docker build -t salmaalfinda/tugasmagang1:$BUILD_NUMBER .'
            }
        }
        stage('Login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push image') {
            steps{
                sh 'docker push salmaalfinda/tugasmagang1:$BUILD_NUMBER'
            }
        }
        stage('Run') {
            steps{
                sh 'docker run --restart always -p 3010:3000 -d  salmaalfinda/tugasmagang1:$BUILD_NUMBER'
            }
        }
        
}
post {
        always {
            sh 'docker logout'
        }
    }
}

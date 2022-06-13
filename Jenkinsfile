pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
              scm checkout
          }
        }
        stage('Build Docker Compose without cache') {
            steps {
              sh'''
               if ["$deploy" = true]
               then
               sudo docker compose build --no-cache
               sudo docker compose up -d
               sudo docker ps | grep node && sudo docker ps | grep mongo
               '''            
            }
        }
        stage('close the application') {
            steps {
              sh'''
              else ["$deploy=false"]
              then
              sudo docker compose stop
              sudo docker compose down
              '''
            }
    }
}

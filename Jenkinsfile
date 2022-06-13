pipeline {
    agent { label 'baccha' }
    stages {
        stage('Build') {
            steps {
              checkout scm 
          }
        }
        stage('Build Docker Compose without cache') {
            steps {
              sh'''
               if [ "$deploy" = true ]
               then
               sudo docker compose build --no-cache
               sudo docker compose up -d
               sudo docker ps | grep node && sudo docker ps | grep mongo
               else
               echo "recheck"
               fi
               '''            
            }
        }
        stage('close the application') {
            steps {
              sh'''
              if [ "$close" = true ]
              then
              sudo docker compose stop
              sudo docker compose down
              else
              echo "bhkkk"
              fi
              '''
           }
       }
    }
}

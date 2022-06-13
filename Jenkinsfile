pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
              scm checkout https://github.com/29dhruv/NodeJSPOC.git
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
               else
               echo "recheck"
               fi
               '''            
            }
        }
        stage('close the application') {
            steps {
              sh'''
              if 
              ["$deploy=false"]
              then
              sudo docker compose stop
              sudo docker compose down
              else
              echo"bhkkk"
              fi
              '''
            }
    }
 }
}

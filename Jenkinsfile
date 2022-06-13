pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
              checkout([$class: 'GitSCM', 
                branches: [[name: '*/main']],
                doGenerateSubmoduleConfigurations: false,
                extensions: [[$class: 'CleanCheckout']],
                submoduleCfg: [], 
                userRemoteConfigs: [[url: 'https://github.com/29dhruv/NodeJSPOC.git']]])
              sh "ls -ltr"
          }
        }
        stage(Build Docker Compose without cache) {
            steps {
              sh''' sudo docker compose up -d'''
            }
        }
    }
}

pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                echo 'Initializing..'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                echo 'Running pytest..'
            }
        }
        /* stage('Build') {
            steps {  withDockerRegistry([credentialsId: "dockerlogin", url: ""]) {
                 script{
                 app =  docker.build("webserver")
                 }
               }
            }
        } */
        stage('scan') {
            steps { withCredentials([string(credentialsId: 'PCC_CONSOLE_URL', variable: 'CONSOLE'), string(credentialsId: 'PCC_PASS', variable: 'PASS'), string(credentialsId: 'PCC_USER', variable: 'USER')]) {
   
      sh '''
            echo "$CONSOLE"
            curl -k -u "$USER":"$PASS" $CONSOLE/api/v1/util/twistcli --output ./twistcli 
            chmod a+x ./twistcli
            docker build -t webserver .
            docker images
            ./twistcli sandbox  --address "$CONSOLE" --user "$USER"  --password "$PASS" --analysis-duration 2m  --mount "$PWD":/ webserver
            docker images 
            '''
      }
            }
        }
        stage('Cleanup') {
            steps {
                echo 'Cleaning..'
                echo 'Running docker rmi..'
            }
        }
    }
}
//
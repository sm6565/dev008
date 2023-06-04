pipeline {
    agent any
    stages {    
        stage('Build') { 
            steps {
          withCredentials([string(credentialsId: 'PCC_CONSOLE_URL', variable: 'CONSOLE'), string(credentialsId: 'PCC_PASS', variable: 'PASS'), string(credentialsId: 'PCC_USER', variable: 'USER')]) {
   
      sh """
            echo $CONSOLE
             curl -k -u "$USER":"$PASS" $CONSOLE/api/v1/util/twistcli --output ./twistcli 
            chmod a+x ./twistcli
            docker build -t test1 .
            sudo ./twistcli sandbox  --address "$CONSOLE" --user "$USER"  --password "$PASS" --analysis-duration 2m -v  test1
            docker images 
            """ 
      } 
           }   
        }    
        
    }
}
//
pipeline {
    agent none
    stages {
 

        stage('build artifact') {
            agent {
        docker { image 'maven:3.8.1-adoptopenjdk-11' }
          }
            steps {
                sh '''
               
                mvn clean install package
               
            '''
            }
        }

         stage('building  images') {
               agent {
        label "master"
          }
            steps {
                sh '''
              
             
               sudo docker build -t tomcat-image:${BUILD_NUMBER} .
                 
            '''
            }
        }

          stage('deploy') {
               agent {
        label "master"
          }
            steps {
                sh '''
              
               sudo docker  rm -f $(sudo docker ps -aq)
           
               sudo docker run -itd --name tomcat-${BUILD_NUMBER} -p 85:8080  tomcat-image:${BUILD_NUMBER} 
                sudo docker ps   
            '''
            }
        }


    }

}


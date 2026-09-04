pipeline{
    agent any

    environment{
        DOCKER_IMAGE = 'my_nginx_image'
        DOCKER_CONTAINER = 'my_web_app_container'
    }

    stages{
        stage('checkout code'){
            steps{
                git 'https://github.com/ajit010/ci-cd-demo.git'
            }
        }

        stage ('build the docker image'){
            steps{
                // Build the Docker Image
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage ('stop and remove old container'){
            steps{
                // Stop and Remove Old container
                sh 'docker stop $DOCKER_CONTAINER'
                sh 'docker rm $DOCKER_CONTAINER'
            }
        }

        stage ('run docker container'){
            steps{
                // Run a new container from image
                sh 'docker run -d -p 85:80 --name $DOCKER_CONTAINER $DOCKER_IMAGE'
            }
        }

        stage ('clean up'){
            steps{
                // Clean workspace after build
                sh 'docker system prune -f'
            }
        }


    }


    post{
        always{
            cleanWs()  // Clean Workspace after each build
        }

    }

}

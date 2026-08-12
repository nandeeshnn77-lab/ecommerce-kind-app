pipeline {

    agent any

    environment {

        NAMESPACE = 'ecommerce'

        BACKEND_IMAGE = 'ecommerce-backend:latest'

        FRONTEND_IMAGE = 'ecommerce-frontend:latest'

        KIND_CLUSTER = 'devops-cluster'
    }

    stages {

        stage('Checkout') {

            steps {

                echo '======================================'

                echo 'CHECKOUT SOURCE CODE'

                echo '======================================'

                git branch: 'main',
                    url: 'https://github.com/YOUR_USERNAME/ecommerce-kind-app.git'
            }
        }

        stage('Build Backend') {

            steps {

                echo '======================================'

                echo 'BUILD SPRING BOOT APPLICATION'

                echo '======================================'

                sh '''
                    cd backend

                    mvn clean package -DskipTests
                '''
            }
        }

        stage('Build Docker Images') {

            steps {

                echo '======================================'

                echo 'BUILD DOCKER IMAGES'

                echo '======================================'

                sh '''
                    docker build \
                    -t ${BACKEND_IMAGE} \
                    backend

                    docker build \
                    -t ${FRONTEND_IMAGE} \
                    frontend
                '''
            }
        }

        stage('Load Images into Kind') {

            steps {

                echo '======================================'

                echo 'LOAD IMAGES INTO KIND'

                echo '======================================'

                sh '''
                    kind load docker-image \
                    ${BACKEND_IMAGE} \
                    --name ${KIND_CLUSTER}

                    kind load docker-image \
                    ${FRONTEND_IMAGE} \
                    --name ${KIND_CLUSTER}
                '''
            }
        }

        stage('Deploy Application') {

            steps {

                echo '======================================'

                echo 'DEPLOY TO KIND KUBERNETES'

                echo '======================================'

                sh '''
                    kubectl apply \
                    -f k8s/namespace.yaml

                    kubectl apply \
                    -f k8s/mysql.yaml

                    kubectl apply \
                    -f k8s/backend.yaml

                    kubectl apply \
                    -f k8s/frontend.yaml
                '''
            }
        }

        stage('Verify Deployment') {

            steps {

                echo '======================================'

                echo 'VERIFY DEPLOYMENT'

                echo '======================================'

                sh '''
                    kubectl get pods \
                    -n ${NAMESPACE}

                    echo "--------------------------------"

                    kubectl get svc \
                    -n ${NAMESPACE}

                    echo "--------------------------------"

                    kubectl get deployment \
                    -n ${NAMESPACE}
                '''
            }
        }
    }

    post {

        success {

            echo '======================================'

            echo 'E-COMMERCE DEPLOYMENT SUCCESSFUL'

            echo '======================================'
        }

        failure {

            echo '======================================'

            echo 'E-COMMERCE DEPLOYMENT FAILED'

            echo '======================================'
        }
    }
}

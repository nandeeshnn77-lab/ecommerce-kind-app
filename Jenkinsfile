
    
       pipeline {

    agent any

    environment {

        // Kubernetes
        NAMESPACE = 'ecommerce'

        // Docker images
        BACKEND_IMAGE = 'ecommerce-backend:latest'
        FRONTEND_IMAGE = 'ecommerce-frontend:latest'

        // Kind cluster
        KIND_CLUSTER = 'devops-cluster'

        // Project directory inside Jenkins workspace
        PROJECT_DIR = 'ecommerce-kind-app'
    }

    stages {

        // =========================================================
        // 1. CHECKOUT
        // =========================================================
        stage('Checkout') {

            steps {

                echo '======================================'
                echo 'CHECKOUT SOURCE CODE'
                echo '======================================'

                deleteDir()

                git branch: 'main',
                    url: 'https://github.com/nandeeshnn77-lab/ecommerce-kind-app.git'

                echo '======================================'
                echo 'VERIFY SOURCE CODE'
                echo '======================================'

                sh '''
                    echo "Current workspace:"
                    pwd

                    echo "Workspace contents:"
                    ls -la

                    echo "Project contents:"
                    ls -la ${PROJECT_DIR}

                    echo "Project directories:"
                    ls -la ${PROJECT_DIR}/backend
                    ls -la ${PROJECT_DIR}/frontend
                    ls -la ${PROJECT_DIR}/k8s
                '''
            }
        }


        // =========================================================
        // 2. BUILD BACKEND
        // =========================================================
        stage('Build Backend') {

            steps {

                echo '======================================'
                echo 'BUILD SPRING BOOT APPLICATION'
                echo '======================================'

                sh '''
                    cd ${PROJECT_DIR}/backend

                    echo "Backend directory:"
                    pwd

                    echo "Backend files:"
                    ls -la

                    mvn clean package -DskipTests
                '''
            }
        }


        // =========================================================
        // 3. BUILD DOCKER IMAGES
        // =========================================================
        stage('Build Docker Images') {

            steps {

                echo '======================================'
                echo 'BUILD DOCKER IMAGES'
                echo '======================================'

                sh '''
                    echo "Building backend Docker image..."

                    docker build \
                        -t ${BACKEND_IMAGE} \
                        ${PROJECT_DIR}/backend

                    echo "Backend image created."

                    echo "Building frontend Docker image..."

                    docker build \
                        -t ${FRONTEND_IMAGE} \
                        ${PROJECT_DIR}/frontend

                    echo "Frontend image created."

                    echo "Docker images:"
                    docker images | grep ecommerce
                '''
            }
        }


        // =========================================================
        // 4. LOAD IMAGES INTO KIND
        // =========================================================
        stage('Load Images into Kind') {

            steps {

                echo '======================================'
                echo 'LOAD IMAGES INTO KIND'
                echo '======================================'

                sh '''
                    echo "Checking Kind cluster..."

                    kind get clusters

                    echo "Loading backend image..."

                    kind load docker-image \
                        ${BACKEND_IMAGE} \
                        --name ${KIND_CLUSTER}

                    echo "Loading frontend image..."

                    kind load docker-image \
                        ${FRONTEND_IMAGE} \
                        --name ${KIND_CLUSTER}

                    echo "Images loaded into Kind successfully."
                '''
            }
        }


        // =========================================================
        // 5. DEPLOY APPLICATION
        // =========================================================
        stage('Deploy Application') {

            steps {

                echo '======================================'
                echo 'DEPLOY E-COMMERCE APPLICATION'
                echo 'TO KIND KUBERNETES'
                echo '======================================'

                sh '''
                    echo "Current Kubernetes context:"
                    kubectl config current-context

                    echo "Applying namespace..."

                    kubectl apply \
                        -f ${PROJECT_DIR}/k8s/namespace.yaml

                    echo "Applying MySQL..."

                    kubectl apply \
                        -f ${PROJECT_DIR}/k8s/mysql.yaml

                    echo "Applying backend..."

                    kubectl apply \
                        -f ${PROJECT_DIR}/k8s/backend.yaml

                    echo "Applying frontend..."

                    kubectl apply \
                        -f ${PROJECT_DIR}/k8s/frontend.yaml

                    echo "Application manifests applied successfully."
                '''
            }
        }


        // =========================================================
        // 6. WAIT FOR DEPLOYMENT
        // =========================================================
        stage('Wait for Application') {

            steps {

                echo '======================================'
                echo 'WAIT FOR APPLICATION'
                echo '======================================'

                sh '''
                    echo "Waiting for MySQL..."

                    kubectl rollout status \
                        deployment/mysql \
                        -n ${NAMESPACE} \
                        --timeout=180s

                    echo "Waiting for backend..."

                    kubectl rollout status \
                        deployment/backend \
                        -n ${NAMESPACE} \
                        --timeout=180s

                    echo "Waiting for frontend..."

                    kubectl rollout status \
                        deployment/frontend \
                        -n ${NAMESPACE} \
                        --timeout=180s

                    echo "All deployments are ready."
                '''
            }
        }


        // =========================================================
        // 7. VERIFY DEPLOYMENT
        // =========================================================
        stage('Verify Deployment') {

            steps {

                echo '======================================'
                echo 'VERIFY E-COMMERCE DEPLOYMENT'
                echo '======================================'

                sh '''
                    echo ""
                    echo "========== NODES =========="
                    kubectl get nodes

                    echo ""
                    echo "========== PODS =========="
                    kubectl get pods -n ${NAMESPACE} -o wide

                    echo ""
                    echo "========== SERVICES =========="
                    kubectl get svc -n ${NAMESPACE}

                    echo ""
                    echo "========== DEPLOYMENTS =========="
                    kubectl get deployment -n ${NAMESPACE}

                    echo ""
                    echo "========== REPLICASETS =========="
                    kubectl get rs -n ${NAMESPACE}
                '''
            }
        }
    }


    // =============================================================
    // POST ACTIONS
    // =============================================================
    post {

        success {

            echo '======================================'
            echo 'E-COMMERCE DEPLOYMENT SUCCESSFUL'
            echo '======================================'

            echo 'Application has been deployed to Kind Kubernetes.'
        }

        failure {

            echo '======================================'
            echo 'E-COMMERCE DEPLOYMENT FAILED'
            echo '======================================'

            echo 'Please check the failed stage and Jenkins console output.'
        }

        always {

            echo '======================================'
            echo 'PIPELINE COMPLETED'
            echo '======================================'
        }
    }
}

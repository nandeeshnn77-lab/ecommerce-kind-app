clear
ls
[200~apt update
apt upgrade -y~
apt update
sudo apt update
sudo apt upgrade -y
sudo apt install -y curl wget unzip gnupg ca-certificates apt-transport-https software-properties-common
sudo whoami
apt install -y curl wget unzip gnupg ca-certificates apt-transport-https software-properties-common
sudo apt install -y curl wget unzip gnupg ca-certificates apt-transport-https software-properties-common
sudo apt install -y openjdk-17-jdk
java -version
readlink -f $(which java)
echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
source /etc/profileecho 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
echo $JAVA_HOME
java -version
sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> /etc/profile
sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
sudo source /etc/profile
sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> /etc/profile
apt install -y git
sudo apt install -y git
sudo apt install -y maven
mvn -version
sudo apt remove -y docker.io docker-doc docker-compose podman-docker containerd runc 2>/dev/null || true
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg   -o /etc/apt/keyrings/docker.asc
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg   -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable"   > /etc/apt/sources.list.d/docker.list
sudo echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable"   > /etc/apt/sources.list.d/docker.list
sudoapt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg   -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
cat /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
docker --versionr
sudo docker run hello-world
df -h /
sudo usermod -aG docker jenkins
sudo systemctl status jenkins
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install
sudo ./aws/install
rm -rf aws awscliv2.zip
aws sts get-caller-identity
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.34/deb/Release.key   | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.34/deb/Release.key   | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.34/deb/ /'   > /etc/apt/sources.list.d/kubernetes.list
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.34/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
ls -l /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.34/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl
kubectl version --client
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3   -o install-helm.sh
bash install-helm.sh
helm version
rm -f install-helm.sh
sudo apt-get install -y wget gnupg
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key   | gpg --dearmor   -o /usr/share/keyrings/trivy.gpg
sudo wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key   | gpg --dearmor   -o /usr/share/keyrings/trivy.gpg
sudo mkdir -p /usr/share/keyrings
curl -fsSL https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo gpg --dearmor -o /usr/share/keyrings/trivy.gpg
ls -l /usr/share/keyrings/trivy.gpg
sudo apt update
sudo apt install -y trivy
cat /etc/apt/sources.list.d/trivy.list
sudo mkdir -p /usr/share/keyrings
curl -fsSL https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo gpg --dearmor --yes -o /usr/share/keyrings/trivy.gpg
ls -l /usr/share/keyrings/trivy.gpg
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee /etc/apt/sources.list.d/trivy.list
cat /etc/apt/sources.list.d/trivy.list
sudo apt update
sudo apt install -y trivy
trivy --version
echo "===== JAVA ====="
java -version
echo "===== GIT ====="
git --version
echo "===== MAVEN ====="
mvn -version
echo "===== DOCKER ====="
docker --version
echo "===== AWS CLI ====="
aws --version
echo "===== KUBECTL ====="
kubectl version --client
echo "===== HELM ====="
helm version
echo "===== TRIVY ====="
trivy --version
docker ps
sudo usermod -aG docker ubuntu
aws sts get-caller-identity
aws eks update-kubeconfig --region ap-south-1 --name YOUR-EKS-CLUSTER
kubectl get nodes
groups ubuntu
exit

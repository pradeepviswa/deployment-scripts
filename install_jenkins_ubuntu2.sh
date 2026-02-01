# 1️⃣ Update system
sudo apt update -y

# 2️⃣ Install dependencies
sudo apt install -y fontconfig openjdk-17-jre wget gnupg

# 3️⃣ Add Jenkins repo key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# 4️⃣ Add Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# 5️⃣ Update package index again
sudo apt update -y

# 6️⃣ Install Jenkins
sudo apt install -y jenkins

# 7️⃣ Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# 8️⃣ Check Jenkins status
sudo systemctl status jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

 


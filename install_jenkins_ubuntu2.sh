# 1️⃣ Update system
sudo apt update
sudo apt upgrade -y

# 2️⃣ Install dependencies
sudo apt install -y openjdk-17-jdk


# 3️⃣ Add Jenkins official repository key (NEW method)
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# 4️⃣ Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

# 5️⃣ Update apt and install Jenkins
sudo apt update
sudo apt install -y jenkins

# 6️⃣ Start & enable Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# 7️⃣ Open Jenkins in browser
# http://<EC2-PUBLIC-IP>:8080

# 8️⃣ Check Jenkins status
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


 


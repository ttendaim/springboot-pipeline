
<html><body><h1 style="font-size:50px;color:blue;">Tendai | <font style="color:red;">  | <font style="color:green;"> 

</body></html>


# DEVSECOPS CICD Pipeline

## Prereq: Create 2 EC2 servers
- [ ] Build server with 15GB storage - t2.mirco
- [ ] Sonarqube server with 4 GB memory - t2.medium

## Step 1: Ensure all the necessary plugins are installed in Jenkins Master
- [ ] Parameterized trigger plugin
- [ ] Gitlab plugin not neccesary when using github
- [ ] Docker Pipeline
- [ ] Pipeline: AWS steps
- [ ] SonarQube Scanner
- [ ] Quality Gates

## Step 2: Install Docker, Java8, Java11 & Trivy on Build Server
```
$ sudo ./setup.sh
```

## Step 3: Install Sonrqube on the t2.medium server
```
$ sudo apt update
$ sudo apt install -y docker.io
$ sudo usermod -a -G docker ubuntu
$ sudo docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
$ sudo apt install maven


```
#NB: java version on agent has to be the same with the server

## Step 4: Add necessary credentials
- [ ] Generate Sonarqube token of type "global analysis token" and add it as Jenkins credential of type "secret text"
- [ ] Add dockerhub credentials as username/password type
- [ ] Add Gitlab credentials 
- [ ] Add Build server credentials for Jenkins master to connect

# NB: select manually trusted key verification when adding an agent 

## Step 5: Enable Sonarqube webhook for Quality Gates & Install dependency-check plugin
- [ ] Generate webhook & add the Jenkins SERVER/DOMAIN as follows - http://{SERVER/DOMIAN}:8080/sonarqube-webhook/

    - [ ] The webhook is under administration -> configuration  NB: the secret can be ingored 
    - [ ] NB: this will allow jenkins to connect to sonar when on it gets to Quality gate stage

- [ ] - dependency installation should be installed go to  Administration -> Market Place then type dependency
- [ ] - under jenkins update the sonar server instance name or domain for jenkins to be able to scan





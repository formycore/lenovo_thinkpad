# update jenkins.war in windows batch
# 1. download jenkins.war
# 2. stop jenkins
# 3. backup jenkins.war
# 4. replace jenkins.war
# 5. start jenkins
# 6. check jenkins
# 7. send email
# 8. exit
@echo off
setlocal
set jenkins_home=C:\Program Files (x86)\Jenkins
set jenkins_war=jenkins.war
set jenkins_war_bak=jenkins.war.bak
set jenkins_war_url=http://mirrors.jenkins-ci.org/war/latest/jenkins.war
set jenkins_war_tmp=jenkins.war.tmp
set jenkins_log=jenkins.log
set jenkins_log_bak=jenkins.log.bak
set jenkins_log_tmp=jenkins.log.tmp
set jenkins_pid=jenkins.pid
set jenkins_pid_tmp=jenkins.pid.tmp
set jenkins_pid_bak=jenkins.pid.bak
set jenkins_pid_url=http://localhost:8080/jenkins/pid
set jenkins_pid_url_tmp=jenkins.pid.url.tmp
set jenkins_pid_url_bak=jenkins.pid.url.bak
# stop jenkins
taskkill /F /IM java.exe
# backup jenkins.war
if exist %jenkins_war% (
    copy %jenkins_war% %jenkins_war_bak%
)
# download jenkins.war
curl -o %jenkins_war_tmp% %jenkins_war_url%
if exist %jenkins_war_tmp% (
    move %jenkins_war_tmp% %jenkins_war%
)
# backup jenkins.log
if exist %jenkins_log% (
    copy %jenkins_log% %jenkins_log_bak%
)
# backup jenkins.pid
if exist %jenkins_pid% (
    copy %jenkins_pid% %jenkins_pid_bak%
)
# backup jenkins.pid.url
if exist %jenkins_pid_url% (
    copy %jenkins_pid_url% %jenkins_pid_url_bak%
)
# start jenkins
start /b java -jar %jenkins_war% --httpPort=8080
# check jenkins
ping -n 10
curl -o %jenkins_pid_url_tmp% %jenkins_pid_url%

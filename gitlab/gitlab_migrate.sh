# steps for gitlab migrate
# 1. stop gitlab
# 2. backup gitlab
# 3. update gitlab
# 4. start gitlab
# 5. check gitlab
# 6. update httpd
# 7. check httpd
# stop gitlab
    systemctl stop gitlab
# backup gitlab
    gitlab-rake gitlab:backup:create
# update gitlab
    yum -y update gitlab-ce
# start gitlab
    systemctl start gitlab
# check gitlab
    gitlab-rake gitlab:check SANITIZE=true
# update httpd
    yum -y update httpd
# check httpd 
    httpd -v
# end of script


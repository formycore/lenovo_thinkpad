# update httpd in cloudbees
# 2013-11-20
yum -y update  --installroot=/opt/electriccloud/electriccommander/apache/bin/httpd --disablerepo=* --enablerepo=cloudbees-httpd
# yum -y update  --installroot=/opt/electriccloud/electriccommander/apache/bin/httpd --disablerepo=* --enablerepo=cloudbees-httpd --exclude=apr-util-ldap




httpd --disablerepo=* --enablerepo=cloudbees-httpd


/ httpd-2.4.54.el7.redhat.x86_64

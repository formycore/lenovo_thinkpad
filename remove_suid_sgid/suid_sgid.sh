# remove suid and sgid from all files directories in the current directory
# and all subdirectories
chmod -R u-s,g-s *
# how to add suid and sgid to a directory
chmod u+s,g+s directory
# how to add suid and sgid to a file
chmod u+s,g+s file

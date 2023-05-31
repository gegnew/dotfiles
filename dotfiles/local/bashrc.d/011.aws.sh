# export AWS credentials, if they exist
$(cat ~/.aws/credentials | awk '/aws/{print "export " toupper($1) $2 $3}')

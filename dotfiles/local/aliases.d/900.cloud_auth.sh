alias cloudauth="curl https://dev-cloud.relayr.io/oauth/userinfo --header 'Authorization: Bearer your_access_token' | jq '{userId: .userId, orgId: .orgId}'"
# this is also not set up yet
# https://github.com/relayr/developer-resources/blob/master/backend/cloud_auth.md

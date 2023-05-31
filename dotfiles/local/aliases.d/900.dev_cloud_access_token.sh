# alias token_dev="curl --fail -v -d 'username=gerrit.egnew+analytics_demo@relayr.io&password=\$at\%k\$2HVD\&&org=backend-analytics' 'https://login.rlr-eu-dev.relayr.io/oauth/token?client_id=api-client' 2>&1"
#
# export RLR_REFRESH="2053fc9d8eb14892bdf87126e1377525-r"
# token_refresh () {
#     new_token=$(http https://login.rlr-eu-dev.relayr.io/oauth/refresh client_id=="api-client" refresh_token=$RLR_REFRESH | jq | grep 'accessToken' | awk '{gsub(/"/, "", $2); print substr($2, 1, length($2)-1)}')
#     export RLR_TOKEN=$new_token
# }

# https://github.com/relayr/developer-resources/blob/master/backend/access_tokens.md

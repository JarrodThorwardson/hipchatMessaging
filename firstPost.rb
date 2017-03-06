require "HipchatBuildNotices"

# A personal auth token will result in the posts coming from your account.
# https://encoretech.hipchat.com/account/api is the page where you generate such a token.
token = File.read("credentials.txt") #one-line file containing the personal auth token

# /v2/user/{id_or_email}/message is the API endpoint for a private message, requiring a different scope from rooms.
pmurl = File.read("pmUser.txt") #one-line file containing the target URL, for API private message to user
testurl = File.read("host.txt")

testMessage = "This is an automated message testing color."
finishMessage = "This is what it looks like when a build finishes."
errorMessage = "This is what happens when something goes wrong."

begin
 # HipchatBuildNotices.buildStart(token, pmurl, testMessage)
 # HipchatBuildNotices.buildFinish(token, pmurl, finishMessage)
  HipchatBuildNotices.buildError(token, testurl, errorMessage)
rescue RestClient::ExceptionWithResponse => e
  puts(e.response)
end
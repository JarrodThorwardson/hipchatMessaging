require "HipchatBuildNotices"

# A personal auth token will result in the posts coming from your account.
# https://encoretech.hipchat.com/account/api is the page where you generate such a token.
token = File.read("credentials.txt") #one-line file containing the personal auth token

# /v2/user/{id_or_email}/message is the API endpoint for a private message, requiring a different scope from rooms.
# pmurl = File.read("pmUser.txt") #one-line file containing the target URL, for API private message to user
testurl = File.read("host.txt")

vmBuildID = "9001"
procQuant = "1"
memQuant = "8 GB"
OS = "CentOS"
storage = "200 GB"
transit = "1 TB"
customer = "Taylor Swift"
engineerContact = "Wait, Tay has an account with us?"
currentTime = Time.now

verboseTestMessage = ["<br> VM Resources <br> ",
  "Cores: " + procQuant + "<br>", 
  "Memory: " + memQuant + "<br>",
  "OS: " + OS + "<br>",
  "Storage: " + storage + "<br>",
  "Transit: " + transit + "<br>",
  "Customer: " + customer + "<br>",
  "Account Engineer: " + engineerContact + "<br>",
  "Build started at: " + currentTime.inspect + "<br>"].join

testMessage = "This is an automated message testing color."
finishMessage = "This is what it looks like when a build finishes."
errorMessage = "This is what happens when something goes wrong."

begin
 # HipchatBuildNotices.buildStart(token, testurl, verboseTestMessage, vmBuildID)
 # HipchatBuildNotices.buildFinish(token, testurl, verboseTestMessage, vmBuildID)
  HipchatBuildNotices.buildError(token, testurl, verboseTestMessage, vmBuildID)
rescue RestClient::ExceptionWithResponse => e
  puts(e.response)
end
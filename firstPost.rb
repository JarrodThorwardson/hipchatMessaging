require "HipchatNotifications"


# A personal auth token will result in the posts coming from your account.
# https://encoretech.hipchat.com/account/api is the page where you generate such a token.
token = File.read("credentials.txt") #one-line file containing the personal auth token
# tokenRef = "Bearer " + token

# The URL contains information identifying the group this will post to.
# The room id, to my current knowledge, can be found in the room description in a web browser
# /v2/room/{room_id_or_name}/notification is the API endpoint for room notifications
# url = File.read("host.txt") #one-line file containing the target URL, for API post to room

# /v2/user/{id_or_email}/message is the API endpoint for a private message, requiring a different scope from rooms.
pmurl = File.read("pmUser.txt") #one-line file containing the target URL, for API private message to user

testMessage = "This is an automated message testing color."

# pmpayload = { 'message_format'=> 'text', 'notify'=> 'false', 'message'=> testPost } # 'notify' => false,

# jsonpayload = JSON.generate(pmpayload)

# payload = { 'message_format' => 'text', 'message' => testPost } 

# headers = { 'Authorization' => tokenRef, :content_type => 'application/json' }

#puts(RestClient.get(histurl, headers))

begin
HipchatNotifications.privateMessage(token, pmurl, testMessage, "green")
rescue RestClient::ExceptionWithResponse => e
  puts(e.response)
end
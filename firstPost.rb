require "HipchatNotifications"

# A personal auth token will result in the posts coming from your account.
# https://api.hipchat.com/account/api is the page where you generate such a token.
token = File.read("credentials.txt") #one-line file containing the personal auth token

# /v2/user/{id_or_email}/message is the API endpoint for a private message, requiring a different scope from rooms.
pmurl = File.read("pmUser.txt") #one-line file containing the target URL, for API private message to user
testurl = File.read("host.txt")
getTestURL = File.read("hist.txt")

testObjectGet = HipchatNotifications.new(token)

begin
  puts("Enter recipient: ")
  recipient = gets.chomp
  puts("Enter message to send: ")
  message = gets.chomp
  testObjectGet.sendMessage(pmurl,recipient,message)
  rooms = testObjectGet.getFoo(getTestURL)
  rooms.each do |room|
    puts(room)
    if (room.is_a?(Array))
      puts(room.to_s + " is an Array.")
    end
    if (room.is_a?(Hash))
      puts(room[:name])
    end
  end
rescue RestClient::ExceptionWithResponse => e
  puts(e.response)
end
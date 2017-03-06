class HipchatNotifications
  require "rest-client"
  require "json"

  def self.privateMessage(authToken, endpointURL, message, color, pushNotification, messagePrefix)
    authString = "Bearer " + authToken
    testPost = "<span style=\"color:"+color+"\">" + messagePrefix + "</span>" + message
    pmpayload = JSON.generate({ 'message_format'=> 'html', 'notify'=> pushNotification, 'message'=> testPost })
    headers = { 'Authorization' => authString, :content_type => 'application/json' }
    begin
      RestClient.post(endpointURL, pmpayload, headers)
    rescue RestClient::ExceptionWithResponse => e
      puts(e.response)
    end
  end

end
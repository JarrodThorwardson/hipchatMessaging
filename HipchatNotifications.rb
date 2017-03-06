class HipchatNotifications
  require "rest-client"
  require "json"

  def self.privateMessage(authToken, endpointURL, message, color)
    authString = "Bearer " + authToken
    testPost = "<span style=\"color:"+color+"\">" + message + "</span>"
    pmpayload = JSON.generate({ 'message_format'=> 'html', 'notify'=> 'false', 'message'=> testPost })
    #jsonpayload = JSON.generate(pmpayload)
    headers = { 'Authorization' => authString, :content_type => 'application/json' }
    begin
      RestClient.post(endpointURL, pmpayload, headers)
    rescue RestClient::ExceptionWithResponse => e
      puts(e.response)
    end
  end

end
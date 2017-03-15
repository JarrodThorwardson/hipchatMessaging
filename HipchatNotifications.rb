class HipchatNotifications
  require "rest-client"
  require "json"

  def initialize(token)
    authToken = "Bearer " + token
    @headers = { 'Authorization' => authToken, :content_type => 'application/json' }
  end

  def sendMessage(endpointURL, recipient, message)
    url = endpointURL + recipient + "/message"
    testPost = message
    payload = JSON.generate({ 'message_format'=> 'html','message'=> testPost })
    begin
      RestClient.post(url, payload, @headers)
    rescue RestClient::ExceptionWithResponse => e
      puts(e.response)
    end
  end
  
  def sendRoomNotification(endpointURL, room, message)
      url = endpointURL + room + "/notification"
      testPost = message
      payload = JSON.generate({ 'message_format'=> 'html','message'=> testPost })
      begin
        RestClient.post(url, payload, @headers)
      rescue RestClient::ExceptionWithResponse => e
        puts(e.response)
      end
    end
    
  def getFoo(endPointURL)
    kk = endPointURL
    begin
      JSON.parse(RestClient.get(kk, @headers), {:object_class => Hash})
    rescue RestClient::ExceptionWithResponse => e
      puts(e.response)
    end
  end
end
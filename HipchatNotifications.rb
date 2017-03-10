class HipchatNotifications
  require "rest-client"
  require "json"
  
  def initialize(token)
    authToken = "Bearer " + token
    @headers = { 'Authorization' => authToken, :content_type => 'application/json' }
  end

  def privateMessage(endpointURL, message, color, pushNotification, messagePrefix)
    testPost = "<span style=\"color:"+color+"\">" + messagePrefix + "</span>" + message
    pmpayload = JSON.generate({ 'message_format'=> 'html', 'notify'=> pushNotification, 'message'=> testPost })
    begin
      RestClient.post(endpointURL, pmpayload, @headers)
    rescue RestClient::ExceptionWithResponse => e
      puts(e.response)
    end
  end

  def getFoo(endPointURL)
  kk = endPointURL
    begin
    RestClient.get(kk, @headers)
    rescue RestClient::ExceptionWithResponse => e
      puts(e.response)
    end
  end

  def buildStart(endpointURL, message, buildID)
    pushNotification = "false"
    color = "green"
    noticePrefix = "NOTICE: Build " + buildID + " started.<br>"
    self.privateMessage(endpointURL,message,color, pushNotification, noticePrefix)
  end

  def buildFinish(endpointURL, message, buildID)
    pushNotification = "false"
    color = "green"
    noticePrefix = "NOTICE: Build " + buildID + " finished.<br>"
    self.privateMessage(endpointURL,message,color, pushNotification, noticePrefix)
  end

  def buildError(endpointURL, message, buildID)
    pushNotification = "true"
    color = "red"
    noticePrefix = "ERROR: Build " + buildID + " failed.<br>"
    self.privateMessage(endpointURL,message,color, pushNotification, noticePrefix)
  end

end
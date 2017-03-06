class HipchatBuildNotices
  require "HipchatNotifications"

  def self.buildStart(authToken, endpointURL, message)
    pushNotification = "false"
    color = "green"
    noticeMessage = "NOTICE: " + message
    HipchatNotifications.privateMessage(authToken,endpointURL,noticeMessage,color, pushNotification)
  end

  def self.buildFinish(authToken, endpointURL, message)
    pushNotification = "false"
    color = "green"
    noticeMessage = "NOTICE: " + message
    HipchatNotifications.privateMessage(authToken,endpointURL,noticeMessage,color, pushNotification)
  end

  def self.buildError(authToken, endpointURL, message)
    pushNotification = "true"
    color = "red"
    noticeMessage = "ERROR: " + message
    HipchatNotifications.privateMessage(authToken,endpointURL,noticeMessage,color, pushNotification)
  end

end
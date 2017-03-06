class HipchatBuildNotices
  require "HipchatNotifications"

  def self.buildStart(authToken, endpointURL, message)
    pushNotification = "false"
    color = "green"
    noticePrefix = "NOTICE: "
    HipchatNotifications.privateMessage(authToken,endpointURL,message,color, pushNotification, noticePrefix)
  end

  def self.buildFinish(authToken, endpointURL, message)
    pushNotification = "false"
    color = "green"
    noticePrefix = "NOTICE: "
    HipchatNotifications.privateMessage(authToken,endpointURL,message,color, pushNotification, noticePrefix)
  end

  def self.buildError(authToken, endpointURL, message)
    pushNotification = "true"
    color = "red"
    noticePrefix = "ERROR: "
    HipchatNotifications.privateMessage(authToken,endpointURL,message,color, pushNotification, noticePrefix)
  end

end
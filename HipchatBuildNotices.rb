class HipchatBuildNotices
  require "HipchatNotifications"

  def self.buildStart(authToken, endpointURL, message, buildID)
    pushNotification = "false"
    color = "green"
    noticePrefix = "NOTICE: Build " + buildID + " started.<br>"
    HipchatNotifications.privateMessage(authToken,endpointURL,message,color, pushNotification, noticePrefix)
  end

  def self.buildFinish(authToken, endpointURL, message, buildID)
    pushNotification = "false"
    color = "green"
    noticePrefix = "NOTICE: Build " + buildID + " finished.<br>"
    HipchatNotifications.privateMessage(authToken,endpointURL,message,color, pushNotification, noticePrefix)
  end

  def self.buildError(authToken, endpointURL, message, buildID)
    pushNotification = "true"
    color = "red"
    noticePrefix = "ERROR: Build " + buildID + " failed.<br>"
    HipchatNotifications.privateMessage(authToken,endpointURL,message,color, pushNotification, noticePrefix)
  end

end
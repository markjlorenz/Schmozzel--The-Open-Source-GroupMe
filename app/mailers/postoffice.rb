class Postoffice < ActionMailer::Base
  default :from => "natter@schmozzel.com"
  def natter(to, message, schmozzeler=nil, thread="natter@schmozzel.com")
    @schmozzeler = schmozzeler
    @message = message
    mail(:to=>to, from:thread)
  end

  def error(to)
    mail(:to=>to)
  end

end

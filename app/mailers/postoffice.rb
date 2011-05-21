class Postoffice < ActionMailer::Base
  default :from => "natter@schmozzel.com"
  def natter(to, message)
    @message = message
    mail(:to=>to)
  end

  def error(to)
    mail(:to=>to)
  end
end

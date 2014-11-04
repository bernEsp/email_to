class MailBox < ActionMailer::Base
  default from: "noreplay@example.com"

  def add(data)
    mail(to: "test@e.com") do |format|
      format.text { render text: data["body"] }
    end
  end
end

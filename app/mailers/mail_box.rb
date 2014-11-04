class MailBox < ActionMailer::Base
  default from: "noreplay@example.com"

  def add(data)
    mail(to: data[:to]) do |format|
      format.text { render text: data["body"] }
    end
  end
end

class MailBox < ActionMailer::Base
  Email = Struct.new(:subject, :body)

  after_action :build_email
  default from: "noreplay@example.com(mailto:noreplay@example.com)"

  def add(recipients, data={})
    @recipients = recipients
    @data = data
  end

  private
    def build_email
      email = Email.new(@data[:subject], @data.fetch(:body,"")) 
      mail(to: @recipients, subject: email.subject, body: email.body, content_type: "text/html")
    end

end

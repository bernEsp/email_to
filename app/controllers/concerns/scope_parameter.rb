module ScopeParameter
  extend ActiveSupport::Concern

  included do
    before_filter :validate_params, :recipients
  end

  private
    def validate_params
      invalid_request if params.nil?
    end

    def recipients_valid?
      valid_recipients = @recipients.map {|recipient| email_regex.match(recipient.to_s)} 
      valid_recipients.include?(nil)
    end

    def recipients
      invalid_request unless params[:to]
      @recipients = params[:to].split(',')
      invalid_request if @recipients.empty? || recipients_valid? 
    end

    def email_regex
      Regexp.new('(?:^([^<@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z|^(?:\w+\s)+<{1}([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})(?:>{1}$))', true)
    end

end

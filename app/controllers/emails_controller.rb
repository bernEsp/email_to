class EmailsController < ApplicationController
  include ScopeParameter

  def index
    render file: "public/422.html"
  end

  def create
    mailer = MailBox.add(@recipients, params)
    if mailer.deliver
      render json: @recipients.to_json,  status: :ok
    else
      invalid_request
    end
  end
end

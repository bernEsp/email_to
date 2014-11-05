class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  rescue_from ActionController::UnknownFormat, with: :invalid_format
  respond_to :json

  private
  def invalid_request
    respond_with nil do |format|
      format.json {render json: "please check structure", status: :unprocessable_entity}
    end
  end

  def invalid_format
    render json: "{to: jhon@example.com, subject: test, body: test}", status: :unprocessable_entity
  end
end

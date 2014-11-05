class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  rescue_from ActionController::UnknownFormat, with: :invalid_format
  respond_to :json
  respond_to :html, only: :index

  private
  def invalid_request
    respond_with nil do |format|
      format.json {render json: "please send this structure #{default_structure}", status: :unprocessable_entity}
    end
  end

  def invalid_format
    render json: default_structure, status: :unprocessable_entity
  end

  def default_structure
    "{to: jhon@example.com[,bill@example.com | bernardo galindo <bernardo.galindo@example.com>], subject: test, body: test}"
  end
end

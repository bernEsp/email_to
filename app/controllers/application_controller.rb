class ApplicationController < ActionController::API
  rescue_from ActionController::UnknownFormat, with: :invalid_format

  private
  def invalid_format
    render json: "invalid option", status: :unprocessable_entity
  end
end

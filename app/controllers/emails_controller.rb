class EmailsController < ApplicationController
  include ActionController::MimeResponds
  respond_to :json

  def create
    respond_with do |format|
      format.json { render text: "success", status: :ok}
    end
  end
end

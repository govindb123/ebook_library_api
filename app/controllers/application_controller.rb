class ApplicationController < ActionController::API
	include Rails.application.routes.url_helpers

  rescue_from ActiveRecord::RecordNotFound do
    error_response(
      "Ebook not found",
      [],
      :not_found
    )
  end
  
  private

  def success_response(data = nil, message = "Success", status = :ok)
    render json: { success: true, message: message, data: data }, status: status
  end

  def error_response(message = "Something went wrong", errors = [], status = :unprocessable_entity)
    render json: { success: false, message: message, errors: errors }, status: status
  end
end
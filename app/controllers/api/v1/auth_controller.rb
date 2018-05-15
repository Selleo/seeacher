class Api::V1::AuthController < Api::V1::BaseApiController
  def is_signed_in?
    if user_signed_in?
      render json: { 'signed_in' => true, 'user' => current_user }.to_json
    else
      render json: {}, status: 403
    end
  end
end

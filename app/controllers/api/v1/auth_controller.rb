class Api::V1::AuthController < Api::V1::BaseApiController
  def is_signed_in?
    render json: { 'signed_in' => user_signed_in?, 'user' => current_user }.to_json
  end
end

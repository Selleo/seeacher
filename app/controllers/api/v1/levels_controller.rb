class Api::V1::LevelsController < Api::V1::BaseApiController
  def level
    level = Level.find(params[:level_id])
    response_body = []

    level.words.each do |word|
      word_hash = {}
      word_hash['word'] = word.content
      word_hash['image'] = "http:#{word.guests.last.image.url}"
      word_hash['uuid'] = SecureRandom.uuid
      response_body << word_hash
    end

    render json: response_body, status: :ok
  end
end

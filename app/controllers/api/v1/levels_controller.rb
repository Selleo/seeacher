class Api::V1::LevelsController < Api::V1::BaseApiController
  def levels
    response_body = []
    Level.all.each do |level|
      response_body << level_hash(level)
    end
    render json: response_body, status: :ok
  end

  def level
    level = Level.find(params[:level_id])
    response_body = []

    level_words(level).each do |word|
      word_hash = {}
      word_hash['word'] = word.content
      word_hash['image'] = "http:#{word.guests.last.image.url}"
      word_hash['uuid'] = SecureRandom.uuid
      response_body << word_hash
    end

    render json: response_body, status: :ok
  end

  private

  def level_words(level)
    levels_with_lower_order = Level.where('levels.order < ?', level.order)
    words = levels_with_lower_order.map(&:words)
    words << level.words
    words.flatten
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def level_hash(level)
    level_hash = {}
    user_level = level.user_level_for(user)
    level_hash['passed'] = user_level&.passed
    level_hash['total'] = level_words(level).count
    level_hash['words'] = level.words.map(&:content)
    level_hash['image'] = level.image.url
    level_hash['id'] = level.id
    level_hash
  end

  def level_params
    params.require(:user_id)
  end
end

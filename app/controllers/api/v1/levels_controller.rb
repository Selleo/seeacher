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
      response_body << word_hash(word)
    end
    render json: response_body, status: :ok
  end

  private

  def word_hash(word)
    word_hash = {}
    word_hash['word'] = word.content
    if word.guests&.last&.image&.exists?
      word_hash['image_thumb'] = "https:#{word.guests.last.image.url(:thumb)}"
      word_hash['image_normal'] = "https:#{word.guests.last.image.url(:normal)}"
    end
    word_hash['uuid'] = SecureRandom.uuid
    word_hash
  end

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
    level_hash['passed'] = level.user_level_for(user)&.passed
    level_hash['total'] = level_words(level).count
    level_hash['words'] = level.words.map(&:content)
    if level.image.exists?
      level_hash['image_thumb'] = "https:#{level.image.url(:thumb)}"
      level_hash['image_normal'] = "https:#{level.image.url(:normal)}"
    end
    level_hash['id'] = level.id
    level_hash
  end

  def level_params
    params.require(:user_id)
  end
end

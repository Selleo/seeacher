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

  def update_progress
    level = nil
    if user_level
      user_level.update(passed: level_progress_params['passed']) if user_made_progress?
    else
      level = create_user_level
    end
    render json: { user_level_id: user_level&.id || level&.id }, status: :ok
  end

  private

  def create_user_level
    UserLevel.create(
      passed: level_progress_params['passed'],
      user_id: user.id,
      level_id: level_progress_params['level_id']
    )
  end

  def user_made_progress?
    user_level.passed <= level_progress_params['passed'].to_i
  end

  def user_level
    @user_level ||= UserLevel.find_by(level_id: level_progress_params['level_id'].to_i, user_id: user&.id)
  end

  def word_hash(word)
    word_hash = {}
    word_hash['word'] = word.content
    word_hash['image_thumb'] = word_image_thumb(word)
    word_hash['image_normal'] = word_image_normal(word)
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
    level_hash['passed'] = level_passed_for(level)
    level_hash['total'] = level_words(level).count
    level_hash['words'] = level.words.map(&:content)
    level_hash['image_thumb'] = level_image_thumb(level)
    level_hash['image_normal'] = level_image_normal(level)
    level_hash['id'] = level.id
    level_hash
  end

  def level_passed_for(level)
    level.user_level_for(user)&.passed || ''
  end

  def word_image_normal(word)
    word.guests&.last&.image&.exists? ? "https:#{word.guests.last.image.url(:normal)}" : ''
  end

  def word_image_thumb(word)
    word.guests&.last&.image&.exists? ? "https:#{word.guests.last.image.url(:thumb)}" : ''
  end

  def level_image_thumb(level)
    level.image.exists? ? "https:#{level.image.url(:thumb)}" : ''
  end

  def level_image_normal(level)
    level.image.exists? ? "https:#{level.image.url(:normal)}" : ''
  end

  def level_progress_params
    params.require(:level_progress).permit(:passed, :level_id)
  end

  def level_params
    params.require(:user_id)
  end
end

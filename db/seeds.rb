unless User.find_by(admin: true)
  User.create!(
    admin: true,
    email: 'admin@selleo.com',
    password: ENV.fetch('ADMIN_PASSWORD'),
    password_confirmation: ENV.fetch('ADMIN_PASSWORD')
  )
end

if Rails.env.development?
  user = User.create(email: 'dummy_user@selleo.com', password: 'password')
  5.times do |i|
    Level.create(order: i + 1)
  end
  Level.all.each_with_index do |level, i|
    5.times do
      word = Word.create(
        content: ('a'..'z').to_a.sample,
        level_id: level.id
      )
      word.guests << Guest.create(word_id: word.id)
    end
    passed = if i.zero?
               level.words.count
             elsif i == 1
               rand(level.words.count) + 1
             else
               0
             end
    UserLevel.create(
      user_id: user.id,
      level_id: level.id,
      passed: passed
    )
  end
end

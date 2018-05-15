User.create!(
  admin: true,
  email: 'admin@selleo.com',
  password: ENV.fetch('ADMIN_PASSWORD'),
  password_confirmation: ENV.fetch('ADMIN_PASSWORD')
)

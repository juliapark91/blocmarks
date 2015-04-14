ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  port:              587, 
  address:           'smtp.mailgun.org',
  user_name:         ENV['MAILGUN_SMTP_LOGIN'],
  password:          ENV['MAILGUN_SMTP_PASSWORD'],
  domain:            'sandboxb4dc928d0580438680929963b942a985.mailgun.org',
  authentication:    :plain,
  content_type:      'text/html'
}
# if Rails.env.production? || Rails.env.development?
  # ActionMailer::Base.smtp_settings = {
  #   :address              => 'smtp.mailgun.org',
  #   :port                 => 587,
  #   :domain               => 'julia-blocmarks.herokuapp.com',
  #   :user_name            => ENV['MAILGUN_SMTP_LOGIN'],
  #   :password             => ENV['MAILGUN_SMTP_PASSWORD'],
  #   :authentication       => 'plain',
  #   :content_type         => 'text/html'
  # }
# else
#   ActionMailer::Base.smtp_settings = {
#     :tls                  => false,
#     :address              => 'smtp.gmail.com',
#     :port                 => 587,
#     :domain               => 'gmail.com',
#     :user_name            => 'juliabloctest@gmail.com',
#     :password             => 'julia94403',
#     :authentication       => 'plain',
#     :enable_starttls_auto => true
#   }
# end

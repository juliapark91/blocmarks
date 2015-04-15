ActionMailer::Base.delivery_method = :smtp

if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :tls                  => false,
    :address              => 'smtp.mailgun.org',
    :port                 => 587,
    :domain               => 'julia-blocmarks.herokuapp.com',
    :user_name            => ENV['MAILGUN_SMTP_LOGIN'],
    :password             => ENV['MAILGUN_SMTP_PASSWORD'],
    :authentication       => 'plain',
    :content_type         => 'text/html',
    :enable_starttls_auto => true
  }
else
  ActionMailer::Base.smtp_settings = {
    :tls                  => false,
    :address              => 'smtp.gmail.com',
    :port                 => 587,
    :domain               => 'gmail.com',
    :user_name            => 'juliabloctest@gmail.com',
    :password             => 'julia94403',
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }
  
  ActionMailer::Base.register_interceptor( DevelopmentMailInterceptor )
end

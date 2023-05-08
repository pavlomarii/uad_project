# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  username: 'apikey',
  password: ENV["SENDGRID_API_KEY"],
  domain: "uad-articles.herokuapp.com",
  address: "smtp.sendgrid.net",
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

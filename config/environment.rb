# frozen_string_literal: true

# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    user_name: ENV["GMAIL_USER_NAME"],
    password: ENV["GMAIL_PASSWORD"],
    domain: "gmail.com",
    authentication: :plain,
    enable_starttls_auto: true
  }
end

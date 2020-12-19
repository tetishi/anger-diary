# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "support@anger-diary.herokuapp.com"
  layout "mailer"
end

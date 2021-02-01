# frozen_string_literal: true

require "rails_helper"

feature "OmniauthUsers", js: true, type: :feature do
  background do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  scenario "creating new user account" do
    visit root_path
    expect {
      click_on ""
    }
  end
end

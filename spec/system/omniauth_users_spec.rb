# frozen_string_literal: true

require "rails_helper"

feature "OmniauthUsers", js: true, type: :feature do
  background do
    binding.pry
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  scenario "creating new user account" do
    visit root_path
    click_on "新規登録"
    binding.pry
    expect {
      click_on "Googleでログイン"
    }.to change(User, :count).by(1)

    assert_text "Google アカウントによる認証に成功しました。"
  end
end

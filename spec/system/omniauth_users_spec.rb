# frozen_string_literal: true

require "rails_helper"

feature "OmniauthUsers", js: true, type: :feature do
  background do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = google_oauth2_mock
  end

  scenario "creating new user account with google" do
    visit root_path

    click_on "新規登録"
    expect {
      click_on "Googleでログイン"
    }.to change(User, :count).by(1)

    assert_text "Google アカウントによる認証に成功しました。"
  end

  scenario "updating a user account with google" do
    visit root_path

    click_on "新規登録"
    expect {
      click_on "Googleでログイン"
    }.to change(User, :count).by(1)

    assert_text "Google アカウントによる認証に成功しました。"

    visit edit_user_registration_path
    fill_in "ユーザー名", with: "Tetsuro"
    fill_in "Eメール", with: "example@icloud.com"
    click_on "更新"
    expect(page).to have_content "アカウント情報を変更しました。変更されたメールアドレスの本人確認のため、本人確認用メールより確認処理をおこなってください。"
  end
end

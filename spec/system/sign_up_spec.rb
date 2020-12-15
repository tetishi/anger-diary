require "rails_helper"

feature "Sign up", js: true, type: :feature do
  background do
    @user = build(:user)
  end

  scenario "creating new user account" do
    visit new_user_registration_path
    fill_in "ユーザー名", with: @user.username
    fill_in "Eメール", with: @user.email
    fill_in "パスワード", with: @user.password
    fill_in "パスワード（確認用）", with: @user.password
    click_on "アカウント登録"
    expect(page).to have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"
  end
end

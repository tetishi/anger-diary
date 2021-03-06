# frozen_string_literal: true

require "rails_helper"

feature "Users", js: true, type: :feature do
  context "without login user" do
    background do
      @user = build(:user)
    end

    scenario "creating new user account" do
      visit root_path
      click_on "新規登録"
      fill_in "ユーザー名", with: @user.username
      fill_in "Eメール", with: @user.email
      fill_in "パスワード", with: @user.password
      fill_in "パスワード（確認用）", with: @user.password
      click_on "アカウント登録"
      expect(page).to have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"
    end

    scenario "resending a confirmation instruction" do
      visit new_user_registration_path
      fill_in "ユーザー名", with: @user.username
      fill_in "Eメール", with: @user.email
      fill_in "パスワード", with: @user.password
      fill_in "パスワード（確認用）", with: @user.password
      click_on "アカウント登録"
      expect(page).to have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"

      visit new_user_registration_path
      click_on "本人確認のメールを受け取っていない"

      fill_in "Eメール", with: @user.email
      click_on "アカウント確認メール再送"
      expect(page).to have_content "アカウントの有効化について数分以内にメールでご連絡します。"
    end
  end

  context "with login user" do
    background do
      @login_user = create(:user)
      login_as(@login_user, scope: :user)
    end

    scenario "updating a user account" do
      visit edit_user_registration_path
      fill_in "ユーザー名", with: "Tetsuro"
      fill_in "Eメール", with: "example@icloud.com"
      fill_in "パスワード", with: "12345678"
      fill_in "パスワード（確認用）", with: "12345678"
      fill_in "現在のパスワード", with: @login_user.password
      click_on "更新"
      expect(page).to have_content "アカウント情報を変更しました。変更されたメールアドレスの本人確認のため、本人確認用メールより確認処理をおこなってください。"
    end

    scenario "destroying a user account" do
      visit root_path
      page.accept_confirm do
        click_on "ログアウト"
      end
      expect(page).to have_content "ログアウトしました。"
    end

    scenario "logging into an existing user account" do
      visit root_path
      page.accept_confirm do
        click_on "ログアウト"
      end
      expect(page).to have_content "ログアウトしました。"

      visit new_user_session_path
      fill_in "Eメール", with: @login_user.email
      fill_in "パスワード", with: @login_user.password
      click_button "ログイン"
      expect(page).to have_content "ログインしました。"
    end

    scenario "resetting password" do
      visit root_path
      page.accept_confirm do
        click_on "ログアウト"
      end
      expect(page).to have_content "ログアウトしました。"

      visit new_user_session_path
      click_on "パスワードを忘れた"

      fill_in "Eメール", with: @login_user.email
      click_on "パスワードの再設定方法を送信する"
      expect(page).to have_content "パスワードの再設定について数分以内にメールでご連絡いたします。"
    end
  end
end

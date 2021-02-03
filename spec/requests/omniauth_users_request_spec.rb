# frozen_string_literal: true

require "rails_helper"

describe "Sessions", type: :request do
  let(:oauth_user) { google_oauth2_mock }
  let(:user) { User.where(provider: oauth_user.provider, uid: oauth_user.uid).first }

  describe "POST #create" do
    before do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = google_oauth2_mock
    end

    context "with a valid mock" do
      it "signs user in with google" do
        get user_google_oauth2_omniauth_callback_path
        expect(controller.current_user).to eq(user)
      end
    end
  end

  describe "GET #failure" do
    before do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = google_oauth2_invalid_mock
    end

    context "with an invalid mock" do
      it "fails to create a user with google" do
        get user_google_oauth2_omniauth_callback_path
        expect(controller.current_user).to be_nil
      end
    end
  end
end

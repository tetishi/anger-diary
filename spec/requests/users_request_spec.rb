# frozen_string_literal: true

require "rails_helper"

describe "Sessions", type: :request do
  let(:user) { create(:user) }
  let(:invalid_user_params) { attributes_for(:user, email: "") }

  describe "POST #create" do
    before do
      ActionMailer::Base.deliveries.clear
    end

    context "with valid user params" do
      it "signs user in" do
        sign_in user
        get authenticated_root_path
        expect(controller.current_user).to eq(user)
      end

      it "signs user out" do
        sign_in user
        get authenticated_root_path
        expect(controller.current_user).to eq(user)

        sign_out user
        get authenticated_root_path
        expect(controller.current_user).to be_nil
      end
    end

    context "with invalid user params" do
      it "does not send a confirmation email" do
        post user_registration_path, params: { user: invalid_user_params }
        expect(ActionMailer::Base.deliveries.size).to eq 0
      end

      it "fails to create a user" do
        expect {
          post user_registration_path, params: { user: invalid_user_params }
        }.to_not change(User, :count)
      end
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }
#   let(:invalid_user) { create(:user, email: "") }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, email: "") }

  describe "POST #create" do
    before do
      ActionMailer::Base.deliveries.clear
    end
    context "with valid user params" do
      it "signs user in and out" do
        sign_in user
        get authenticated_root_path
        expect(controller.current_user).to eq(user)

        sign_out user
        get authenticated_root_path
        expect(controller.current_user).to be_nil
      end
    #   it "sends a confirmation email" do
    #     post user_registration_path
    #     expect(ActionMailer::Base.deliveries.size).to eq 1
    #   end
    end
    context "with invalid user params" do
      it "does not send a confirmation email" do
        # binding.pry
        post user_registration_path, params: { user: invalid_user_params }
        expect(ActionMailer::Base.deliveries.size).to eq 0
      end

      it "fails to create a user" do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end

    #   it "displays an error" do
    #     # binding.pry
    #     post user_registration_path, params: { user: invalid_user_params }
    #     expect(response.body).to raise_error RSpec::Expectations::ExpectationNotMetError
    #   end
    
    #   it "does not sign user in" do
    #     expect do
    #       sign_in invalid_user
    #       expect{ get authenticated_root_path }.to raise_error ActiveRecord::RecordInvalid
    #     end.to_not change(User, :count)
    #   end
    end
  end
end

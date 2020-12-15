# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe "#create" do
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is invalid without a username" do
      @user.username = nil
      expect(@user).to_not be_valid
    end

    it "is invalid with a wrong format email" do
      @user.email = "aoeo232.com"
      expect(@user).to_not be_valid
    end

    it "is invalid with a password contains less than 6 characters" do
      @user.password = "12345"
      expect(@user).to_not be_valid
    end

    it "is invalid putting diffrent password in the feild of confirm password" do
      @user.password = "123456"
      @user.password_confirmation = "654321"
      expect(@user).to_not be_valid
    end
  end
end

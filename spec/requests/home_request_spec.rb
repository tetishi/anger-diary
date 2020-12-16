# frozen_string_literal: true

require "rails_helper"

describe "Home", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end

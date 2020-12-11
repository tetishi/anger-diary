# frozen_string_literal: true

class Users::ApplicationController < ApplicationController
  before_action :authenticate_user!
end

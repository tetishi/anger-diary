# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
  end
end

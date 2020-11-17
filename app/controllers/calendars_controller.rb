# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    @calendars = AngerRecord.all
  end
end

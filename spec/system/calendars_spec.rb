# frozen_string_literal: true

require "rails_helper"

feature "Calendars", js: true, type: :feature do
  scenario "visiting the index" do
    visit calendars_path
    expect(page).to have_selector "th", text: "日"
  end
end

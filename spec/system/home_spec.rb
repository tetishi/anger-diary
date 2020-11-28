# frozen_string_literal: true

require "rails_helper"

feature "Home", js: true, type: :feature do
  scenario "visiting homepage" do
    visit root_path
    expect(page).to have_selector "h1", text: "アンガーダイアリー"
  end
end

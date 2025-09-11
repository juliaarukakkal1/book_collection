# spec/system/book_creation_spec.rb
require "rails_helper"

RSpec.describe "Book creation", type: :system do
  # Use fast non-JS driver
  before do
    driven_by :rack_test
  end

  scenario "Sunny day: user creates a book successfully" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    click_button "Create Book"
    expect(page).to have_text("Book was successfully created")
    expect(Book.last.title).to eq("The Hobbit")
  end

  scenario "Rainy day: fails when title is blank" do
    visit new_book_path
    fill_in "Title", with: ""
    click_button "Create Book"
    expect(page).to have_text("Title can't be blank").or have_text("Error creating book")
  end
end

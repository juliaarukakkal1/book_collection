# spec/system/book_creation_attributes_spec.rb
require 'rails_helper'

RSpec.describe "Book creation validations", type: :system do
  before do
    driven_by :selenium_chrome
  end

  it "fails without a title" do
    visit new_book_path
    save_and_open_page
    fill_in "Author", with: "J.R.R. Tolkien"
    fill_in "Price", with: 15.99
    select "2006", from: "book_published_date_1i"
    select "September", from: "book_published_date_2i"
    select "21", from: "book_published_date_3i"
    click_button "Create Book"
    puts page.body                     # prints full HTML
    puts page.text                     # prints visible text
    puts page.find(".alert").text rescue puts "No alert found"  # if you used flash[:alert]

    expect(page).to have_text("Title can't be blank").or have_text("Error creating book")
  end

  it "fails without an author" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    fill_in "Price", with: 15.99
    select "2006", from: "book_published_date_1i"
    select "September", from: "book_published_date_2i"
    select "21", from: "book_published_date_3i"
    click_button "Create Book"
    expect(page).to have_text("Author can't be blank").or have_text("Error creating book")
  end

  it "fails without a price" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: "J.R.R. Tolkien"
    select "2006", from: "book_published_date_1i"
    select "September", from: "book_published_date_2i"
    select "21", from: "book_published_date_3i"
    click_button "Create Book"
    expect(page).to have_text("Price can't be blank").or have_text("Error creating book")
  end

  it "fails without a published date" do
    visit new_book_path
    fill_in "Title", with: "The Hobbit"
    fill_in "Author", with: "J.R.R. Tolkien"
    fill_in "Price", with: 15.99
    click_button "Create Book"
    expect(page).to have_text("Published date can't be blank").or have_text("Error creating book")
  end
  
  it "visits the new book page successfully" do
    visit new_book_path
    expect(page).to have_content("New Book")
  end

end

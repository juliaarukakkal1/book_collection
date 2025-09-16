require 'rails_helper'

RSpec.describe "user_books/show", type: :view do
  before(:each) do
    assign(:user_book, UserBook.create!(
      user: nil,
      book: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

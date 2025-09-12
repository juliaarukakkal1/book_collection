# spec/models/book_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with a title, author, price, and published_date" do
    book = Book.new(
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      price: 15.99,
      published_date: Date.new(1937, 9, 21)
    )
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(author: "J.R.R. Tolkien", price: 15.99, published_date: Date.today)
    expect(book).not_to be_valid
  end

  it "is invalid without an author" do
    book = Book.new(title: "The Hobbit", price: 15.99, published_date: Date.today)
    expect(book).not_to be_valid
  end

  it "is invalid without a price" do
    book = Book.new(title: "The Hobbit", author: "J.R.R. Tolkien", published_date: Date.today)
    expect(book).not_to be_valid
  end

  it "is invalid without a published_date" do
    book = Book.new(title: "The Hobbit", author: "J.R.R. Tolkien", price: 15.99)
    expect(book).not_to be_valid
  end
end


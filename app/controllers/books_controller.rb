class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy delete]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book created successfully!"
      redirect_to books_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Book updated successfully!"
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book deleted successfully!"
    redirect_to books_path
  end

  def delete
    # optional: debug
    # puts "Book ID: #{params[:id]}"
    @book = Book.find(params[:id])
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title)
  end
end


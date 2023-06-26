class BooksController < ApplicationController
  def new
    @book = Book.all
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    #データを保存する箱を作る
    @books = Book.all
    #model内のデータを全て持ってくる
  end

  def create
    @book = Book.new(book_params)
    # (book_params)は、ストロングパラメーター
    if @book.save
    redirect_to book_path(@book.id)
    else
    @book = Book.all
    render :show
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

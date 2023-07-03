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
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
    flash[:notice] ="Book was successfully updated."
    redirect_to book_path(book.id)
    else
    render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

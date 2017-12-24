class BooksController < ApplicationController
  attr_reader :books
  def index
    @books = Book.all
    render collection: @books
  end

  def new
    render :new
  end

  def create
    new_book = Book.new(book_params)
    if new_book.save
      # render object: new_book
      redirect_to books_url
    else
      #??
      render json: new_book.errors.full_messages, status: unprocessable_entity
    end
  end

  def destroy
    book_delete = Book.find_by(id: params[:id])
    book_delete.delete
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end

class BooksController < ApplicationController
  def index
    @books = Book.new
    @book = Book.all
  end

  def new
    @books = Book.new
  end
  
  def show
   @book =Book.find(params[:id])
  end

  def create
    @books = Book.new(book_params)
    if @books.save
     redirect_to book_path(@books.id)
     flash[:notice] = "Book was successfully created."
    else
     render :new
    end
  end

  def edit
    @books =Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(book.id)
    else
     flash[:notice] = "NO"
    end
    
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
  params.require(:book).permit(:title, :body)
    
  end
end

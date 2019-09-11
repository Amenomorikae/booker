class BooksController < ApplicationController
 def top
    @booker = Book.new
  end

  def index
    @bookers = Book.all
    @booker = Book.new
  end

  def create
    @booker = Book.new(book_params)
    if @booker.save(book_params)
     flash[:notice] = "successfully"
     redirect_to book_path(@booker.id)
   else
    @bookers = Book.all
    render action: :index
    end
  end

  def update
    @booker = Book.find(params[:id])
    if @booker.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@booker.id)
    else
      @bookers = Book.all
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def show
    @booker = Book.find(params[:id])
  end

  def new
    @booker = Book.find(params[:id])
  end

  def edit
    @bookers = Book.all
    @booker = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
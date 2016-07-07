class BooksController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @books = Book.search(params[:search]).page(params[:page]).per(7)
    elsif params[:sort] && Book.column_names.include?(params[:sort]) 
      if session[:direction] && session[:direction] == "desc"
        @books = Book.order(params[:sort].to_sym => :desc).page(params[:page]).per(7)
        session[:direction] = "asc"
        @direction = session[:direction]
      else
        @books = Book.order(params[:sort].to_sym).page(params[:page]).per(7)
        session[:direction] = "desc"
        @direction = session[:direction]
      end
    elsif params[:sort] == "publisher_name"
      if session[:direction] && session[:direction] == "desc"
        @books = Book.joins(:publisher).order('publishers.name DESC').page(params[:page]).per(7)
        session[:direction] = "asc"
        @direction = session[:direction]
      else
        @books = Book.joins(:publisher).order('publishers.name').page(params[:page]).per(7)
        session[:direction] = "desc"
        @direction = session[:direction]
      end
    else
      @books = Book.order("created_at").page(params[:page]).per(7)
    end
    respond_with(@books)
  end

  def show
    respond_with(@book)
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.save
    respond_with(@book)
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :original_title, :translation, :edition, :edition_date, :edition_place, :publication_year, :isbn, :cover, :publisher_id, :author_ids => [])
    end
end

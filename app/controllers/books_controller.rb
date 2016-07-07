class BooksController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    if sort_column == "publisher_name"
      @books = Book.order("publishers.name" + sort_direction).page(params[:page]).per(7)
    else
      @books = Book.order(sort_column + " " + sort_direction).page(params[:page]).per(7)
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

    def sort_column
      Book.column_names.include?(params[:sort_by]) ? params[:sort_by] : "created_at"
    end

    def sort_direction
      %w[ASC DESC].include?(params[:sort_direction]) ? params[:sort_direction] : "ASC"
    end

    def book_params
      params.require(:book).permit(:title, :original_title, :translation, :edition, :edition_date, :edition_place, :publication_year, :isbn, :cover, :publisher_id, :author_ids => [])
    end
end

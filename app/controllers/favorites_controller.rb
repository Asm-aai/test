class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    @book = favorite.book
    # redirect_back(fallback_location: books_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    @book = favorite.book
    # redirect_back(fallback_location: books_path)
  end

end

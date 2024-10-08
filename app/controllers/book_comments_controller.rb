class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.book_id = book.id
    comment.user_id = current_user.id
    comment.save
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end

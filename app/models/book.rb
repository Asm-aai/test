class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search,ward)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{ward}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{ward}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{ward}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{ward}%")
    else
      @book = Book.all
    end
  end

end

class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :body

  #maby
  # after_create :some
  #
  # def some
  #
  # end
end

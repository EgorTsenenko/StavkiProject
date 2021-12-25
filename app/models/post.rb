class Post < ApplicationRecord
  validates :title, presence:true, length:{minimum: 5}
  has_many :comments
  belongs_to :user
  #maby
  # after_create :some_animation
  #
  # def some_animation
  #
  # end

end

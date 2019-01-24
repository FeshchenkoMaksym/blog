class Post < ApplicationRecord
  validates :title, :text, presence: true # title, text and author should be present
  validates :title, length: { in: 3..55 }            # title shouldn't be less than 3 and more than 30 symbols
  validates :text,  length: { minimum: 3 }           # text should be less than 3 symbols
  belongs_to :user
end

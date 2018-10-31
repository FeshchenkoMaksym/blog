class Post < ApplicationRecord
  validates :title, :text, :author, presence: true   # title, text and author should be present
  validates :title, length: { in: 3..30 }            # title shouldn't be less than 3 and more than 30 symbols
  validates :text,  length: { minimum: 3 }           # text should be less than 3 symbols
end

# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  has_many   :comments, as: :commentable

  has_one_attached :file
end

# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts
  has_many :comments, as: :commentable
end

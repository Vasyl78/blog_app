# frozen_string_literal: true

json.category do
  json.partial! '/api/v1/categories/category', category: category
  json.partial! '/api/v1/comments/comments', comments: category.comments
end

# frozen_string_literal: true

json.posts posts do |post|
  json.partial! '/api/v1/posts/post', post: post
end

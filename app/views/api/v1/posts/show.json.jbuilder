# frozen_string_literal: true

json.post do
  json.partial! '/api/v1/posts/post', post: post
end

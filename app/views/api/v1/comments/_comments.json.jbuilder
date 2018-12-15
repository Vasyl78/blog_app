# frozen_string_literal: true

json.comments comments do |comment|
  json.call(comment, :author, :content)
end

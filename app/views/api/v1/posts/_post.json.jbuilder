# frozen_string_literal: true

json.call(post, :id, :name, :content)
json.file_url post.file.attached? ? url_for(post.file) : nil

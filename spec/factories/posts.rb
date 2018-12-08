# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    name { 'First post.' }
    content { 'Post desc' }
    category
  end
end

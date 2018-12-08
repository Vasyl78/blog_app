# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { 'First category.' }
    description { 'Category desc' }
  end
end

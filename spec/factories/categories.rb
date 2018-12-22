# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { 'First category.' }
    description { 'Category desc' }

    trait :with_comments do
      after(:create) do |category|
        create_list(:comment, 10, commentable: category)
      end
    end

    trait :with_posts do
      after(:create) do |category|
        create_list(:post, 10, category: category)
      end
    end
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    author { 'John Taylor.' }
    content { 'This is better' }
    commentable

    trait :commentable do
    end

    trait :post do
      commentable { create(:post) }
    end

    trait :category do
      commentable { create(:category) }
    end
  end
end

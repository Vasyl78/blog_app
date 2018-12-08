FactoryBot.define do
  factory :comment do
    trait :post do
      author { 'Oleh Robinson.' }
      content { 'This is better post' }
      commentable { create(:post) }
    end
    trait :category do
      author { 'John Taylor.' }
      content { 'This is better category' }
      commentable { create(:category) }
    end
  end
end

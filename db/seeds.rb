# frozen_string_literal: true

# Create categories with posts and comments
10.times do
  category = Category.create(
    name: 'Category numb.',
    description: Faker::BackToTheFuture.quote
  )

  Comment.create(
    author: "#{Faker::Name.name}.",
    content: Faker::BackToTheFuture.quote,
    commentable: category
  )
  20.times do
    content = Array.new(10).map do |_el|
      Faker::Lorem.paragraph
    end.join("\n")
    post = Post.create(
      name: 'Post number.',
      content: content,
      category: category
    )

    Comment.create(
      author: "#{Faker::Name.name}.",
      content: Faker::BackToTheFuture.quote,
      commentable: post
    )
  end
end

# frozen_string_literal: true

require 'acceptance_helper'

resource 'Comments' do
  header 'Content-Type', 'application/json'

  route '/api/comments', 'Creation of comment' do
    with_options scope: :comment, with_example: true do
      parameter :author,  'Author of comment', required: true
      parameter :content, 'Content of comment'
    end
    parameter :category_id, 'ID related category'
    parameter :post_id,     'ID comentable post'

    post 'Add a category' do
      let(:comment_params) do
        { comment: { author: author, content: content }, post_id: post_id,
          category_id: category_id }
      end
      let(:category_id) { nil }
      let(:post_id)     { nil }
      let(:content)     { 'better comment' }

      context 'comments for category' do
        let(:category) { FactoryBot.create(:category) }
        let(:category_id) { category.id }

        context 'with missing author' do
          let(:author) { nil }

          example 'Fails when missing author' do
            do_request(comment_params)
            expect(Comment.any?).to eq false
            expect(status).to eq(422)
          end
        end

        context 'with invalid author' do
          let(:author) { 'Oleg' }

          example 'Fails when invalid author for category' do
            do_request(comment_params)
            expect(Comment.any?).to eq false
            expect(status).to eq(422)
          end
        end

        context 'with a valid name' do
          let(:author) { 'John Taylor.' }

          example 'Creating a comment for category' do
            do_request(comment_params)
            expect(response_body).to eq({ comment_id: 1 }.to_json)
            expect(status).to eq(201)
          end
        end
      end

      context 'comments for post' do
        let(:category) { FactoryBot.create(:category) }
        let(:post) { FactoryBot.create(:post, category: category) }
        let(:post_id) { post.id }

        context 'with a valid name' do
          let(:author) { 'John Taylor.' }

          example 'Creating a comment for post' do
            do_request(comment_params)
            expect(response_body).to eq({ comment_id: 1 }.to_json)
            expect(status).to eq(201)
          end
        end
      end
    end
  end
end

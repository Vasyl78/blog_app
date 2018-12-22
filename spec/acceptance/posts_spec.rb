# frozen_string_literal: true

require 'acceptance_helper'

resource 'Posts' do
  header 'Content-Type', 'application/json'
  let(:category) { FactoryBot.create(:category, :with_posts) }
  let(:category_id) { category.id }

  get '/api/categories/:category_id/posts' do
    example 'All posts' do
      do_request

      status.should == 200
    end
  end

  route '/api/categories/:category_id/posts', 'Creation of post' do
    with_options scope: :post, with_example: true do
      parameter :name,    'Name of post', required: true
      parameter :content, 'Content of post'
      parameter :file, 'File with max size 2 MB', 'Type' => 'Multipart/Form-data'
    end

    post 'Add a post' do
      let(:post_params) do
        { post: { name: name, content: content, file: file } }
      end
      let(:content) { 'post content' }
      let(:file) { nil }

      context 'with missing name' do
        let(:name) { nil }
        example 'Fails when missing name' do
          do_request(post_params)
          expect(Post.count).to eq 10
          expect(status).to eq(422)
        end
      end

      # context 'with too large file' do
      #   let(:name) { 'Post name.' }
      #   let(:file) do
      #     Rack::Test::UploadedFile.new(
      #       File.open(File.join(Rails.root, 'spec', 'test_files', 'earth.jpg')),
      #       'image/jpg'
      #     )
      #   end

      #   example 'Fails when file is too large' do
      #     do_request(post_params)
      #     expect(Post.count).to eq 10
      #     expect(status).to eq(422)
      #   end
      # end

      context 'with invalid name' do
        let(:name) { 'post' }
        example 'Fails when invalid name' do
          do_request(post_params)
          expect(Post.count).to eq 10
          expect(status).to eq(422)
        end
      end

      context 'with a valid name' do
        let(:name) { 'Post name.' }

        example 'Creating a post' do
          do_request(post_params)
          expect(response_body).to eq({ post_id: Post.last.id }.to_json)
          expect(status).to eq(201)
        end
      end
    end
  end

  get '/api/categories/:category_id/posts/:id' do
    let!(:post) { category.posts.first }
    let!(:post_with_comments) do
      FactoryBot.create_list(:comment, 10, commentable: post)
    end
    let(:id) { post.id }

    example 'Getting a specific post' do
      do_request

      response = JSON.parse(response_body)
      expect(response['post'].keys).to eq %w[id name content file_url comments]
      expect(status).to eq 200
    end
  end

  put '/api/categories/:category_id/posts/:id' do
    with_options scope: :post, with_example: true do
      parameter :name,    'Name of post', required: true
      parameter :content, 'Content of post'
    end

    let(:post) { category.posts.last }
    let(:id) { post.id }
    let(:post_params) { { post: { name: name, content: content } } }
    let(:content) { 'post content' }

    context 'with mistake' do
      let(:name) { 'Post name' }

      example 'Fails when invalid name' do
        do_request(post_params)

        expect(status).to eq(422)
      end
    end

    context 'with a valid name' do
      let(:name) { 'Post changed name.' }

      example 'Update a post' do
        do_request(post_params)

        expect(response_body).to eq({ post_id: 10 }.to_json)
        expect(Post.find(10).content).to eq(content)
        expect(status).to eq 200
      end
    end
  end

  delete '/api/categories/:category_id/posts/:id' do
    let(:post) { category.posts.last }
    let(:id) { post.id }

    example 'Delete the post' do
      do_request

      expect(status).to eq 200
    end
  end
end

# frozen_string_literal: true

require 'acceptance_helper'

resource 'Categories' do
  header 'Content-Type', 'application/json'
  get '/api/categories' do
    before do
      FactoryBot.create_list(:category, 10)
    end

    example 'All categories' do
      do_request

      status.should == 200
    end
  end

  route '/api/categories', 'Creation of category' do
    with_options scope: :category, with_example: true do
      parameter :name,        'Name of category', required: true
      parameter :description, 'Description of category'
    end

    post 'Add a category' do
      let(:category_params) { { category: { name: name, description: desc } } }

      context 'with missing name' do
        let(:name) { nil }
        let(:desc) { 'Category desc' }
        example 'Fails when missing name' do
          do_request(category_params)
          expect(Category.any?).to eq false
          expect(status).to eq(422)
        end
      end

      context 'with invalid name' do
        let(:name) { 'Category' }
        let(:desc) { 'Category desc' }
        example 'Fails when invalid name' do
          do_request(category_params)
          expect(Category.any?).to eq false
          expect(status).to eq(422)
        end
      end

      context 'with a valid name' do
        let(:name) { 'Category name.' }
        let(:desc) { 'Category desc' }

        example 'Creating a category' do
          do_request(category_params)
          expect(response_body).to eq({ category_id: 1 }.to_json)
          expect(status).to eq(201)
        end
      end
    end
  end

  get '/api/categories/:id' do
    let(:category) { FactoryBot.create(:category, :with_comments) }
    let(:id) { category.id }

    example 'Getting a specific Category' do
      do_request

      response = JSON.parse(response_body)
      expect(response['category'].keys).to eq %w[id name description comments]
      expect(status).to eq 200
    end
  end

  put '/api/categories/:id' do
    with_options scope: :category, with_example: true do
      parameter :name,        'Name of category', required: true
      parameter :description, 'Description of category'
    end

    let(:category) { FactoryBot.create(:category) }
    let(:id) { category.id }
    let(:category_params) { { category: { name: name, description: desc } } }
    let(:desc) { 'Category description' }

    context 'with mistake' do
      let(:name) { 'Category name' }

      example 'Fails when invalid name' do
        do_request(category_params)

        expect(status).to eq(422)
      end
    end

    context 'with a valid name' do
      let(:name) { 'Category name.' }

      example 'Update a category' do
        do_request(category_params)

        expect(response_body).to eq({ category_id: 1 }.to_json)
        expect(Category.find(1).description).to eq(desc)
        expect(status).to eq 200
      end
    end
  end

  delete '/api/categories/:id' do
    let(:category) { FactoryBot.create(:category) }
    let(:id) { category.id }

    example 'Delete the category' do
      do_request

      expect(status).to eq 200
    end
  end
end

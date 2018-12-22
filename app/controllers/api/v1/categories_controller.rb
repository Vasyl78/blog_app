# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      helper_method :category, :categories

      def create
        category = Category.new(category_params)
        if category.save
          render status: :created, json: { category_id: category.id }
        else
          render status: :unprocessable_entity, json: category.errors.messages
        end
      end

      def update
        if category.update(category_params)
          render json: { category_id: category.id }
        else
          render status: :unprocessable_entity, json: category.errors.messages
        end
      end

      def destroy
        return head :ok if category.destroy
      end

      private

      def categories
        @categories ||= Category.all
      end

      def category
        @category ||= Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name, :description)
      end
    end
  end
end

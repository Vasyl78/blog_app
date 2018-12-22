# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      helper_method :post, :posts, :category

      def create
        binding.pry
        post = category.posts.new(post_params)
        if post.save
          render status: :created, json: { post_id: post.id }
        else
          render status: :unprocessable_entity, json: post.errors.messages
        end
      end

      def update
        if post.update(post_params)
          render json: { post_id: post.id }
        else
          render status: :unprocessable_entity, json: post.errors.messages
        end
      end

      def destroy
        return head :ok if post.destroy
      end

      private

      def category
        @category ||= Category.find(params[:category_id])
      end

      def posts
        @posts ||= category.posts
      end

      def post
        @post ||= category.posts.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:name, :content, :file)
      end
    end
  end
end

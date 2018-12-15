# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      def create
        comment = Comment.new(comment_params)
        if comment.save
          render json: { comment_id: comment.id }
        else
          render status: :unprocessable_entity, json: comment.errors.messages
        end
      end

      private

      def category
        Category.find(params[:category_id]) if params[:category_id]
      end

      def post
        Post.find(params[:post_id]) if params[:post_id]
      end

      def comment_params
        params.require(:comment).permit(:author, :content)
              .merge(commentable: (category || post))
      end
    end
  end
end

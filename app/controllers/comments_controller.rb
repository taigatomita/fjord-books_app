# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id

    @comment.save!
    redirect_to request.referer, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def destroy
    @comment.destroy!
    redirect_to request.referer, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

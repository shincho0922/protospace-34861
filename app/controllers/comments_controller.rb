class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to controller: :prototypes, action: :show, id:@comment.prototype_id
    else
      @prototype = @comment.prototype
      render template: "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id, prototype_id: params[:prototype_id])
  end
end

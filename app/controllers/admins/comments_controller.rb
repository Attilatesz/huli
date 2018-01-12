class Admins::CommentsController < Admins::AdminController
  before_action :find_commentable

  def comments_new
    @comment = Comment.new
  end

  def comments_create
    @comment = @commentable.comments.create(comment_params)

    if @comment.save
      redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: "Your comment wasn't posted!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Applicant.find(params[:id])
  end
end

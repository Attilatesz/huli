class Admins::CommentsController < Admins::AdminController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.create(comment_params)
    if @comment.save
      flash[:success] = I18n.t('flash.comment_success')
      redirect_back fallback_location: admins_applicant_path(@commentable.id)
    else
      redirect_back fallback_location: admins_applicant_path(@commentable.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :commentable_type, :commentable_id)
  end

  def find_commentable
    @commentable = Applicant.find(params[:applicant_id])
  end
end

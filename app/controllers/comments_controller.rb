class CommentsController < ApplicationController
  before_action :authenticate_user!
   def create
    #byebug :Para hacer seguimiento a los errores. Para depurar las aplicaciones, qué está 
    #haciendo por debajo, "para" la aplicación justo donde está escrito. Escribir (byebug) c en consola para que continue.
    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end
   
  private
    
  def comment_params
      params.require(:comment).permit(:comment, :user_id, :post_id)
  end
end

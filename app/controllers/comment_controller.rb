class CommentController < ApplicationController
    def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    @comment.comment = params[:comment]
   
    @comment.save
    
    redirect_to :back
    
    end
    def destroy
    
    @reply_d = Comment.find(params[:reply_id])
        
    @reply_d.destroy
    
    redirect_to :back
    
    end
end

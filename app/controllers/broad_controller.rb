class BroadController < ApplicationController
    def create #새로운 post에 입력 받은 값을 DB에 저장하는 액션
    
        # Parameters: {"username"=>"sd", "subject"=>"sd", "body"=>"sd"}
        @post_username = params[:username]
        @post_subject = params[:subject]
        @post_body = params[:body]
        
        #db에 저장
        new_post = Post.new
        new_post.title = @post_subject
        new_post.editor = @post_username
        new_post.content = @post_body
        
        new_post.save
        redirect_to '/'
    end
    
    def index #index.html.erb 뷰파일을 위한 액션
        @post_all = Post.all
    end
  
    def show #show.html.erb 뷰파일을 위한 액션
        post_id = params[:id]
        @post = Post.find(post_id)  
        
    end
  
    def new  #new.html.erb 뷰파일을 위한 액션
        
    end
     
    def edit # edit.html.erb 뷰 파일을 위한 액션
        post_id = params[:id]
        @post = Post.find(post_id)
    end
      
    def update # 특정 post를 수정하여 DB에 저장하는 액션
        post_id = params[:id]
        @post = Post.find(post_id)
        
        @post.editor = params[:username]
        @post.title = params[:subject]
        @post.content = params[:body]
    
        @post.save
        
        redirect_to "/broad/show/#{@post.id}"
    end
      
    def delete # 특정 post를 DB에서 삭제하는 액션
        post_id = params[:id]
        @post_d = Post.find(post_id)
        
        @post_d.destroy
        
        redirect_to '/' #action이 끝나고 다른 페이지로 가는것
    end
end

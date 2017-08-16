class PostsController < ApplicationController

 def index
   if Borrower.where(email: session[:user_email]).first
     @user = Borrower.where(email: session[:user_email]).first
   elsif Lender.where(email: session[:user_email]).first
     @user = Lender.where(email: session[:user_email]).first
   end
   @posts = Post.all
   @lenders = Lender.all
   @borrowers = Borrower.all
   @loans = Loan.all
   render layout: "three_column"
 end

# the if elsif function above takes advantage of out duel login system to display the appopriate table user.
# We also tee-d up all of the other tables as quick references.


 def create
   @post = Post.new(post_params)
   @post.postable_id = current_user.id
   if Lender.where(email: session[:user_email]).first
     @post.postable_type = "Lender"
   elsif Borrower.where(email: session[:user_email]).first
     @post.postable_type = "Borrower"
   end
   if @post.save
     redirect_to "/chat/#{current_user.id}"
   else
     flash[:errors] = @post.errors.full_messages
   end
 end

private

def post_params
    params.require(:post).permit(:post)
end

end

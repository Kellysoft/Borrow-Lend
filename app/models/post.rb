class Post < ActiveRecord::Base
  belongs_to :postable, polymorphic: true
end



# > So we used polymorpic here to have a posts table that had post from both lenders and borrowers
# we used  post.postable.first_name to get first anme of the auther of the post, and so on. 

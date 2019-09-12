module PostsHelper

  def post_creator(post)
    creator = User.find_by(id: post.user_id)
    creator.first_name
  end
end
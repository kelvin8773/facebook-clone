module PostsHelper

  def post_creator(post)
    creator = User.find_by(id: post.user_id)
    creator.name.split(" ")[0]
  end
end
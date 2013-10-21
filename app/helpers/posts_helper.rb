module PostsHelper
  def forum_thread_post_complaint_path(forum_thread, post)
    forum_thread_post_path(forum_thread, post) + "/complain"
  end

end

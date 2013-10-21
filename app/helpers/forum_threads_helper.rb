module ForumThreadsHelper
  def forum_thread_complaint_path(forum_thread)
    forum_thread_path(forum_thread) + "/complain"
  end
end

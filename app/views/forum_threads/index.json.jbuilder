json.array!(@forum_threads) do |forum_thread|
  json.extract! forum_thread, :title, :body, :user_id, :real_allowed, :pseudo_allowed, :anon_allowed
  json.url forum_thread_url(forum_thread, format: :json)
end

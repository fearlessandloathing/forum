json.array!(@posts) do |post|
  json.extract! post, :body, :user_id, :mode
  json.url post_url(post, format: :json)
end

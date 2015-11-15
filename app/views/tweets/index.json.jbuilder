json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :title, :image, :content
  json.url tweet_url(tweet, format: :json)
end

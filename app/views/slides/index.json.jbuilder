json.array!(@slides) do |slide|
  json.extract! slide, :id, :title, :slider_image, :slider_content
  json.url slide_url(slide, format: :json)
end

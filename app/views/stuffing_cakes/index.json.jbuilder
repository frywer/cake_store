json.array!(@stuffing_cakes) do |stuffing_cake|
  json.extract! stuffing_cake, :id, :image, :description, :price
  json.url stuffing_cake_url(stuffing_cake, format: :json)
end

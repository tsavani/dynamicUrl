json.array!(@dynamic_urls) do |dynamic_url|
  json.extract! dynamic_url, :id, :url
  json.url dynamic_url_url(dynamic_url, format: :json)
end

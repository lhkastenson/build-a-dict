json.array!(@entries) do |entry|
  json.extract! entry, :id, :word, :definition, :text, :origin, :author
  json.url entry_url(entry, format: :json)
end

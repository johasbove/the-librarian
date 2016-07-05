json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :editorial, :original_title, :translation, :edition, :edition_date, :edition_place, :publication_year, :isbn
  json.url book_url(book, format: :json)
  json.cover do
    json.thumb asset_url(book.cover.url(:thumb))
  end
end

json.extract! @book, :id, :title, :author, :original_title, :translation, :edition, :edition_date, :edition_place, :publication_year, :isbn, :created_at, :updated_at
json.editorial book.publisher.name
json.cover do
  json.thumb asset_url(book.cover.url(:thumb))
end

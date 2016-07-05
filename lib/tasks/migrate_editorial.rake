namespace :db do
  desc "Migrate data from book column editorial to table Publisher"
  task migrate_editorial: :environment do
    book_editorial_to_publisher
  end
end

def book_editorial_to_publisher
  Book.all.each do |book|
    editorial = book.editorial
    if publisher = Publisher.find_by(name: editorial)
      book.publisher = publisher
      book.save
    else
      publisher = Publisher.create(name: editorial)
      book.publisher = publisher
      book.save
    end
  end
end
namespace :db do
  desc "Migrate data from book column author to table Author"
  task migrate_author: :environment do
    book_author_to_author
  end
end

def book_author_to_author
  Book.all.each do |book|
    author = book.author
    if author_object = Author.find_by(name: author)
      book.authors << author_object
    else
      author_object = Author.create(name: author)
      book.authors << author_object
    end
  end
end
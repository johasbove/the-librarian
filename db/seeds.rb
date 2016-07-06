# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.find_or_create_by(:email => 'admin@example.com') do |user|
  user.password = '12345678'
end

unless Book.exists?
  now = Time.now.to_f
  long_ago = 5.years.ago.to_f
  
  def rtime(now,init_time)
    x_init_time = init_time.to_time.to_f
    Time.at(rand * (now - x_init_time) + x_init_time)
  end
  Publisher.create([
    {
      name: 'Ediciones B',
      origin_country: 'España',
      founded_year: 1987
    },
    {
      name: 'RBA',
      origin_country: 'España',
      founded_year: 1981,
      founder: 'Ricardo Rodrigo, Carmen Balcells, Roberto Altarriba'
    },
    {
      name: 'Morgan Kaufmann Publishers',
      origin_country: 'United States',
      founded_year: 1984,
      founder: 'Michael B. Morgan, William Kaufman'
    },
    {
      name: 'SitePoint',
      origin_country: 'Australia',
      founded_year: 1984,
      founder: 'Matt Mickiewicz, Mark Harbottle'
    },
    {
      name: 'O\'Reilly',
      origin_country: 'United States',
      founded_year: 1978,
      founder: 'Tim O\'Reilly'
    },
    {
      name: 'New Riders Publishing',
      origin_country: 'United States',
      founded_year: 1986,
      founder: 'Ted Nace, Michael Gardner'
    }
  ])
  [
    {
      title: 'La sombra de Ender',
      author: 'Orson Scott Card',
      original_title: "Ender's Shadow",
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2012-01-01')),
      edition_place: 'Barcelona',
      publication_year: 1999,
      isbn: '978-84-9872-591-9',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La sombra del Hegemón',
      author: 'Orson Scott Card',
      original_title: 'Hegemon\'s Shadow',
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2014-02-01')),
      edition_place: 'Barcelona',
      publication_year: 2001,
      isbn: '978-84-9872-909-2',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El imperio final',
      author: 'Brandon Sanderson',
      original_title: 'Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 2,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2007,
      isbn: '978-84-666-3199-0',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El pozo de la ascensión',
      author: 'Brandon Sanderson',
      original_title: 'The Well of Ascension: Book Two of Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 3,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2009,
      isbn: nil,
      created_at: rtime(now,init_time)
    }
  ].each do |book|
    b = Publisher.find_by(name: "Ediciones B").books.build(book)
    b.save
  end

  book = Publisher.find_by(name: "RBA").books.build({
    title: 'La quinta ola',
    author: 'Rick Yancey',
    original_title: 'The 5th Wave',
    translation: 'Pilar Ramírez Tello',
    edition: 1,
    edition_date: (init_time = Date.parse('2013-09-01')),
    edition_place: 'Barcelona',
    publication_year: 2013,
    isbn: '978-84-272-0422-5',
    created_at: rtime(now,init_time)
  })
  book.save
  book = Publisher.find_by(name: "Morgan Kaufmann Publishers").books.build({
    title: 'Web Application Design Patterns',
    author: 'Pawan Vora',
    original_title: nil,
    translation: nil,
    edition: 1,
    edition_date: nil,
    edition_place: 'Canada',
    publication_year: 2009,
    isbn: '978-0-12-374265-0',
    created_at: rtime(now,Date.parse('2009-06-01'))
  })
  book.save
  book = Publisher.find_by(name: "SitePoint").books.build({
    title: 'The principles of Beautiful Web Design',
    author: 'Jason Beaird',
    original_title: nil,
    translation: nil,
    edition: 2,
    edition_date: (init_time = Date.parse('2010-11-01')),
    edition_place: 'Canada',
    publication_year: 2010,
    isbn: '978-0-9805768-9-4',
    created_at: rtime(now,init_time)
  })
  book.save

  book = Publisher.find_by(name: "O\'Reilly").books.build({
    title: 'Learning Web Design',
    author: 'Jennifer Niederst Robbins',
    original_title: nil,
    translation: nil,
    edition: 3,
    edition_date: (init_time = Date.parse('2007-06-01')),
    edition_place: nil,
    publication_year: 2001,
    isbn: '978-0-596-52752-5',
    created_at: rtime(now,init_time)
  })
  book.save

  book = Publisher.find_by(name: "New Riders Publishing").books.build({
    title: 'Don’t Make Me Think!',
    author: 'Steve Krug',
    original_title: nil,
    translation: nil,
    edition: 2,
    edition_date: (init_time = Date.parse('2006-06-01')),
    edition_place: 'United States of America',
    publication_year: 2006,
    isbn: '0-321-34475-8',
    created_at: rtime(now,init_time)
  })
  book.save
end
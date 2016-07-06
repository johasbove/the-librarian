# == Schema Information
#
# Table name: books
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  author             :string(255)      not null
#  original_title     :string(255)
#  translation        :string(255)
#  edition            :integer
#  edition_date       :date
#  edition_place      :string(255)
#  publication_year   :integer
#  isbn               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  cover_file_name    :string(255)
#  cover_content_type :string(255)
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#  publisher_id       :integer
#

class Book < ActiveRecord::Base
  
  validates :title, :author, :publisher_id, :presence => true
  validates :edition, :publication_year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default_cover.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  belongs_to :publisher
  has_and_belongs_to_many :authors
end

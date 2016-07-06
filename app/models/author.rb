# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  nationality :string(255)
#  born        :date
#  created_at  :datetime
#  updated_at  :datetime
#

class Author < ActiveRecord::Base
  validates :name, :presence => true

  has_and_belongs_to_many :books
end

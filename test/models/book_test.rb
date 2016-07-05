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

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

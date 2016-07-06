# == Schema Information
#
# Table name: publishers
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  origin_country :string(255)
#  founded_year   :integer
#  founder        :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

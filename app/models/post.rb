# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  descriptions :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Post < ActiveRecord::Base
end

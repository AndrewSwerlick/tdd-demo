# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

  def filtered_content
    filtered = self.content
    bad_words.each do |words|
      filtered = filtered.gsub(words[0],words[1])
    end
    filtered
  end

  def bad_words
    [
      [/damn/i,"darn"],
      [/crap/i,"poop"]
    ]
  end
end

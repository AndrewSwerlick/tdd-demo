# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

describe Post do
  let(:post) { Post.new(content: content) }
  let(:result) { post.filtered_content }

  describe "when we get the posts filtered content" do
    let(:content) { "This is some g rated content" }

    it "gives us the posts content" do
      result.must_equal post.content
    end
  end

  describe "when we get the posts filtered content when the post has a bad word" do
    let(:content) { "This is some damn filthy content" }

    it "gives us the posts content" do
      result.wont_match "damn"
      result.must_match "darn"
    end
  end

  describe "when we have a list of bad words in the database" do
    before do
      BadWord.create(bad_word: "crap", replacement: "poop")
    end
    let(:content){ "This is crap" }

    it "gives us the posts filtered content" do
      result.wont_match "crap"
    end
  end
end

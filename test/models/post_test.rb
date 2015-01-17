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
  describe "when we get the filtered or a post" do
    let(:post){ Post.new(content: content) }
    let(:content) { "This is some g-rated content"}
    let(:post_content){ post.filtered_content }

    describe "when the content is g-rated" do
      let(:content) { "This is some g-rated content"}

      it "returns the correct content with no changes" do
        post_content.must_equal content
      end
    end

    describe "when the content has a bad word in it" do
      let(:content) {"This content is damn filthy"}

      it "returns the correct content with no changes" do
        post_content.must_match "darn"
        post_content.wont_match "damn"
      end
    end

    describe "when the content has multiple bad words in it" do
      let(:content) { "Crap this was a damn big mistake" }

      it "returns the correct content with no changes" do
        post_content.must_match "darn"
        post_content.wont_match "damn"

        post_content.must_match "poop"
        post_content.wont_match "crap"
      end
    end
  end
end

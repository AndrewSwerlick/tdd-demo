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

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "that we can get the filtered content of a post" do
    # Arrange
    post = Post.new
    post.content = "This is some g-rated content"

    # Act
    filtered_content = post.filtered_content

    # Assert
    assert_not_nil filtered_content
  end

  test "that if there are no swear words the filtered content is the same as normal content" do
    # Arrange
    post = Post.new
    post.content = "This is some g-rated content"

    # Act
    filtered_content = post.filtered_content

    # Assert
    assert_equal post.content, post.filtered_content
  end

  test "that if there is a swear word it gets replaced" do
    # Arrange
    post = Post.new
    post.content = "This content is damn filthy"

    # Act
    filtered_content = post.filtered_content

    # Assert
    assert !(filtered_content =~ /damn/), "found damn"
    assert filtered_content =~ /darn/, "didn't find darn"
  end

  test "that if there are multiple swear words they get replaced" do
    # Arrange
    post = Post.new
    post.content = "Crap this was a mistake"

    # Act
    filtered_content = post.filtered_content

    # Assert
    assert !(filtered_content =~ /crap/i), "found crap"
    assert filtered_content =~ /poop/i, "didn't find poop"
  end
end

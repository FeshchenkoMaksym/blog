require 'rails_helper'

RSpec.describe Post, type: :model do
  before {@post = Post.new(title: "Cafe", text: "very expensive cafe", author: "Ivanov Vlad")}

  subject {@post}

  it {should respond_to(:title)}
  it {should respond_to(:text)}
  it {should respond_to(:author)}

  it {should be_valid}

  describe "when author is not present" do
    before {@post.author = ""}

    it {should_not be_valid}
  end

  describe "when title is too long" do
    before {@post.title = "a" * 32}
    it {should_not be_valid}
  end

  describe "when title is too short" do
    before {@post.title = "a"}
    it {should_not be_valid}
  end

  describe "when text is too short" do
    before {@post.text = "a"}
    it {should_not be_valid}
  end
end

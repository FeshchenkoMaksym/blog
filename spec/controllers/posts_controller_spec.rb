require 'rails_helper'

RSpec.describe PostsController, type: :controller do

    let!(:post_1) {create :post, title: 'first post'}
    let!(:post_2) {create :post, title: 'second post'}
    let!(:post_3) {create :post, title: 'third post'}


    describe "get index" do
      before {get :index}

      it "show all post" do
        expect(Post.count).to eq(3)
      end

      it "last post" do
        w = Post.last
        expect(w.title).to eq('third post')
      end
    end
end

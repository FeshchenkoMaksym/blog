RSpec.describe PostsController, type: :controller do
  let(:post_1) { create :post, title: 'first post' }
  let(:post_2) { create :post, title: 'second post' }
  let(:post_3) { create :post, title: 'third post' }

  describe '#index' do
    before { get :index }

    it 'returns all posts' do
      expect(assigns(:posts)).to match_array([post_1, post_2, post_3])
    end

    it 'renders view' do
      expect(response).to render_template :index
    end
  end
end

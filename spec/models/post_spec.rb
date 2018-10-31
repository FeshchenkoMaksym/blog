RSpec.describe Post, type: :model do
  let(:post_1) { create :post }

  subject { post_1 }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:text) }
  it { is_expected.to respond_to(:author) }

  it { is_expected.to be_valid }

  context 'when author is not present' do
    before { post_1.author = '' }

    it { is_expected.to be_invalid }
  end

  context 'when title is too long' do
    before { post_1.title = 'a' * 32 }

    it { is_expected.to be_invalid }
  end

  context 'when title is too short' do
    before { post_1.title = 'a' }

    it { is_expected.to be_invalid }
  end

  context 'when text is too short' do
    before { post_1.text = 'a' }

    it { is_expected.to be_invalid }
  end
end

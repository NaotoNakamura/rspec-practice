require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションのテスト' do
    let(:post) { FactoryBot.create(:post) }

    context 'user_idとbodyカラム' do
      it 'user_idとbodyカラムが両方正しい場合は、有効であること' do
        expect(post).to be_valid
      end
      it 'user_idとbodyカラムが両方不正な場合は、無効であること' do
        post.user_id = nil
        post.body = nil
        expect(post).to_not be_valid
      end
    end

    context 'user_idカラム' do
      it 'user_idがない場合は、無効であること' do
        post.user_id = nil
        expect(post).to_not be_valid
      end
    end

    context 'bodyカラム' do
      it 'bodyがnilの場合は、無効であること' do
        post.body = nil
        expect(post).to_not be_valid
      end

      it 'bodyが空文字の場合は、無効であること' do
        post.body = ''
        expect(post).to_not be_valid
      end

      it 'bodyが141文字以上の場合は、無効であること' do
        post.body = Faker::Lorem.characters(number:141)
        expect(post).to_not be_valid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userとの関係' do
      it 'N:1となっていること' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end

require 'rails_helper'

RSpec.describe "Posts", type: :request do

  let(:user) { FactoryBot.create(:user) }

  describe "GET /posts" do
    context '未ログイン時' do
      it "リクエストが成功すること" do
        get root_path
        expect(response).to have_http_status(200)
      end
    end
    context 'ログイン時' do
      it "リクエストが成功すること" do
        sign_in user
        get root_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /posts/1/edit" do
    context 'ログイン時' do
      it "リクエストが成功すること" do
        sign_in user
        get edit_post_path(id: 1)
        expect(response).to have_http_status(200)
      end
    end
    context '未ログイン時' do
      it "リクエストが失敗すること" do
        get edit_post_path(id: 1)
        expect(response).to_not have_http_status(200)
      end
    end
  end
end

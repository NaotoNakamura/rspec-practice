require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'root' do
    it '未ログインの場合にroot_path、sign_in, sign_upへのリンクが表示されていること' do
      visit root_path
      link_to_root = page.find_all("a[href=\"#{root_path}\"]")
 
      expect(link_to_root.size).to eq 1
      expect(page).to have_link 'ホーム', href: root_path
      expect(page).to have_link '新規登録', href: new_user_registration_path
      expect(page).to have_link 'ログイン', href: new_user_session_path
    end
    # 未ログイン時にフォームが表示されていないこと
    # ログイン時
  end
end

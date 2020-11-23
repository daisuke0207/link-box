require 'rails_helper'

RSpec.describe 'Boxes', type: :system do
  describe '一覧表示機能' do
    before do
      @user_a = FactoryBot.create(:user, nickname: 'ユーザーA', email: 'a@com')
      FactoryBot.create(:box, name: 'Aのbox', user: @user_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        visit root_path
        visit new_user_session_path
        fill_in 'メールアドレス', with: @user_a.email
        fill_in 'パスワード', with: @user_a.password
        click_on 'ログイン'
      end
      it 'ユーザーAが作成したboxが表示されていること' do
        expect(page).to have_content('Aのbox')
      end
    end

    context 'ユーザーBがログインしているとき' do
      before do
        @user_b = FactoryBot.create(:user, nickname: 'ユーザーB', email: 'b@com')
        visit root_path
        visit new_user_session_path
        fill_in 'メールアドレス', with: @user_b.email
        fill_in 'パスワード', with: @user_b.password
        click_on 'ログイン'
      end

      it 'ユーザーAが作成したboxが表示されていないこと' do
        expect(page).to have_no_content('Aのbox')
      end
    end
  end
end

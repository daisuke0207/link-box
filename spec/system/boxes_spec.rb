require 'rails_helper'

RSpec.describe "Boxes", type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザーAを作成
      # ユーザーAのboxを作成
    end
    
    context 'ユーザーAがログインしているとき' do
      it 'ユーザーAが作成したboxが表示されていること' do
        # 作成済みのbox名が画面に表示されていることを確認
      end
    end

    context 'ユーザーBがログインしているとき' do
      before do
        # ユーザーBを作成
        # ユーザーBでログイン
      end

      it 'ユーザーAが作成したboxが表示されていないこと' do
        # ユーザーAが作成したbox名が画面に表示されていないこと
      end
    end
  end
end

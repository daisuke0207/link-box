require 'rails_helper'

RSpec.describe Connect, type: :model do
  describe '#create' do
    before do
      @connect = FactoryBot.build(:connect)
    end

    it 'title, link, position, user, boxが存在していれば登録できること' do
      expect(@connect).to be_valid
    end

    it 'titleが空では登録できないこと' do
      @connect.title = nil
      @connect.valid?
      expect(@connect.errors.full_messages).to include("Title can't be blank")
    end

    it 'linkが空では登録できないこと' do
      @connect.link = nil
      @connect.valid?
      expect(@connect.errors.full_messages).to include("Link can't be blank")
    end

    it 'positionが空では登録できないこと' do
      @connect.position = nil
      @connect.valid?
      expect(@connect.errors.full_messages).to include("Position can't be blank")
    end

    it 'userが空では登録できないこと' do
      @connect.user = nil
      @connect.valid?
      expect(@connect.errors.full_messages).to include("User must exist")
    end

    it 'boxが空では登録できないこと' do
      @connect.box = nil
      @connect.valid?
      expect(@connect.errors.full_messages).to include("Box must exist")
    end
  end
end

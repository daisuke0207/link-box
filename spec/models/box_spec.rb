require 'rails_helper'

RSpec.describe Box, type: :model do
  describe '#create' do
    before do
      @box = FactoryBot.build(:box)
    end

    it 'nameとposition、userが存在していれば登録できること' do
      expect(@box).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @box.name = nil
      @box.valid?
      expect(@box.errors.full_messages).to include("Name can't be blank")
    end

    it 'positionが空では登録できないこと' do
      @box.position = nil
      @box.valid?
      expect(@box.errors.full_messages).to include("Position can't be blank")
    end

    it 'userが空では登録できないこと' do
      @box.user = nil
      @box.valid?
      expect(@box.errors.full_messages).to include("User must exist")
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品登録できるとき' do
      it 'item_nameとitem_textとamount_of_money、category、condition、delivery_charge、area、number_of_dayが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_textが空では登録できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item text can't be blank"
      end
      it 'amount_of_moneyが空では登録できない' do
        @item.amount_of_money = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Amount of money can't be blank"
      end
      it 'amount_of_moneyに半角数字以外が含まれている場合は登録できない' do
        @item.amount_of_money = '/\A[ァ-ヶー－]+\z/'
        @item.valid?
        expect(@item.errors.full_messages).to include "Amount of money is not a number"
      end
      it 'amount_of_moneyが300円未満では登録できない' do
        @item.amount_of_money = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Amount of money must be greater than or equal to 300"
      end
      it 'amount_of_moneyが9,999,999円を超えると登録できない' do
        @item.amount_of_money = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Amount of money is not a number"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge must be other than 1"
      end
      it 'area_idが空では登録できない' do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end
      it 'number_of_day_idが空では登録できない' do
        @item.number_of_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Number of day must be other than 1"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

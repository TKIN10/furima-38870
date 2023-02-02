require 'rails_helper'

RSpec.describe PurchaseInformationShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @purchase_information_shipping_address = FactoryBot.build(:purchase_information_shipping_address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_information_shipping_address).to be_valid
      end
      it 'bulding_nameは空でも保存できること' do
        @purchase_information_shipping_address.bulding_name =''
        expect(@purchase_information_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @purchase_information_shipping_address.postal_code = ''
        @purchase_information_shipping_address.valid?
        expect(@purchase_information_shipping_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @purchase_information_shipping_address.postal_code = '/\A\d{3}[-]\d{4}\z/'
        @purchase_information_shipping_address.valid?
        expect(@purchase_information_shipping_address.errors.full_messages).to include "Postal code is invalid"
      end
      it 'area_idが空では登録できない' do
        @purchase_information_shipping_address.area_id = 1
        @purchase_information_shipping_address.valid?
        expect(@purchase_information_shipping_address.errors.full_messages).to include "Area must be other than 1"
      end
      it 'municipalityが空では登録できない' do
        @purchase_information_shipping_address.municipality = ''
        @purchase_information_shipping_address.valid?
        expect(@purchase_information_shipping_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'adressが空では登録できない' do
        @purchase_information_shipping_address.adress = ''
        @purchase_information_shipping_address.valid?
        expect(@purchase_information_shipping_address.errors.full_messages).to include "Adress can't be blank"
      end
      it 'numberが空では登録できない' do
        @purchase_information_shipping_address.number = ''
        @purchase_information_shipping_address.valid?
        expect(@purchase_information_shipping_address.errors.full_messages).to include "Number can't be blank"
      end
      it 'numberが10桁以上11桁以内の半角数値でないと保存できない' do
        @purchase_information_shipping_address.number = '/\A\d{10,11}\z/'
        @purchase_information_shipping_address.valid?
        expect(@purchase_information_shipping_address.errors.full_messages).to include "Number is invalid"
      end
      it "tokenが空では登録できないこと" do
        @purchase_information_shipping_address.token = ''
        @purchase_information_shipping_address.valid?
        expect(@purchase_information_shipping_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end

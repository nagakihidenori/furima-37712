require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.create(:item)
    sleep 0.1
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力事項が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.commo_price = 1000
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.commo_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.commo_ex = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo ex can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.commo_cate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo cate can't be blank")
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @item.commo_cate_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo cate can't be blank")
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @item.commo_st_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo st can't be blank")
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @item.commo_st_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo st can't be blank")
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @item.commo_deli_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo deli charge can't be blank")
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @item.commo_deli_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo deli charge can't be blank")
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.commo_deli_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo deli day can't be blank")
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @item.commo_deli_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo deli day can't be blank")
      end
      it '価格が空欄だと出品できない' do
        @item.commo_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo price can't be blank")
      end
      it '価格が半角数字以外だと出品できない' do
        @item.commo_price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Commo price is not a number")
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.commo_price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Commo price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.commo_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Commo price must be less than or equal to 9999999')
      end
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
   context'新規登録できる時' do
    it "nickname、email、パスワード、苗字、名前、カナ苗字、カナ名前、生年月日があれば登録できるできる" do
    expect(@user).to be_valid
    end
   end

   context '新規登録できない時' do
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "パスワードが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "苗字がが空だと登録できない" do
      @user.myouji= nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Myouji can't be blank")

    end

    it "名前が空だと登録できない" do
      @user.namae = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Namae can't be blank")
    end

    it "カナ苗字が空だと登録できない" do
      @user.kanamyouji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanamyouji can't be blank")
    end

    it "カナ名前が空だと登録できない" do
      @user.kananamae = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kananamae can't be blank")
    end

    it "生年月日が空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "emailに必ず＠が含まれる" do
      @user.email = "yahoo.co.jp"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "emailは重複しない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "パスワードが５文字以下だと登録できない" do
      @user.password = "1234a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードはアルファベットのみでは登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it "パスワードは数字のみでは登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it "パスワードは全角英数字では登録できない" do
      @user.password = "１２３４５６ｌ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it "苗字は半角が含まれると登録できない" do
      @user.myouji = "カﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Myouji is invalid")
    end

    it "名前は半角が含まれると登録できない" do
      @user.namae = "カﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Namae is invalid")
    end

    it "カナ苗字は半角だと登録できない" do
      @user.kanamyouji = "ｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanamyouji is invalid")
    end

    it "カナ苗字はひらがなだと登録できない" do
      @user.kanamyouji = "あい"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanamyouji is invalid")
    end

    it "カナ苗字は漢字だと登録できない" do
      @user.kanamyouji = "一二"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanamyouji is invalid")
    end

    it "カナ苗字はアルファベットだと登録できない" do
      @user.kanamyouji = "AB"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanamyouji is invalid")
    end

    it "カナ苗字は数字だと登録できない" do
      @user.kanamyouji = "12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanamyouji is invalid")
    end

    it "カナ苗字は記号だと登録できない" do
      @user.kanamyouji = "+-"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanamyouji is invalid")
    end

    it "カナ名前は全角での入力でないと登録できない" do
      @user.kananamae = "ｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kananamae is invalid")
    end

    it "カナ名前はひらがなだと登録できない" do
      @user.kananamae = "あい"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kananamae is invalid")
    end

    it "カナ名前は漢字だと登録できない" do
      @user.kananamae = "一二"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kananamae is invalid")
    end

    it "カナ名前はアルファベットだと登録できない" do
      @user.kananamae = "AB"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kananamae is invalid")
    end

    it "カナ名前は数字だと登録できない" do
      @user.kananamae = "12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kananamae is invalid")
    end

    it "カナ名前は記号だと登録できない" do
      @user.kananamae = "+-"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kananamae is invalid")
    end


    it "パスワードとパスワード（確認）が一致しないと登録できない" do
      @user.password = '123456a'
      @user.password_confirmation = '123456b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
   end
  end


end

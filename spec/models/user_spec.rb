require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
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

    it "パスワードは半角英数字混合でないと登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it "カナ苗字は全角での入力でないと登録できない" do
      @user.kanamyouji = "ｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanamyouji is invalid")
    end

    it "カナ名前は全角での入力でないと登録できない" do
      @user.kananamae = "ｶﾅ"
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

require 'rails_helper'
describe User do
  describe '#create' do

    it "全ての項目の入力が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # nul:false, presence: true のテスト ▼
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "encrypted_passwordがない場合は登録できないこと" do
      user = build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください")
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "birth_dateがない場合は登録できないこと" do
      user = build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("を入力してください")
    end

    # パスワードの文字数テスト ▼

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "1234567", encrypted_password: "1234567")
      expect(user).to be_valid
    end

    it "passwordが7文字以下であれば登録できないこと" do
      user = build(:user, password: "123456", encrypted_password: "123456")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("は7文字以上で入力してください")
    end

    # email 一意性制約のテスト ▼

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 確認用パスワードが必要であるテスト ▼

    it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
      user = build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください", "は7文字以上で入力してください")
    end

    # 本人確認名前全角入力のテスト ▼

    it 'family_nameが全角入力でなければ登録できないこと' do
      user = build(:user, family_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      user = build(:user, first_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    # 本人確認カタカナ全角入力のテスト ▼

    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, family_name_kana: "あいうえお")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, first_name_kana: "あいうえお")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end
  end
end

describe Address do
  describe '#create' do
 
    # 1
    it "address_family_nameがない場合は登録できないこと" do
      address = build(:address, address_family_name: nil)
      address.valid?
      expect(address.errors[:address_family_name]).to include("を入力してください")
    end
 
    # 2
    it "address_first_nameがない場合は登録できないこと" do
      address = build(:address, address_first_name: nil)
      address.valid?
      expect(address.errors[:address_first_name]).to include("を入力してください")
    end
 
    # 3
    it "address_family_name_kanaがない場合は登録できないこと" do
      address = build(:address, address_family_name_kana: nil)
      address.valid?
      expect(address.errors[:address_family_name_kana]).to include("を入力してください")
    end
 
    # 4
    it "address_first_name_kanaがない場合は登録できないこと" do
      address = build(:address, address_first_name_kana: nil)
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("を入力してください")
    end
 
    # 5
    it "post_codeがない場合は登録できないこと" do
      address = build(:address, post_code: nil)
      address.valid?
      expect(address.errors[:post_code]).to include("を入力してください")
    end
 
    # 6
    it "prefecture_idがない場合は登録できないこと" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end
 
    # 7
    it "cityがない場合は登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end
 
    # 8
    it "address_lineがない場合は登録できないこと" do
      address = build(:address, address_line: nil)
      address.valid?
      expect(address.errors[:address_line]).to include("を入力してください")
    end
 
    # 9
    it "全ての項目が存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end
  end
end
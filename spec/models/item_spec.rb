require 'rails_helper'

describe Item do
  describe "#create" do

    it "is invalid without a name" do
      item = build(:item, name:"")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a description" do
      item = build(:item, description:"")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id:"")
      item.valid?
      expect(item.errors[:category_id]).to include("を選択して下さい")
    end

    it "is invalid without a condition" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("を選択して下さい")
    end

    it "is invalid without a postage" do
      item = build(:item, postage:"")
      item.valid?
      expect(item.errors[:postage]).to include("を選択して下さい")
    end

    it "is invalid without a departure_area" do
      item = build(:item, departure_area:"")
      item.valid?
      expect(item.errors[:departure_area]).to include("を選択して下さい")
    end

    it "is invalid without a lead_time" do
      item = build(:item, lead_time:"")
      item.valid?
      expect(item.errors[:lead_time]).to include("を選択して下さい")
    end

    it "is invalid without a price" do
      item = build(:item, price:"")
      item.valid?
      expect(item.errors[:price]).to include("販売価格は¥300以上¥9,999,999以内で入力してください")
    end
    
    it "is invalid without a price less than 300" do
      item = build(:item, price:"299")
      item.valid?
      expect(item.errors[:price]).to include("販売価格は¥300以上¥9,999,999以内で入力してください")
    end

    it "is invalid without a price over 10000000" do
      item = build(:item, price:"10000000")
      item.valid?
      expect(item.errors[:price]).to include("販売価格は¥300以上¥9,999,999以内で入力してください")
    end

  end

  describe "#update" do

    it "is invalid without a name" do
      item = build(:item, name:"")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a description" do
      item = build(:item, description:"")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id:"")
      item.valid?
      expect(item.errors[:category_id]).to include("を選択して下さい")
    end

    it "is invalid without a condition" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("を選択して下さい")
    end

    it "is invalid without a postage" do
      item = build(:item, postage:"")
      item.valid?
      expect(item.errors[:postage]).to include("を選択して下さい")
    end

    it "is invalid without a departure_area" do
      item = build(:item, departure_area:"")
      item.valid?
      expect(item.errors[:departure_area]).to include("を選択して下さい")
    end

    it "is invalid without a lead_time" do
      item = build(:item, lead_time:"")
      item.valid?
      expect(item.errors[:lead_time]).to include("を選択して下さい")
    end

    it "is invalid without a price" do
      item = build(:item, price:"")
      item.valid?
      expect(item.errors[:price]).to include("販売価格は¥300以上¥9,999,999以内で入力してください")
    end
    
    it "is invalid without a price less than 300" do
      item = build(:item, price:"299")
      item.valid?
      expect(item.errors[:price]).to include("販売価格は¥300以上¥9,999,999以内で入力してください")
    end

    it "is invalid without a price over 10000000" do
      item = build(:item, price:"10000000")
      item.valid?
      expect(item.errors[:price]).to include("販売価格は¥300以上¥9,999,999以内で入力してください")
    end

  end

end
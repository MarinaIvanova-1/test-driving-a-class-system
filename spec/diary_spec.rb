require 'diary'

RSpec.describe Diary do
  context "when there are no entries in the diary" do
    it "returns an empty list" do 
      my_diary = Diary.new
      expect(my_diary.all).to eq []
    end
  end
end
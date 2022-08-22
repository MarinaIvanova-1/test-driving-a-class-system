require 'diary'
require 'diary_entry'

RSpec.describe "integration" do
  context "when we have many entries in the diary" do
    it "shows the list of all entries" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("title_one", "one " * 1000)
      diary_entry_2 = DiaryEntry.new("title_two", "two " * 2000)
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      expect(my_diary.all).to eq [diary_entry_1, diary_entry_2]
    end

    it "calculates the number of words in the whole diary" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("title_one", "one " * 1000)
      diary_entry_2 = DiaryEntry.new("title_two", "two " * 2000)
      diary_entry_3 = DiaryEntry.new("title_two", "three " * 3000)
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      my_diary.add(diary_entry_3)
      expect(my_diary.count_words).to eq 6000
    end

    it "calculates the required time to read all entries" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("title_one", "one " * 100)
      diary_entry_2 = DiaryEntry.new("title_two", "two " * 200)
      diary_entry_3 = DiaryEntry.new("title_two", "three " * 250)
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      my_diary.add(diary_entry_3)
      expect(my_diary.reading_time(200)).to eq 3
    end

    it "shows the diary entry that the user can read in limited amount of time" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("title_one", "one " * 450)
      diary_entry_2 = DiaryEntry.new("title_two", "two " * 200)
      diary_entry_3 = DiaryEntry.new("title_two", "three " * 300)
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      my_diary.add(diary_entry_3)
      expect(my_diary.find_best_entry_for_reading_time(200, 2)).to eq [diary_entry_3]
    end


  end
end
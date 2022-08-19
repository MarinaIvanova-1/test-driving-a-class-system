require 'diary_entry'
require 'diary'

RSpec.describe "integration" do
  context "when we have many entries in the diary" do
    it "shows the list of all diary entries" do
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
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      expect(my_diary.count_words).to eq 3000
    end

    it "calculates the total time required to read the whole diary" do
      my_diary = Diary.new
      diary_entry_1 = DiaryEntry.new("title_one", "one " * 1000)
      diary_entry_2 = DiaryEntry.new("title_two", "two " * 1900)
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      expect(my_diary.reading_time(150)).to eq 20
    end

    it "shows the diary entry that the user can read in limited amount of time" do
      my_diary = Diary.new
      diary_entry_1.DiaryEntry.new("title_one", "one " * 1000)
      diary_entry_2.DiaryEntry.new("title_two", "two " * 2000)
      my_diary.add(diary_entry_1)
      my_diary.add(diary_entry_2)
      expect(my_diary.find_best_entry_for_reading_time(100,11)).ro eq [diary_entry_1]
    end
  end
end
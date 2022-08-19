require 'diary_entry'

RSpec.describe DiaryEntry do
  it "counts words in a particular diary entry and returns time required to read it" do
    diary_entry_1 = DiaryEntry.new("title_one", "one " * 10)
    expect(diary_entry_1.count_words). to eq 10
    expect(diary_entry_1.reading_time(150)).to eq 1
  end

  it "returns reading chunk for certain amount of time" do
    diary_entry_1 = DiaryEntry.new("title_one", "one " * 1000)
    result = diary_entry_1.reading_chunk(150, 5)
    expect(result).to eq ("one " * 750).chop
  end 

  it "returns the next reading chunk for certain amount of 
  time if it's called more than once" do
    diary_entry_1 = DiaryEntry.new("title_one", ("one " * 100 + "two " * 200))
    diary_entry_1.reading_chunk(20, 5)
    result = diary_entry_1.reading_chunk(20, 5)
    expect(result).to eq ("two " * 100).chop
  end 

  it "returns the end of the diary entry if we have nothing else to read" do
    diary_entry_1 = DiaryEntry.new("title_one", ("one " * 150 + "two " * 200))
    diary_entry_1.reading_chunk(20, 10)
    result = diary_entry_1.reading_chunk(20, 10)
    expect(result).to eq ("two " * 150).chop
  end 

  it "restarts from the beginning if we finish reading the diary" do
    diary_entry_1 = DiaryEntry.new('title_one', ("one " * 150 + "two " * 200))
    diary_entry_1.reading_chunk(20, 10)
    diary_entry_1.reading_chunk(20, 10)
    result = diary_entry_1.reading_chunk(20, 10)
    expect(result).to eq ('one ' * 150 + 'two ' * 50).chop
  end 

  it "restarts from the beginning if we exactly finished reading the diary" do
    diary_entry_1 = DiaryEntry.new('title_one', ('one ' * 150 + "two " * 200))
    diary_entry_1.reading_chunk(20, 10)
    diary_entry_1.reading_chunk(15, 10)
    result = diary_entry_1.reading_chunk(20, 10)
    expect(result).to eq ('one ' * 150 + 'two ' * 50).chop
  end 
end
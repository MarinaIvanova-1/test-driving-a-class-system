require 'diary_entry'

class Diary
  def initialize
    @all_entries = []
  end

  def add(entry) 
    @all_entries << entry
  end

  def all
    return @all_entries
  end

  def count_words
    @count_words_all = 0
    for entry in @all_entries
      @count_words_all += entry.count_words
    end
    return @count_words_all
  end

  def reading_time(wpm) 
    (self.count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    read_words = wpm * minutes
    hash_of_entries = {}
    for entry in @all_entries
      hash_of_entries.store(entry, entry.count_words)
    end
    hash_of_entries.delete_if {|entry, length| length > read_words }
    return hash_of_entries.sort_by {|entry, length| length }.reverse.first[0...-1]
  end
end

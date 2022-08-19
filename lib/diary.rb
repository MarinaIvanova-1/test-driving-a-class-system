class Diary
  def initialize
    @all_entries = []
  end

  def add(entry) 
    @all_entries << entry
  end

  def all
    @all_entries
  end

  def count_words
    @count_words_all = 0
    for entry in @all_entries
      @count_words_all += entry.count_words
    end
    @count_words_all
  end

  def reading_time(wpm) 
    @count_words_all = 0
    for entry in @all_entries
      @count_words_all += entry.count_words
    end
    (@count_words_all.to_f / wpm).ceil 
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    read_words = wpm * minutes
    hash_of_entries = {}
    for entry in @all_entries
      hash[entry] = entry.count_words
    end
    puts hash_sorted
    hash_sorted = hash_of_entries.sort_by{|entry, length| length}



        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

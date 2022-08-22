class DiaryEntry
  def initialize(title, contents) 
    @title = title
    @contents = contents
    @current_position = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm) 
    (@contents.split(" ").length.to_f / wpm).ceil 
  end

  def reading_chunk(wpm, minutes) 
    if @current_position >= count_words
      @current_position = 0
    end
    current_chunk = @contents.split(" ")[@current_position...(@current_position + wpm * minutes)].join(" ") 
    @current_position += wpm * minutes
    return current_chunk
  end
end
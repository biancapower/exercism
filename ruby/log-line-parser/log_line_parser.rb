class LogLineParser
  def initialize(line)
    @line = line
    @log_level = @line.scan(/[A-Z]{2,}/)[0]
  end

  def message
    # remove the log type including []: and remove trailing whitespace
    @line.gsub(/\[#{@log_level}\]: /, '').strip
  end

  def log_level
    @log_level.downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

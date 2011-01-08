module TailFromSentinel
  # Parses a file, looking for a sentinel line that satisfies a block, and returns all lines from there
  # until the end of the file (including the sentinel itself)
  #
  # This can be handy when you are looking for information in a log file only after a certain condition (eg. a date)
  # has been seen.
  class Base
    attr_reader :file, :data

    # Parameters:
    #   file: File IO object
    #   &sentinel: Block, taking one parameter. Should return true when the sentinel is found.
    def initialize(file, &sentinel)
      @file=file
      @sentinel=sentinel
      load_data
      self
    end

  private
    # Read all the lines of the file, but don't store them until we find one that satisfies sentinel
    # Pushes them into @data
    def load_data
      @data=[]
      marker_found=false
      @file.rewind
      @file.each_line do |line|
        if !marker_found && @sentinel.call(line) then
          marker_found=true
        end

        @data << line if marker_found
      end
    end
  end
end

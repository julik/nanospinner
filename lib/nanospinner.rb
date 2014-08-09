class Nanospinner
  RING = ['|', '/', '-', '\\', '|', '/', '-', '\\']
  VERSION = '1.0.0'
  
  # Creates a new Spinner printing to the given IO.
  # revolved previously the previous message will be erased.
  def initialize(output_io = $stdout)
    @out_io, @counter, @erase_last_n = output_io, 0, 0
  end
  
  # Revolve the spinner with a message. If the spinner has been
  # revolved previously the previous message will be erased.
  def spin(message)
    current = ring[@counter % ring.length]
    @counter += 1
    current_output = " %s %s" % [current, message]
    write_and_flush "\r" * @erase_last_n
    write_and_flush current_output
  ensure
    @erase_last_n = current_output.length
  end
  
  private
  
  # Returns the ring of elements displaying the spinner
  def ring
    RING
  end
  
  # Writes to the @out_io and immediately flushes it
  def write_and_flush(str)
    @out_io << str
    @out_io.flush if @out_io.respond_to?(:flush)
  end
end


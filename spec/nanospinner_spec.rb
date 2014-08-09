require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.dirname(__FILE__) + '/../lib/nanospinner'

describe Nanospinner do
  let(:buf) { StringIO.new }
  let(:subject) { described_class.new(buf) }
  
  it "outputs the right messages" do
    subject.spin("Hello")
    subject.spin("Goodbye")
    
    expect(buf.string).to eq(2) #" | Hello\r\r\r\r\r\r\r\r / Goodbye")
  end
end

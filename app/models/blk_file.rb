##
# Helper file for retrieving data from .blk files. Most of the unit data included with MegaMek uses this file type.

class BlkFile
  attr_accessor :file

  def initialize(path)
    @file = File.read(path)
  end

  def value_in(label)
    file[/<#{label}>(.*?)<\/#{label}>/m, 1]&.gsub(/\r\n/, '')
  end
end

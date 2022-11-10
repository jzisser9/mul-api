def putsd(message)
  puts message if ENV['DEBUG'] == 'true'
end

puts "Seeding database, this could take a minute or two. Stand by..."
Dir.entries(Rails.root.join('data')).select { |entry| %w[. ..].exclude?(entry) }.each do |type|
  putsd "Scanning folder #{type}"
  unit_type = UnitType.where(name: type).first_or_create
  Dir.glob("#{Rails.root}/data/#{type}/**/*.mtf") do |file|
    putsd "Processing file #{file}"
    lines = File.readlines(file)
    name = lines[1].gsub("\r\n", '')
    variant = lines[2].gsub("\r\n", '')
    mul_id = lines[3].scan(/\d+/).first.to_i

    Unit.where(name: name, variant: variant, unit_type: unit_type, mul_id: mul_id).first_or_create
    putsd "Processed #{name} #{variant}"
  end

  Dir.glob("#{Rails.root}/data/#{type}/**/*.blk") do |file|
    putsd "Processing file #{file}"
    blk_file = BlkFile.new(file)
    name = blk_file.value_in('Name')
    raise "name is blank!" if name.nil?
    variant = blk_file.value_in('Model')
    mul_id = blk_file.value_in('mul id:').to_i
    raise "mul id is blank!" if mul_id.nil?

    Unit.where(name: name, variant: variant, unit_type: unit_type, mul_id: mul_id).first_or_create
    putsd "Processed #{name} #{variant}"
  end
end

class GenerateUnitSheet
  def self.call
    units = Unit.where(name: 'Centurion')
    raise "Couldn't find any Units with ids #{unit_ids}" if units.count.zero?

    ac = ActionController::Base.new
    pdf_html = ac.render_to_string(template: 'api/sheets/unit_sheet', locals: { units: units})
    pdf = WickedPdf.new.pdf_from_string(pdf_html)
    File.open("result_#{Time.now.to_i}.pdf", 'wb+') do |file|
      file.write(pdf)
    end
  end
end
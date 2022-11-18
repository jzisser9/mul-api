class Sheets::API < Grape::API
  resource :unit_sheet do
    content_type :html, 'text/html; charset=utf-8'
    format :html
    params do
      requires :unit_ids, type: String
    end
    post do
      unit_ids = JSON.parse(params[:unit_ids])
      units = Unit.where(id: unit_ids)
      raise "Couldn't find any Units with ids #{unit_ids}" if units.count.zero?

      ac = ActionController::Base.new
      ac.render_to_string(template: 'api/sheets/unit_sheet', locals: { units: units})
    end
  end
end
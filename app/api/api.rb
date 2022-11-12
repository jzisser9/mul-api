class API < Grape::API
  format :json

  mount Units::API
  mount UnitTypes::API

  get do
    {
      endpoints: [
        {
          path: '/units',
          desc: 'Returns all units.',
          filters: %w[name variant unit_type_id mul_id]
        },
        {
          path: '/units/:id',
          desc: 'Returns unit with the given :id.'
        },
        {
          path: '/unit_types',
          desc: 'Returns all unit types.',
          filters: %w[name]
        },
        {
          path: '/unit_types/:id',
          desc: 'Returns unit type with the given :id.'
        }
      ]
    }
  end
end
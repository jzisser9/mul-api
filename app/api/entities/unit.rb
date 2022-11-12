class Entities::Unit < Grape::Entity
  expose :id, :name, :variant, :unit_type_id, :mul_link

  with_options(if: { include_image_url: true }) do
    expose :image_url
  end

end

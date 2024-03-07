class PhalangeSerializer < BaseSerializer
  attributes :id,
              :name, 
              :description, 
              :status,
              :order,
              :image,
              :created_at,
              :updated_at
end

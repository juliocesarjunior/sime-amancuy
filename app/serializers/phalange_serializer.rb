class PhalangeSerializer < BaseSerializer
  attributes :id,
              :name, 
              :description, 
              :status,
              :image,
              :order,
              :created_at,
              :updated_at
end

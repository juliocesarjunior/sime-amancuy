class LibrarySerializer < BaseSerializer
  attributes :id,
              :name, 
              :description, 
              :status,
              :file,
              :created_at,
              :updated_at
end

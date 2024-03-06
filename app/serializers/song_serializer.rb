class SongSerializer < BaseSerializer
  attributes :id,
            :name, 
            :description, 
            :phalange, 
            :status,
            :archive,
            :created_at,
            :updated_at

  def archive
    archive = {
      id: (object.archive.id rescue nil),
      name: (object.archive.name rescue nil),
      file: (object.archive.file rescue nil), 
    }
  end

  def phalange
    object.phalange
  end
end


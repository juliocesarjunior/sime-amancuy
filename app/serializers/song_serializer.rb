class SongSerializer < BaseSerializer
  attributes :id,
  :name, 
  :description, 
  :phalange, 
  :status,
  :archives,
  :created_at,
  :updated_at


  def archives
    object.archives.map do |archive|
      {
        id: archive.id,
        name: archive.name,
        file: archive.file.url
      }
    end
  end

  def phalange
    {
      id: object.phalange.id,
      name: object.phalange.name
    }
  end
end


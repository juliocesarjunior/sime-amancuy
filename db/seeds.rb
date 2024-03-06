# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if true

  User.create!(
    name: 'Admin',
    email: "admin@admin.com",
    password: '1234567890',
    status: 0
    )

  puts "##FALANGES"
  Dir["#{Rails.root}/app/assets/images/falanges/*.{jpg,png}"].sort_by { |file| file.match(/\d+/).to_s.to_i }.each_with_index do |file, index|

    content_type = File.extname(file) == ".jpg" ? "image/jpeg" : "image/png"
    image = Rack::Test::UploadedFile.new(file, content_type)

    filename_without_extension = File.basename(file, ".*").gsub('-', ' ').humanize
    filename_without_numbers = filename_without_extension.gsub(/\d+/, '')

    puts "## Falanges: #{filename_without_numbers}"
    Phalange.create!(
      name: filename_without_numbers.titleize,
      description: filename_without_numbers.titleize,
      status: 0,
      image: image,
      order: index + 1
      )
  end


  puts "##BIBLIOTECA"
  Dir["#{Rails.root}/public/pdf/*.pdf"].each do |pdf_path|
    pdf_name = File.basename(pdf_path, File.extname(pdf_path))
    parts = pdf_name.split(" – ")

    if parts.length >= 2
      description = parts[0].strip
      name = parts[1..].join(" – ").strip

      library = Library.create(
        name: name,
        description: description,
        status: 0,
        file: File.open(pdf_path)
        )
    end
    puts "## PDF: #{pdf_name} OK" 
  end

  puts "##Cantos"
  archives_by_falange = Hash.new { |hash, key| hash[key] = [] }

  pdf_files = Dir["#{Rails.root}/public/Cantos/ordem/*.pdf"].sort_by { |file| File.basename(file).to_i }

  pdf_files.each do |pdf_path|
    pdf_name = File.basename(pdf_path, File.extname(pdf_path))
    parts = pdf_name.split(" - ")

    falange_number = parts[0].to_i
    archive_name = parts[1..].join(" - ").strip

    falange = Phalange.find_by(id: falange_number)

    archives_by_falange[falange_number] << {
      name: archive_name,
      file: File.open(pdf_path)
    }
  end

  archives_by_falange.each do |falange_number, archives|
    falange = Phalange.find_by(id: falange_number)

    song = Song.create!(
      name: falange.name,
      description: falange.name,
      phalange_id: falange.id,
      archives_attributes: archives
      )
    puts "## Song: #{song.name} OK"
  end
else
  Archive.delete_all
  Song.delete_all





  # puts "##canto"
  # Dir["#{Rails.root}/public/Cantos/ordem/*.pdf"].each do |archive|
  #   filename = File.basename(archive)
  #   puts filename
  # end


end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if false

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
  
  Library.delete_all
  Dir["#{Rails.root}/public/pdf/*.pdf"].each do |pdf_path|
    pdf_name = File.basename(pdf_path, File.extname(pdf_path))
    parts = pdf_name.split(" – ")

    if parts.length >= 2
      description = parts[0].strip
      name = parts[1..].join(" – ").strip

      Library.create(
        name: name,
        description: description,
        status: 0
        )
    end
  end
else
  puts "##BIBLIOTECA"
  Dir["#{Rails.root}/public/pdf/*.pdf"].each do |archive|
    file = File.open(archive)
    filename = File.basename(file.path).gsub('–', ' ').gsub('.pdf', '').humanize

    puts filename
  end


end



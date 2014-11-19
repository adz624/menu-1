namespace :dev do
  task :rebuild => [:environment, 'db:drop', 'db:create', 'db:migrate', 'db:seed']

  task :fake => :environment do
    (1..100).each do |i|
      album = Album.create(name: "kakaja#{i}", city: '高雄市', zone: '左營區')
      album.photos.create(name: 'First photo', city: '高雄市', zone: '左營區', image: File.open('public/kakaja.jpg'), status: 0)
    end
  end
end
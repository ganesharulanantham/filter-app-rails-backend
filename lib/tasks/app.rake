namespace :app do
  desc "Creates Migrates and seeds database"
  task bootstrap: :environment do
    puts "Drops Existing Table"
    Rake::Task["db:drop"].invoke
    puts "Starts Creating Table"
    Rake::Task["db:create"].invoke
    puts "Starts Migrating Table"
    Rake::Task["db:migrate"].invoke
    puts "Starts Seeding Table"
    sample_seed
    puts "End"
  end

  desc "Sample Seeds only data"
  task seed: :environment do
    puts "Starts Seeding Table"
    sample_seed
    puts "End"
  end

  def sample_seed
    file = File.read('sample.json')
    records = JSON.parse(file)
    puts Screening.create(records).inspect
  end

end

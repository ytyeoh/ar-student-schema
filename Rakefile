require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'


desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

task "db:seed" do

   9.times do
      Student.create :first_name => Faker::Name.first_name,
                     :last_name  => Faker::Name.last_name,
                     :gender     => ['m', 'f'].sample,
                     :email      => Faker::Internet.email,
                     :phone     => Faker::PhoneNumber.phone_number,
                     :birthday  => Date.today - rand(15..40)*365
    end
  end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs

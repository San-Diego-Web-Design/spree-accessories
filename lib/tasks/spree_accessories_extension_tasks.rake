namespace :db do
  desc "Bootstrap your database for Spree."
  task :bootstrap  => :environment do
    # load initial database fixtures (in db/sample/*.yml) into the current environment's database
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
    Dir.glob(File.join(SpreeAccessoriesExtension.root, "db", 'sample', '*.{yml,csv}')).each do |fixture_file|
      Fixtures.create_fixtures("#{SpreeAccessoriesExtension.root}/db/sample", File.basename(fixture_file, '.*'))
    end

  end
end

namespace :spree do
  namespace :extensions do
    namespace :spree_accessories do
      desc "Copies public assets of the Spree Accessories to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[SpreeAccessoriesExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(SpreeAccessoriesExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
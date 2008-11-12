namespace :svn do

  task :config do
    @svn_path="https://server1.railshosting.cz:2000/petrfiala/"
    @username="svn"
  end

  desc "Prepare repository and do initial commit"
  task :initial_import => [:config] do
    system "svn mkdir --username #{@username} #{@svn_path}/trunk -m \"Add trunk\""
    system "svn import --username #{@username} #{@svn_path}/trunk -m \"Initital import\""
  end

  desc "Sanitize files in repository"
  task :sanitize do
    system "svn remove log/*"
    system "svn commit -m 'removing all log files from subversion'"
    system 'svn propset svn:ignore "*.log" log/'
    system "svn update log/"
    system "svn commit -m 'Ignoring all files in /log/ ending in .log'"
    system 'svn propset svn:ignore "*.db" db/'
    system "svn update db/"
    system "svn commit -m 'Ignoring all files in /db/ ending in .db'"
    system "svn move config/database.yml config/database.example"
    system "svn commit -m 'Moving database.yml to database.example to provide a template for anyone who checks out the code'"
    system 'svn propset svn:ignore "database.yml" config/'
    system "svn update config/"
    system "svn commit -m 'Ignoring database.yml'"
    system "svn remove tmp/*"
    system "svn commit -m 'Removing /tmp/ folder'"
    system 'svn propset svn:ignore "*" tmp/'
  end
   
  desc "Add new files to subversion"
  task :add_new_files do
    system "svn status | grep '^\?' | sed -e 's/? *//' | sed -e 's/ /\ /g' | xargs svn add"
  end

end

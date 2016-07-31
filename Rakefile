require 'rake'

namespace :info do
  desc "renew the website to newest activities"
  task :renew do
    system "bundle exec ruby script/update.rb -o data/activities.yml"
    system "bundle exec middleman build"
    system "cp -R build/* public/"
  end
end

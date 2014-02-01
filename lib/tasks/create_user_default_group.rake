#rake seed:create_user_default_group
namespace :seed do
  desc "generate default other data type group for users that do not have one already"
  task :create_user_default_group => :environment do
    User.all(:conditions => {:other_group_id => nil}).each do |user|
      if user.generate_other_group
        puts "Updated #{user.name}"
      end
    end
  end
end
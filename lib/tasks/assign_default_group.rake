# lib/tasks/assign_default_group.rake
namespace :seed do
  desc "assign default other data type group to data types that do not have a group already"
  task :assign_default_group => :environment do
    DatumType.all(:conditions => {:group_id => nil}).each do |dType|
      if dType.assign_other_group
        dType.save
        puts "Update #{dType.description}"
      end
    end
  end
end
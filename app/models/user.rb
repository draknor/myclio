class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :time_zone

  after_create :generate_other_group

  has_many :datumTypes, inverse_of: :user
  has_many :data, inverse_of: :user
  has_many :groups, inverse_of: :user


  # Attributes
  def time_zone
    self[:time_zone].nil? ? Myclio::Application.config.time_zone : self[:time_zone]
  end

  def searchData(searchVals,max = 0)
  	searchVals[:user_id] = self.id
  	Datum.search(searchVals)
	end

  def generate_other_group
    return if self.other_group_id
    group = Group.new(name: "{other}", user_id: self.id)
    if group.save
      self.update_attribute(:other_group_id,group.id)
      return group.id
    end
  end

  def userGroups
    groups = Group.where("user_id = ? AND id <> ?", self.id, self.other_group_id).all
  end
end

class Group < ActiveRecord::Base
  attr_accessible :user_id, :name

  belongs_to :user, inverse_of: :groups
  has_many :datumTypes

  validates :name, presence: true

  default_scope order('name ASC')

end

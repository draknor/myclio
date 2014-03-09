class Group < ActiveRecord::Base
  attr_accessible :user_id, :name

  belongs_to :user, inverse_of: :groups
  has_many :datumTypes

  validates :name, presence: true

  default_scope order('groups.name ASC')
  scope :has_types, joins(:datumTypes).group('groups.id').having('count(datum_types.id)>0')
  scope :has_active_types, joins(:datumTypes).where('datum_types.inactive != true OR datum_types.inactive IS NULL').group('groups.id').having('count(datum_types.id)>0')

end

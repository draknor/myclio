class DatumType < ActiveRecord::Base
  attr_accessible :description, :id, :user_id, :group_id
  before_save :assign_other_group

  belongs_to :user, inverse_of: :datumTypes
  belongs_to :group, inverse_of: :datumTypes
  has_many :data

  validates :description, presence: true

  default_scope order('description ASC')

  # assigns the user's default group if none is already assigned
  # does NOT save; responsibility of the caller to do that
  def assign_other_group
    return if self.group
    other = self.user.other_group_id
    return if other.nil?
    self.group_id = other
    self.group_id
  end
end

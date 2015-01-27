class DatumType < ActiveRecord::Base
  attr_accessible :name, :description, :id, :user_id, :group_id, :inactive, :is_private
  before_save :assign_other_group

  belongs_to :user, inverse_of: :datumTypes
  belongs_to :group, inverse_of: :datumTypes
  has_many :data

  validates :name, presence: true

  default_scope order('name ASC')
  scope :active, where('inactive != true OR inactive IS NULL')
  scope :visible, where(is_private: nil)



  # assigns the user's default group if none is already assigned
  # does NOT save; responsibility of the caller to do that
  def assign_other_group
    return if self.group
    other = self.user.other_group_id
    return if other.nil?
    self.group_id = other
    self.group_id
  end

  def activate
    if self.inactive.nil? || self.inactive
      self.update_attributes(inactive: false)
    end
    !self.inactive
  end

  def deactivate
    if self.inactive.nil? || !self.inactive
      self.update_attributes(inactive: true)
    end
    self.inactive
  end


end

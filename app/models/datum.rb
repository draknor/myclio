class Datum < ActiveRecord::Base
  attr_accessible :comment, :datumType_id, :id, :user_id, :value, :effective_at

  belongs_to :user, inverse_of: :data
  belongs_to :datumType, inverse_of: :data

  scope :desc, order('effective_at DESC')

end

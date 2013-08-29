class Datum < ActiveRecord::Base
  attr_accessible :comment, :datumType_id, :id, :user_id, :value

  belongs_to :user, inverse_of: :data
  belongs_to :datumType, inverse_of: :data

end

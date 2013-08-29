class DatumType < ActiveRecord::Base
  attr_accessible :description, :id, :user_id

  belongs_to :user, inverse_of: :datumType
  has_many :data

end

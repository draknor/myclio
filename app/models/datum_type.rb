class DatumType < ActiveRecord::Base
  attr_accessible :description, :id, :user_id

  belongs_to :user, inverse_of: :datumTypes
  has_many :data

  validates :description, presence: true


end

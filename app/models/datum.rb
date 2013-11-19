class Datum < ActiveRecord::Base
  attr_accessible :comment, :datumType_id, :id, :user_id, :value, :effective_at

  belongs_to :user, inverse_of: :data
  belongs_to :datumType, inverse_of: :data

  scope :desc, order('effective_at DESC')

  def self.search(searchVals,max = 0)
  	data = Datum.scoped( :order => 'effective_at DESC' );

  	unless searchVals[:user_id].blank?
  		data = data.scoped( :conditions => ['user_id = ?', searchVals[:user_id] ] ) 
		end

  	unless searchVals[:comment].blank?
  		data = data.scoped( :conditions => ['comment LIKE ?', "%#{searchVals[:comment]}%"] ) 
		end

  	unless searchVals[:datumType].blank?
  		data = data.scoped( :conditions => ['datumType_id = ?', searchVals[:datumType] ] ) 
		end

		unless searchVals[:effective_at].blank?
  		date = Time.zone.parse(searchVals[:effective_at])
  		data = data.scoped( :conditions => ['DATE(effective_at) = DATE(?)', date] ) unless date.blank?
		end

  	max > 0 ? data.limit(max) : data
	end

end

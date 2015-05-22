class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: 'User', foreign_key: 'user_id'
  belongs_to :voteable, polymorphic: true

  validates_uniqueness_of :voter, scope: [:voteable_id, :voteable_type]
  #same as above
  #validates :voter, uniqueness: {scope: [:voteable_id, :voteable_type], message: 'You can not vote twice'}
  #or
  #validates_uniqueness_of :voter, scope: :voteable 

end
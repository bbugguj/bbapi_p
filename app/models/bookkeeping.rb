
class Bookkeeping < ActiveRecord::Base
  belongs_to :issuer, class_name: 'User'
  belongs_to :writer, class_name: 'User'
  belongs_to :account_title
  belongs_to :group
  
  include Likable  

  has_many :proofs, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, class_name: 'User', foreign_key: :user_id, through: :likes,  source: :liker  

  validates :group_id, presence: true
  validates :account_title_id, presence: true
  validates :writer_id, presence: true

  def self.get_first_issue_date
    Bookkeeping.select("issue_date").order("issue_date ASC").first.issue_date
  end
end

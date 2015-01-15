class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :articles

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg" ]

  acts_as_voter

  acts_as_followable
  acts_as_follower
end

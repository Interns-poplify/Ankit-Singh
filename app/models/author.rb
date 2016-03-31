class Author < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :articles
  has_many :comments
  ratyrate_rater
  has_attached_file :photo, :styles => { :circle => "40x40", :nano => "30x30",:small => "50x50>",:medium => "200x200>" }
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  devise :database_authenticatable, :registerable, :omniauthable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:facebook]

     def self.find_for_omniauth(auth)
     	find_or_create_by(uid: auth.uid, provider: auth.provider)
     end
 
end

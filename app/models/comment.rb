class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :author
  validates_presence_of :body
end

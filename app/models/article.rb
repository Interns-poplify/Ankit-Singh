class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
	belongs_to :author
    ratyrate_rateable 'content', 'visuality', 'writer'

 
has_attached_file :image, :styles => { :small => "150x150>", :medium => "950x400>" }
validates_attachment_size :image, :less_than => 5.megabytes
validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
validates_presence_of :title, :body
def tag_list
	self.tags.collect do |tag|
    tag.name
  end.join(", ")

end

def tag_list=(tags_string)
  tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  self.tags = new_or_found_tags
end
end
class Article < ActiveRecord::Base
	acts_as_ordered_taggable
	validates :title, :content, :tag_list, presence: true
end

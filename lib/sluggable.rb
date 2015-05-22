module Sluggable

	extend ActiveSupport::Concern

	included do 
		before_save :generate_slug
		class_attribute :slug_column #set the column name to attribute
	end

  def generate_slug
    self.slug = self.send(self.class.slug_column.to_sym).gsub(' ', '_').downcase 
    loop do 
      if self.class.all.map{|post|post.slug}.include?(self.slug)
        self.slug = self.slug + "1"
      else
        break
      end
    end 
  end

  def to_param
  	self.slug
  end

  module ClassMethods
	  def sluggable_column(col_name)
	  	self.slug_column = col_name
	  end
	end

end
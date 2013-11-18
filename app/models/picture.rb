class Picture < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, 
    :styles => { :medium => "350x350>", :thumb => "100x100>", large: "1000x1000" }

  validates_attachment_presence :image
end

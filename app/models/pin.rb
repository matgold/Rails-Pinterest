class Pin < ActiveRecord::Base
   belongs_to :user
   has_many :comments, :dependent => :destroy
   has_attached_file :image, :styles => {:medium => "500x500>", :thumb => "300x300>" }
   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   validates_with AttachmentSizeValidator, attributes: :image, less_than: 300.kilobytes
   validates :description, presence: true
   validates :image, presence: true
end

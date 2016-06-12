class Comment < ActiveRecord::Base
   belongs_to :user
   belongs_to :pin
   validates :description, presence: true
   
   default_scope -> { order(created_at: :desc) }
end

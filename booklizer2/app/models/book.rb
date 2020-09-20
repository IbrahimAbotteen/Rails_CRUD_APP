class Book < ApplicationRecord
    belongs_to :subject
    validates_presence_of :title ##this is to avoid nulls
    validates_numericality_of :price, :message=>"Error Message" #this is to make sure the data is number
end

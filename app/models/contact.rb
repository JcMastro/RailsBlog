class Contact < ApplicationRecord
    require 'active_support/core_ext/string'
    
    has_many :phones , dependent: :destroy

    accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => :all_blank

    validates :name, presence: true
    validates :dob, presence: true, length: { minimum: 10}
    validates :email, presence: true

    def age            
        now = Time.zone.now
        age = (now - dob) / 1.year
        age = age.truncate
    end

end

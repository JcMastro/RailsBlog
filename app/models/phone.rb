class Phone < ApplicationRecord

    belongs_to :contact

    validates :phone_type, presence: true 
    validates :number, presence: true, length: { is: 8 }#
    validate  :formato_numero_costa_rica? 

    def formato_numero_costa_rica?
        if self.phone_type.downcase == "landline"
            errors.add(:base, 'Formato invalido para numero telefonico local de Costa Rica') unless self.number[0] == "2" || self.number[0] == "4" || self.number[0] == "5"                
            
        elsif self.phone_type.downcase == "mobile"
            errors.add(:base, 'Formato invalido para numero telefonico mobile de Costa Rica') unless self.number[0] == "6" || self.number[0] == "7" || self.number[0] == "8"
        
        else
            errors.add(:base, 'Formato de numero invalido')
        end               
    end

end

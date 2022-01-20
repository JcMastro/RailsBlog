class Phone < ApplicationRecord

    belongs_to :contact

    validates :phone_type, presence: true 
    validates :number, presence: true, length: { is: 8 }#, if: :formato_numero_costa_rica? 

    def formato_numero_costa_rica?
        if phone_type == "landline"
            errors.add(:base, 'Formato de numero invalido para numero telefonico local de Costa Rica') if :number[0,1] != "2" or :number[0,1] != "4" or :number[0,1] != "5"                
            
        elsif phone_type == "mobile"
            errors.add(:base, 'Formato de numero invalido para numero telefonico mobile de Costa Rica') if :number[0,1] < "6" and :number[0,1] > "8"
        
        else
            errors.add(:base, 'Formato de numero invalido')
        end               
    end

end

class Person < ApplicationRecord
    def Person.salutations
        [nil, "", "Mr.", "Mrs.", "Ms."]
    end

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :salutation, inclusion: { in: self.salutations,
        message: "%{value} is not a valid salutation" }
end

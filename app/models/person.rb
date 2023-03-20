class Person < ApplicationRecord
    def Person.salutations
        [nil, "", "Mr.", "Mrs.", "Ms."]
    end

    has_many :addresses, dependent: :destroy

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :salutation, inclusion: { in: self.salutations,
        message: "%{value} is not a valid salutation" }

    def display_name
        [self.salutation, self.first_name, self.middle_name, self.last_name].join(" ")
    end
end

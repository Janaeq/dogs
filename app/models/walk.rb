class Walk < ApplicationRecord
    belongs_to :walker
    belongs_to :dog

    validates :date_time, presence: true
    validates_associated :dog
    # accepts_nested_attributes_for :dog

    def dog_attributes=(dog_params)
        dog = Dog.find_or_create_by(dog_params)
        if dog.valid?
            self.dog = dog
        end
    end
end
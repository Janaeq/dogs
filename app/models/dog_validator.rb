class DogValidator < ActiveModel::Validator
    def validate(dog)
        byebug
        if user.dogs.include?(Dog.find_by(name: dog.name))
            dog.errors.add :name, "- This dog already exists for you!"
        end
    end
end
class DogValidator < ActiveModel::Validator
    def validate(dog)
        user = User.find(dog.user_id)
        if user.dogs.include?(Dog.find_by(name: dog.name))
            dog.errors.add :name, "- This dog already exists for you!"
        end
    end
end
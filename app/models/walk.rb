class Walk < ApplicationRecord
    belongs_to :walker
    belongs_to :dog

    accepts_nested_attributes_for :dog
end
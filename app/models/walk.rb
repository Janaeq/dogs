class Walk < ApplicationRecord
    belongs_to :walker_id
    belongs_to :dog
end

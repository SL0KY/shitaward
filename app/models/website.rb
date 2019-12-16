class Website < ApplicationRecord
    has_many :votes
    has_many :upvotes
end
class Upvote < Vote 
    after_create :increment_counter

    def increment_counter
        website.increment!(:upvotes_count)
    end
end
class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def top_post
        self.posts.sort_by {|post| post.likes}.first
    end

    def top_five
        a = self.posts.sort_by {|post| post.destination}
        b= Hash.new(0)
        
    end
end

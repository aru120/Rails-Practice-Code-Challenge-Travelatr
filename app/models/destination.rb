class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        self.posts.sort_by {|post| post.created_at}.first(5)
    end

    def top_post
        self.posts.sort_by {|post| post.likes}.first
    end

    def avg_age
        total_age = 0
        self.bloggers.uniq.each do |blogger|
            total_age += blogger.age
        end
        total_age / self.bloggers.uniq.count
    end

end

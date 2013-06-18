class Comment < ActiveRecord::Base
  attr_accessible :author_name, :body, :article_id
  validates :article_id, :presence => true

  def self.for_dashboard
    order('created_at DESC').limit(5).all
  end

  def word_count
    body.split.count
  end

  def self.total_word_count
    all.inject(0) {|total, a| total += a.word_count }
  end
end

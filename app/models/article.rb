# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Article < ApplicationRecord
  # Relations
  belongs_to :author, class_name: "User"
  has_rich_text :content
  acts_as_taggable_on :tags

  # Validations
  validates :title, presence: true
end

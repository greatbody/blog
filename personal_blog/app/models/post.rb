class Post < ApplicationRecord
  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true
  
  # Callbacks
  before_validation :generate_slug, on: :create
  
  # Scopes
  scope :published, -> { where(published: true).order(published_at: :desc) }
  scope :draft, -> { where(published: false).order(created_at: :desc) }
  
  # Instance methods
  def publish!
    update(published: true, published_at: Time.current)
  end
  
  def unpublish!
    update(published: false)
  end
  
  def to_param
    slug
  end
  
  private
  
  def generate_slug
    return if slug.present?
    base_slug = title.parameterize
    self.slug = base_slug
    
    # Handle duplicate slugs
    counter = 2
    while Post.exists?(slug: self.slug)
      self.slug = "#{base_slug}-#{counter}"
      counter += 1
    end
  end
end

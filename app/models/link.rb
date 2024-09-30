class Link < ApplicationRecord
  validates :original_url, presence: true, format: URI::regexp(%w[http https])
  validates :slug, uniqueness: true

  scope :active, -> { where('expires_at IS NULL OR expires_at > ?', Time.current) }

  def active?
    expires_at.nil? || expires_at > Time.current
  end

  def expired?
    expires_at.present? && expires_at < Time.current
  end
end

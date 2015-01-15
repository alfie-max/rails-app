class Article < ActiveRecord::Base
  belongs_to :user
  validates :content, :title, presence: true

  has_attached_file :video
  validates_attachment_content_type :video, :content_type => ["video/mp4", "video/mkv", "video/mpg", "audio/mp3"]

  acts_as_commentable
  acts_as_votable
end


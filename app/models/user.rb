class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  before_save { self.email = email.downcase if email.present? }
  before_save :format_name
  before_save { self.role ||= :member }

has_secure_password

  EMAIL_REGEX  = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,presence: true,uniqueness: { case_sensitive: false },length: { minimum: 3, maximum: 254 }, format: {with: EMAIL_REGEX}
             def format_name
                if name
                      name_array = []
                      name.split.each do |name_part|
                      name_array << name_part.capitalize
                end
                     self.name = name_array.join("")
                   end
             end
enum role: [:member, :admin, :moderator]
   def favorite_for(post)
     favorites.where(post_id: post.id).first
   end
   def avatar_url(size)
       gravatar_id = Digest::MD5::hexdigest(self.email).downcase
       "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
     end
end
 

Spree::User.class_eval do

    has_many :projects
    has_many :articles
    has_many :orders

    validates_presence_of :username
    validates_uniqueness_of :username

    attr_accessible :username, :active

end

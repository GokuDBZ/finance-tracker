class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_stocks, class_name: 'UserStock'
  has_many :stocks, through: :user_stocks
  has_many :friendships, class_name: "Friendship"
  
  # we cannot add class_name here as "Friendship because then it would give friendhsip as result not user"
  has_many :friends, through: :friendships
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def can_add_stock?(ticker)
    under_stock? && !stock_already_exist?(ticker)
  end
  
  def stock_already_exist?(ticker)
    self.stocks.where(ticker: ticker.upcase).any?
  end
  
  def self.search(to_be_searched)
    result = nil
    ["first_name","last_name","email"].each do |search|
      result = search_by_(search, to_be_searched)
      break if result.present?
    end
    result
  end
  
  def self.search_by_(find_by = "email", to_be_searched)
    return User.where("#{find_by} LIKE ? ", "%#{to_be_searched}%")
  end
 
  def under_stock?
    self.stocks.count <= 10
  end
  
  def user_name
    return "#{self.first_name} #{self.last_name}".strip if self.first_name || self.last_name
    #if both are not present then simpy return 
    "ANONYMOUS"
  end
end

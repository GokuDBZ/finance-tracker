class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_stocks, class_name: 'UserStock'
  has_many :stocks, through: :user_stocks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def can_add_stock?(ticker)
    under_stock? && !stock_already_exist?(ticker)
  end
  
  def stock_already_exist?(ticker)
    self.stocks.where(ticker: ticker.upcase).any?
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

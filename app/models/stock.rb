class Stock < ActiveRecord::Base
    
    def self.new_from_lookup ticker
       look_up_stock = StockQuote::Stock.quote(ticker)
       return nil unless look_up_stock.name
        
        new_stock = new(name: look_up_stock.name, ticker: look_up_stock.symbol)
        new_stock.last_price = new_stock.price
        new_stock
    end
    
    def price
        price_look_up = StockQuote::Stock.quote(self.ticker)
        return price_look_up.cp if price_look_up.cp.present?
        return price_look_up.op if price_look_up.op.present?
        return "UNAVAILABLE"
    end
    
    def find_by_symbol(ticker)
        self.where(ticker: ticker).first
    end
end

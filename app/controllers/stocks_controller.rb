class StocksController < ApplicationController
 def search
    if params[:ticker]
        @stock = Stock.where(ticker: params[:ticker]).first
        @stock ||= Stock.new_from_lookup(params[:ticker])
        
        if @stock.present?
            render partial: "lookup"
        else
            render status: :not_found, nothing: true
        end
    end
 end
end
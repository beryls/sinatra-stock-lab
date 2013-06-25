require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoofinance'

get '/quote' do
  @ticker = params[:ticker]
  if @ticker
    @ticker.upcase!
    @result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker].lastTrade
  else
    @result = 0
  end
  erb :quote
end


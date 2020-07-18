class PagesController < ApplicationController
  def home
    #get latest 10 messages
    @expressions = Expression.last(10)
    @expression = Expression.new
  end
end

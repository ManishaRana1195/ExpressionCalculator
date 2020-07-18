class PagesController < ApplicationController
  def home
    #get latest 10 messages
    @expressions = Expression.all  
    @expression = Expression.new
  end
end

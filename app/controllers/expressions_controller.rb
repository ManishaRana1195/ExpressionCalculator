class ExpressionsController < ApplicationController
  def create
    @expression = Expression.new(expression_params)
    @expression.save
  end

  @private
  def expression_params
    params.require(:expression).permit(:body)
  end
end

class ExpressionsController < ApplicationController
  def create
    @expression = Expression.new(expression_params)
    @expression.save
    redirect_to :root
  end

  @private
  def expression_params
    params.require(:expression).permit(:body)
  end
end

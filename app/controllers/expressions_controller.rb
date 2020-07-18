class ExpressionsController < ApplicationController
  def create
    @expression = Expression.new(expression_params)
    @expression.body = @expression.solve
    if @expression.body
      @expression.save
      redirect_to :root
    else
      redirect_to :root, notice: 'Please enter valid mathematical expression like 5*10'
    end
  end

  @private
  def expression_params
    params.require(:expression).permit(:body)
  end
end

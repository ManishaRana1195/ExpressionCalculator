class ExpressionBroadcastJob < ApplicationJob
  queue_as :default

  def perform(expression)
    ActionCable.server.broadcast "chat",{
       expression: render_expression(expression)
    }
  end

  private 
  def render_expression(expression)
    ExpressionsController.render(
      partial:'expression',
      locals: {
        expression: expression
      }
    )
  end
end

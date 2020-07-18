class Expression < ApplicationRecord
    after_create_commit  :send_expressiom
    validates_presence_of :body, :message => 'Please enter valid mathematical expression.'
    
    def send_expressiom
        ExpressionBroadcastJob.perform_later(self)
    end

    def solve()
        expression = self.body
        expression = expression.gsub(" ", "")
       
        stack_operand, stack_operator = get_operators_operands(expression)
        
        if stack_operator.nil? or stack_operand.nil?
            return nil
        end
        if stack_operator.length() >= stack_operand.length()
            return nil
        end
        while stack_operator.length() > 0
            value_a = stack_operand.pop()
            value_b = stack_operand.pop()
            operator = stack_operator.pop()
            stack_operand.append(calculate(value_a, value_b, operator))
        end
        result = stack_operand.pop()
        final_expression = "#{expression} = #{result}"
       
        return final_expression
    end

    def get_operators_operands(expression)
        stack_operator = []
        stack_operand =  []
        operators = ["+", "/", "-", "*"]
        length = expression.length
        index = 0
        
        while index < length
            curr_char = expression[index]
            
            if operators.include? curr_char
                index += 1
                stack_operator.append(curr_char)
            elsif numeric(curr_char)
                number = 0
                while index < length and numeric(expression[index])
                    number = (number * 10) + expression[index].to_i
                    index += 1
                end
                stack_operand.append(number)
            else
                return nil, nil
            end 
        end   
        stack_operand.reverse()
        stack_operator.reverse()
        return stack_operand, stack_operator
    end

    def calculate(value_a, value_b, operator)
        return value_a / value_b if operator == "/"
        return value_a + value_b if operator == "+"
        return value_a - value_b if operator == "-"
        return value_a * value_b if operator == "*"
    end


    def numeric(character)
        Float(character) != nil rescue false
    end
   
end

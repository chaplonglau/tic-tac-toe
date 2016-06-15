class InputValidator

  def isInputValid(input)
   input.is_a?(Integer) && input.between?(1,9)
  end

end

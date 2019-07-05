# frozen_string_literal: true

# Create module WordDeclination
module WordDeclination
  def declination(number)
    return 'pt' if number == 1
    return 'pts' if number >= 2 || number.zero?
  end
end

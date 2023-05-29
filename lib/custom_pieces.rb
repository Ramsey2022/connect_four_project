# frozen_string_literal: true

# module for custom player colors
module CustomPieces
  def yellow_circle
    "\e[33m\u25cf\e[0m"
  end

  def blue_circle
    "\e[36m\u25cf\e[0m"
  end

  def empty_circle
    "\u25cb"
  end
end

# frozen_string_literal: true

# console art for drawing the stages of hangman
module Art
  def stage
    <<~HEREDOC
      ------------------
      |
      |
      |
      |
      |
      |
      |
    HEREDOC
  end

  def noose
    <<~HEREDOC
      ------------------
      |             |
      |
      |
      |
      |
      |
      |
    HEREDOC
  end

  def head
    <<~HEREDOC
      ------------------
      |             |
      |             😐
      |
      |
      |
      |
      |
    HEREDOC
  end

  def torso
    <<~HEREDOC
      ------------------
      |             |
      |             😓
      |             |
      |             |
      |
      |
      |
    HEREDOC
  end

  def left_arm
    <<~HEREDOC
      ------------------
      |             |
      |             😡
      |            /|
      |             |
      |
      |
      |
    HEREDOC
  end

  def right_arm
    <<~HEREDOC
      ------------------
      |             |
      |             😥
      |            /|\\
      |             |
      |
      |
      |
    HEREDOC
  end

  def left_leg
    <<~HEREDOC
      ------------------
      |             |
      |             😭
      |            /|\\
      |             |
      |            /
      |
      |
    HEREDOC
  end

  def right_leg
    <<~HEREDOC
      ------------------
      |             |
      |             😬
      |            /|\\
      |             |
      |            / \\
      |
      |
    HEREDOC
  end
end

defmodule Anagram do
  def is_anagram(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)
end
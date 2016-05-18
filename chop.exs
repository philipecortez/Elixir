defmodule Chop do
  def guess(actual, low..high) do
    guess = div(high+low, 2)
    IO.puts "Is it #{guess}"
    _guess(actual, guess, low..high)
  end

  defp _guess(actual, actual, _) do
    IO.puts "I done it is #{actual}"
  end

  defp _guess(actual, guess, low..high)
    when guess > actual do
      guess(actual, low..guess-1)
  end

  defp _guess(actual, guess, low..high)
    when guess < actual do
      guess(actual, guess+1..high)
  end
end
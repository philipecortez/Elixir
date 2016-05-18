defmodule Sum do
  def one_to(0), do: 0
  def one_to(n), do: n + one_to(n - 1)
end
defmodule Asc do
  def is_printable_asc([]), do: true
  def is_printable_asc([head | tail]) when head in 32..126, do: true && is_printable_asc(tail)
  def is_printable_asc([head | _]) when head < 32 or head > 126, do: false
end
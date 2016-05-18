defmodule MyList do

  def my_max([head | tail]), do: _my_max(tail, head)
  def _my_max([], greatest), do: greatest
  def _my_max([head | tail], greatest) when greatest > head, do: _my_max(tail, greatest)
  def _my_max([head | tail], greatest) when greatest < head, do: _my_max(tail, head)

end
defmodule StringCenter do

  def center(list_of_words) do
    _get_dqs_list_max_lenght(list_of_words)
    |> _center(list_of_words)
  end

  def _center(_, []), do: IO.write ""
  def _center( max_len, [head | tail]) do
      String.codepoints(head)
      |> _ljust(max_len)
      |> Enum.join
      |> IO.puts
      _center(max_len, tail)
  end

  def _rjust(codepoints, max_len) when length(codepoints) <= max_len do
    (codepoints ++ [" "])
    |> _ljust(max_len)
  end
  def _rjust(codepoints, _), do: codepoints

  def _ljust(codepoints, max_len) when length(codepoints) <= max_len do
    ([" "] ++ codepoints)
    |> _rjust(max_len)
  end
  def _ljust(codepoints, _), do: codepoints

  def _get_dqs_list_max_lenght(list_of_words)  do
    Enum.max_by(list_of_words, &String.length/1)
    |> String.length
  end
end
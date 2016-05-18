defmodule MyString do
  def capitalize_sentence(str) when is_binary(str) do
    str
    |> String.split(". ")
    |> Enum.map(&_capitalize_sentence(&1, &1))
    |> Enum.join(". ")
    |> IO.puts
  end

  defp _capitalize_sentence(<<>>, _origin_str, acc), do: []

  defp _capitalize_sentence(<< head::utf8, tail::binary >>, origin_str)
  when head in 32..90 do
    if String.starts_with?( origin_str, to_string([head]) ) || head == 32 do
      [ head | _capitalize_sentence(tail, origin_str) ]
    else
      [head + 32 | _capitalize_sentence(tail, origin_str)]
    end
  end

  defp _capitalize_sentence(str = << head::utf8, tail::binary >>, origin_str)
  when head in 97..122 do
    if String.starts_with?( origin_str, to_string([head]) ) do
      [head - 32 | _capitalize_sentence(tail, origin_str)]
    else
      [head | _capitalize_sentence(tail, origin_str)]
    end
  end
end
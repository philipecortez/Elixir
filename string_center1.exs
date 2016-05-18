defmodule MyString do
  def center(list_of_words) do
    max_length = Enum.max_by(list_of_words, &String.length/1)
                 |> String.length

    list_of_words
    |> Enum.map(&center_one_string(&1, max_length))
    |> Enum.each(&IO.puts/1)
  end

  defp center_one_string(string, max_length) do
    String.duplicate(" ", div(max_length - String.length(string), 2)) <> string
  end
end
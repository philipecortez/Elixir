defmodule MyList do

  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  def each([], _), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _), do: []
  def filter([head | tail], func) do
    if  func.(head),
    do: [head | filter(tail, func)],
    else: filter(tail, func)
  end

  def take([head | tail], count, acc \\ 0) when acc < count, do: [ head | take(tail, count, acc + 1)]
  def take(_, _, _), do: []

  def split(list, count) do
    {take(list, count), list -- take(list, count)}
  end


  def flatten(list, acc \\ []), do: _flatten(list, acc)

  defp _flatten([], acc), do: :lists.reverse(acc)
  defp _flatten([head | tail], acc) when is_list(head), do: _flatten(tail, _flatten(head, acc))
  defp _flatten([head | tail], acc), do: _flatten(tail, [head | acc])

end


Stream.resource(fn -> File.open!("sample") end,
    fn file ->
      case IO.read(file, :line) do
        data when is_binary(data) -> {[data], file}
        _ -> {:halt, file}
      end
    end,
    fn file -> File.close(file) end
)
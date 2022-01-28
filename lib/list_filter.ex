defmodule ListFilter do
  def call(list), do: inp(list)

  defp inp([]), do: 0

  defp inp(list) do
    listf =
      Enum.flat_map(list, fn string ->
        case Integer.parse(string) do
          # transform to integer
          {int, _rest} -> [int]
          # skip the value
          :error -> []
        end
      end)

    Enum.count(listf, fn x -> rem(x, 2) == 1 end)
  end
end

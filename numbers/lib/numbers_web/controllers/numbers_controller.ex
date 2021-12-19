defmodule NumbersWeb.NumbersController do
  use NumbersWeb, :controller

    def qsort([]), do: []
    def qsort([pivot|[]]), do: [pivot]
    def qsort([pivot|tail]) do
      lower = Enum.filter(tail, fn(n) -> n < pivot  end)
      higher = Enum.filter(tail, fn(n) -> n > pivot  end)

    qsort(lower) ++  [pivot] ++ qsort(higher)
    end

    def index(conn, params) do

      case HTTPoison.get("http://challenge.dienekes.com.br/api/numbers?page=1") do
        {:ok, %{status_code: 200, body: body}} ->
          listaNumeros = Poison.decode!(body)["numbers"]
          listaNumerosOrdenados = qsort(listaNumeros)
          render(conn, "index.json", numbers: listaNumerosOrdenados)
        end

    end
end

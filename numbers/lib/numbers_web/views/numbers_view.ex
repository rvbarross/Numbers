defmodule NumbersWeb.NumbersView do
  use NumbersWeb, :view

  def render("index.json", %{numbers: numbers}) do
    %{data: render_one(numbers, __MODULE__, "numbers.json")}
  end

  def render("numbers.json", %{numbers: numbers}) do
    %{numbers: numbers}
  end
end

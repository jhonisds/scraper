defmodule Scraper.Review do
  @moduledoc """
  This module defines the `review` sctructure.
  """

  defstruct [:author, :rating, :title, :content]

  def create(attr) do
    %__MODULE__{
      author: attr[:author],
      rating: attr[:rating],
      title: attr[:title],
      content: attr[:content]
    }
  end
end

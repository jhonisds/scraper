defmodule Scraper.Output do
  @moduledoc """
  This module display result.
  """

  alias Mix.Shell.IO, as: Shell
  alias Scraper

  def display(entries) do
    Shell.cmd("clear")
    Shell.info("\n")
    Shell.info("Top three worst offenders for a McKaig Chevrolet Buick")
    Shell.info("\n")

    entries
    |> Enum.with_index(fn review, index ->
      Shell.info("#{index + 1} - [#{review.rating}]  #{review.title} -- by #{review.author}")
      Shell.info("")
      Shell.info(review.content)
      Shell.info("\n")
    end)
  end
end

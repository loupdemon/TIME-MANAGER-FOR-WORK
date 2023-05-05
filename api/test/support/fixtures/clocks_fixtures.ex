defmodule Api.ClocksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Clocks` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2021-10-24 14:44:00]
      })
      |> Api.Clocks.create_clock()

    clock
  end
end

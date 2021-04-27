defmodule Bitty.Schemas.ClickTest do
  use Bitty.DataCase

  alias Bitty.Schemas.Click

  describe "changeset/1" do
    test "returns errors when an associated url is missing" do
      assert %{url_id: ["can't be blank"]} =
               %{ip_address: "127.0.0.1", user_agent: "test-user-agent"}
               |> Click.changeset()
               |> errors_on()
    end
  end
end

defmodule Tiny.Schemas.UrlTest do
  use Tiny.DataCase

  alias Tiny.Schemas.Url

  describe "changeset/1" do
    test "returns a valid changeset with a unique slug" do
      assert %{valid?: true, changes: %{slug: slug}} =
               Url.changeset(%{url: "https://example.com/iamareallylongpathipromise"})

      refute is_nil(slug)
    end

    test "returns errors when url is invalid" do
      assert %{url: ["has invalid format"]} =
               %{url: "wss://example.com/iamawebsocketdidyouknow"}
               |> Url.changeset()
               |> errors_on()
    end
  end
end

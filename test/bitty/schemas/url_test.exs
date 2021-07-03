defmodule Bitty.Schemas.UrlTest do
  use Bitty.DataCase

  alias Bitty.Schemas.Url

  describe "changeset/1" do
    test "returns a valid changeset with a unique slug" do
      assert %{valid?: true, changes: %{slug: slug}} =
               Url.changeset(%{url: "https://example.com/iamareallylongpathipromise"})

      refute is_nil(slug)
    end

    test "returns errors when url is invalid" do
      assert %{url: ["Only HTTP/HTTPS URLs are supported at this time."]} =
               %{url: "wss://example.com/iamawebsocketdidyouknow"}
               |> Url.changeset()
               |> errors_on()
    end
  end
end

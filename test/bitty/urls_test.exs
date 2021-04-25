defmodule Bitty.UrlsTest do
  use Bitty.DataCase

  import Bitty.Factory

  alias Bitty.Urls
  alias Bitty.Schemas.Url

  describe "create/1" do
    test "returns a new record with slug for valid url" do
      assert {:ok, %Url{slug: slug}} = Urls.create(%{"url" => "https://example.com/verylongpath"})
    end

    test "returns errors when url is invalid" do
      {:error, changeset} = Urls.create(%{"url" => "wss://example.com/iamawebsocketdidyouknow"})

      assert %{url: ["has invalid format"]} = errors_on(changeset)
    end
  end

  describe "get/1" do
    setup do
      url = insert(:url, slug: "abc123")
      {:ok, url: url}
    end

    test "returns a URL for a given slug", %{url: %{id: url_id}} do
      assert %{id: ^url_id} = Urls.get("abc123")
    end

    test "returns nil for unknown slugs" do
      assert is_nil(Urls.get("https://example.com/doesnotexist"))
    end
  end
end

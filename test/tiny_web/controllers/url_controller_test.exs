defmodule TinyWeb.UrlControllerTest do
  use TinyWeb.ConnCase

  import Tiny.Factory

  describe "create/2" do
    test "returns a JSON representation of our stored URL", %{conn: conn} do
      url = "https://example.com/iamareallylongpathipromise"
      conn = post(conn, "/api/urls", %{"url" => url})

      assert %{"slug" => slug, "url" => ^url} = json_response(conn, 201)
      refute is_nil(slug)
    end

    test "returns a 400 and error message for invalid urls", %{conn: conn} do
      conn = post(conn, "/api/urls", %{"url" => "wss://example.com/iamawebsocketdidyouknow"})
      assert %{"errors" => %{"detail" => "url has invalid format"}} = json_response(conn, 400)
    end
  end

  describe "show/2" do
    test "returns json for the stored url", %{conn: conn} do
      %{slug: slug, url: url} = insert(:url)
      conn = get(conn, "/api/urls/#{slug}")
      assert %{"slug" => ^slug, "url" => ^url} = json_response(conn, 200)
    end

    test "returns a 404 and error message for missing slugs", %{conn: conn} do
      conn = get(conn, "/api/urls/idonotexist")

      assert %{"errors" => %{"detail" => "this is not the url you're looking for."}} =
               json_response(conn, 404)
    end
  end
end

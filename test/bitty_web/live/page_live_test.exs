defmodule BittyWeb.PageLiveTest do
  use BittyWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Short URLs. Big Results."
    assert render(page_live) =~ "Short URLs. Big Results."
  end
end

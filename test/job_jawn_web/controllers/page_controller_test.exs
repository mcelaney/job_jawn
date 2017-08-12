defmodule JobJawnWeb.PageControllerTest do
  use JobJawnWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "JobJawn"
  end
end

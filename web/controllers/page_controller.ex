defmodule Chs.PageController do
  use Chs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def splash(conn, _params) do
    conn
       |> put_flash(:info, "Welcome to Phoenix, from flash info!")
       |> put_flash(:error, "Let's pretend we have an error.")
       |> render("splash.html")  
  end
  

end

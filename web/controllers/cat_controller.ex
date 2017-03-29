defmodule Chs.CatController do
  use Chs.Web, :controller

  def hello(conn, %{"name" => name}) do
   render conn, "hello.html", name: name
  end
  
  def hello(conn, _params) do
   inspect _params
    render conn, "hello.html", %{ name: "world"}
  end
  

end

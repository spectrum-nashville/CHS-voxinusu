defmodule Chs.CatView do
  use Chs.Web, :view
  
  def capitalize( name )  do
    # {:safe,"<h2>This is the capitalize function.</h2>"}
   #    raw("<h4>Now is the time...</h4><hr>")
   raw( String.capitalize(name) )
  end
  
  
  def handler_info(conn) do
    "Request Handled By: #{controller_module conn}.#{action_name conn}"
  end
       
  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
  end
 
end

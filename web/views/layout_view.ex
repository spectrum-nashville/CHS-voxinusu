defmodule Chs.LayoutView do
  use Chs.Web, :view
  
  def page_title do
    Timex.format!(Timex.now("America/Chicago"), "{h12}:{m}:{s} {am}")
  end
  
  def mainmenu(conn) do
   selected = to_string(action_name( conn ))
   actives = 
      case selected do
        "hello" -> %{ :mhome => "", :mphoenix => "", :msplash => "", :mhello => " class=\"active\"" }
        "splash" -> %{ :mhome => "", :mphoenix => "", :msplash => " class=\"active\"", :mhello => "" }
         _ -> %{ :mhome => " class=\"active\"", :mphoenix => "", :msplash => "", :mhello => "" }
      end
   
  { :safe,
   """

      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="#">WebSiteName</a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li#{actives[:mhome]}><a href="/">Home</a></li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Page 1-1</a></li>
                  <li><a href="#">Page 1-2</a></li>
                  <li><a href="#">Page 1-3</a></li>
                </ul>
              </li>
              <li#{actives[:msplash]}><a href="/splash">Splash</a></li>
              <li#{actives[:mhello]}><a href="/cat">Hello</a></li>
              <!-- <li><a href="#">#{selected}:#{action_name( conn )}</a></li> -->
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
          </div>
        </div>
      </nav>

   <!---
        <nav role="navigation" class="navbar navbar-default">
           <div class="container">
             <ul class="nav navbar-nav">
               <li>
                  <a#{actives[:mhome]} class="active" href="/">Home</a>
               </li>
               <li>
                  <a#{actives[:mphoenix]} href="http://www.phoenixframework.org/docs" target="_blank">Phoenix</a>
               </li>
               <<li>
                  <a#{actives[:msplash]} href="/splash">Splash</a>
               </li>
               <li>
                  <a#{actives[:mhello]} href="/cat">Cat/Hello</a>
               </li>
               <li>
                  <a href="#">#{action_name( conn )}</a>
               </li>
             </ul>
           </div>
        </nav>
    --->
   """
   }
   end
end

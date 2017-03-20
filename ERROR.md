<% if flash.now[:alert] && flash.now[:alert].class == Array %>
<ul>
  <% flash.now[:alert].each do |error| %>
    <li id="alert"><%= error %></li>
  <% end %>
</ul>
<% elsif flash.now[:alert] %>
<p id="alert"><%= flash.now[:alert] %></p>
<% end %>

<% if flash.now[:notice] && flash.now[:notice].class == Array %>
<ul>
<% flash.now[:notice].each do |notice| %>
    <li id="notice"><%= notice%></li>
  <% end %>
</ul>
<% elsif flash.now[:notice] %>
<p id="notice"><%= flash.now[:notice] %></p>
<% end %>

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery

$("[data-form-prepend]").click(function(e) {
    var obj = $($(this).attr("data-form-prepend"));    
    obj.find("input, select, textarea").each(function() {    
        $(this).attr("name", function() {    
        return $(this)    
            .attr("name")    
            .replace("new_record", new Date().getTime());    
        });    
    });    
    obj.insertBefore(this);    
    return false;    
});
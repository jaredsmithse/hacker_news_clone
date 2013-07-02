$(document).ready(function() {
  $(".poa").on("submit", function(e){
    e.preventDefault();
    var $askingPrice = $(".poa input").map(function(){
      if (isNaN(this.value) == false )
      {
        return this.value
      }
    });

    $.ajax({
      type: "POST",
      url: "/poa",
      data: { "asking_price": $askingPrice[0], "sales_price": $askingPrice[1] },
      success: function (data) {
       $(".poa").append("<ul>"+data+"</ul>");
      }
    });
  });
  
  $(".poa").on("click", "button", function(){
      $(this).parent().remove();
  });

  $(".psf").on("submit", function(e){
    e.preventDefault();
    var $pricePerSquareFoot = $(".psf input").map(function(){
      if ( isNaN(this.value) == false )
      {
        return this.value
      }
    });

    $.ajax({
      type: "POST",
      url: "/psf",
      data: { "price": $pricePerSquareFoot[0], "square_feet": $pricePerSquareFoot[1] },
      success: function (data) {
        $(".psf").append("<ul>"+data+"</ul>");
      }
    });
  });

  $(".psf").on("click", "button", function(){
    $(this).parent().remove();
  });
});

window.onload = (->
  addWidths = ->
    total_width = 0
    $(".offer-image").each ->
      width = $(this).width()
      $(this).parent().css width: width + "px"
      total_width += width

    $(".offers").css width: total_width + 30 + "px"
    $(".horizontal-wrapper").css width: total_width + 30 + "px"
  $(".offers").hide()
  $.ajax
    url: "/offers/images"
    cache: false
    success: (html) ->
      $(".offers").append html
      $(".offer-image").hide()
      $(".offers").show()
      addWidths()
      elems = $(".offer-image")
      i = 0
      (fadePlz = ->
        $(elems[i++]).fadeIn 750 - (i * 20), fadePlz
      )()

  $(window).resize ->
    addWidths()
)


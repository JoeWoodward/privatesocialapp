window.onload = (->
  if $('body').hasClass("offers")
    addWidths = ->
      total_width = 0
      $(".offer-image").each ->
        $(this).imagesLoaded(width = $(this).width())
        $(this).parent().css width: width + "px"
        total_width += width

      $(".offers-list").css width: total_width + 30 + "px"
      $(".horizontal-wrapper").css width: total_width + 30 + "px"
    $(".offers-list").hide()
    $.ajax
      url: "offers/images"
      cache: false
      success: (html) ->
        $(".offers-list").append html
        $(".offer-image").hide()
        $(".offers-list").show()
        addWidths()
        elems = $(".offer-image")
        i = 0
        (fadePlz = ->
          $(elems[i++]).fadeIn 750 - (i * 20), fadePlz
        )()

    $(window).resize ->
      addWidths()
)


window.onload = (->
  if $('body').hasClass("offers")
    addSizes = ->
      $('.offers-list li img').height($('body').height() - 30)
      total_width = 0
      $(".offer-image").each ->
        height = $(this).height()
        ratio = height * 0.6923076923
        $(this).width(ratio)
        width = $(this).width()
        $(this).parent().css width: width + "px"
        total_width += width

      $(".offers-list").css width: total_width + "px"
      $(".horizontal-wrapper").css width: total_width + "px"
    $(".offers-list").hide()
    $.ajax
      url: "offers/images"
      cache: false
      success: (html) ->
        $(".offers-list").append html
        $(".offer-image").hide()
        $(".offers-list").show()
        addSizes()
        elems = $(".offer-image")
        i = 0
        (fadePlz = ->
          $(elems[i++]).fadeIn 750 - (i * 20), fadePlz
        )()

    $(window).resize ->
      addSizes()
)


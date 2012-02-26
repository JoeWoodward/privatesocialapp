module WhichCssClassToUse

  def css_classes_please
    #override this variable inside controllers or actions
    #change @orientation to 'horizontal' .. obviously!

    #css defitions exist for .horizontal-wrapper and 
    #.vertical-wrapper

    # set default layout to vertical
    # @orientation is used in the layout..
    # HAML: %div{class: "#{@orientation}-wrapper"}
    @orientation = 'vertical'

    # override default wrapper styles for different
    # pages.
    @section_style = ''

    # .main-content has a default width (for providing
    # consistent paragraph widths), instead of creating
    # multiple layouts I'd rather just dynamically add
    # an overriding css def to the content holder div
    # if I need to change it's size.
    @content_holder = ''
  end

end

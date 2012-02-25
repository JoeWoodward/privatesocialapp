module WhichCssClassToUse

  #override this variable inside controllers or actions
  #change @orientation to 'horizontal' .. obviously!

  #css defitions exist for .horizontal-wrapper and 
  #.vertical-wrapper
  def orientation

    # set default layout to vertical
    # @orientation is used in the layout..
    # HAML: %div{class: "#{@orientation}-wrapper"}
    @orientation = 'vertical'
  end

  def section_style
    @section_style = ''
  end
end

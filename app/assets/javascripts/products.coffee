$(document).ready ->
  options = []
  $('.dropdown-menu a').on 'click', (event) ->
    $target = $(event.currentTarget)
    val = $target.attr('data-value')
    $inp = $target.find('input')
    idx = undefined
    if (idx = options.indexOf(val)) > -1
      options.splice idx, 1
      setTimeout (->
        $inp.prop 'checked', false
        return
      ), 0
    else
      options.push val
      setTimeout (->
        $inp.prop 'checked', true
        return
      ), 0
    $(event.target).blur()
    console.log options
    false
  return
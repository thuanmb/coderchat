$(document).ready ->
  # Configure infinite table
  $('.message-container').infinitePages
    context: '.content.container'
    loading: ->
      $(this).text('Loading next page...')
    error: ->
      $(this).button('There was an error, please try again')
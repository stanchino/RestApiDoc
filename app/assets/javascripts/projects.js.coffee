$ ->
  host = window.document.location.host
  dispatcher = new WebSocketRails("#{host}/websocket")
  channel = dispatcher.subscribe("requests")
  channel.bind "call", (info) ->
    jqXHR = $.ajax
      url: info.uri
      method: info.action
      dataType: "json"
    jqXHR.always () ->
      if arguments[1] == "success"
        response = arguments[2]
      else
        response = arguments[0]
      dispatcher.trigger "requests.add_response",
        request_id: info.id
        status: "#{response.status} #{response.statusText}"
        headers: response.getAllResponseHeaders()
        responseText: response.responseText
        responseJSON: response.responseJSON || {}
  channel.bind "update", (info) ->
    console.log info
  $('[data-action="run-request"]').on 'click', (event) ->
    event.preventDefault()
    $target = $(event.currentTarget)
    if $target.data?('request-id')
      request_id = $target.data('request-id')
      dispatcher.trigger "requests.start", {id: request_id}

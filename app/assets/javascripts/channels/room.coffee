jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0
    App.room = App.cable.subscriptions.create {
      channel: "RoomChannel"
      room_id: messages.data('room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        $('#messages').append data['message']

      speak: (message, room_id) ->
        @perform 'speak',  message: message, room_id: room_id

    $(document).on 'keypress', '[data-behavior~=room_speaker]', (event, room_id) ->
      if event.keyCode is 13 # return/enter = send 
        App.room.speak event.target.value, messages.data('room-id')
        
        event.target.value = '' 
        event.preventDefault()

      # $('new_message').submit(e) ->
      #   $this = $(this) 
      #   textarea = $this.find('message_content')
      #   if $.trim(textarea.val()).length > 1 
      #     App.room.speak textarea.val(), messages.data('room-id')
      #     textarea.val = ''
      #   e.preventDefault()
      #   return false


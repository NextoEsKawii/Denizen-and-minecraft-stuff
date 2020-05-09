chat_pings_world:
    type: world
    events:
        on player chats:
        - if <context.message.contains_any[<server.list_online_players.parse[name]>]>:
            - if <context.message.contains_any[<player.name>]>:
                - stop
            - foreach <server.list_online_players> as:player:
                - if <context.message.contains[<[player].name>]>:
                    - narrate targets:<[player]> "<&e><player.name><&b> mentioned you!"
                    - playsound <[player]> sound:block_note_block_bell
                    - flag server pingSender:<player.uuid>
                    - toast targets:<[player]> "<&e><player.name><&b> mentioned you!" frame:goal icon:PingHead

pingHead:
  type: item
  material: player_head[skull_skin=<server.flag[pingSender]>]
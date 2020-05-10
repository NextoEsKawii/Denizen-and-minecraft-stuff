Original script by mcmonkey

(
# +--------------------
# |
# | C h a t   P i n g s
# |
# | Alerts when somebody says your name!
# |
# +----------------------
#
# @author mcmonkey
# @date 2019/03/01
# @denizen-build DEV-670
# @script-version 2.0
#
# Installation:
# Just put the script in your scripts folder and reload.
#
# Usage:
# Just say someone's name, everything is automatic.
#
# ---------------------------- END HEADER ----------------------------
)
link to original script: https://one.denizenscript.com/haste/52936
i just added a few changes

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

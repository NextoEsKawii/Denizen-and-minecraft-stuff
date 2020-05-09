KDA:
    type: world
    debug: false
    events:
        on player death:
        - wait 1t
        - adjust <player> respawn
        on player kills player:
        - flag <context.entity> nt_deaths:+
        - flag <context.damager> nt_kills:+
        - flag <context.damager> nt_kdr:<context.damager.flag[nt_kills].div[<context.damager.flag[nt_deaths]||1>].round_to[2]||0>
        - flag <context.entity> nt_kdr:<context.entity.flag[nt_kills].div[<context.entity.flag[nt_deaths]||1>].round_to[2]||0>

        - if <server.flag[nt_board].get_sub_items[1].contains_any[<context.damager.uuid>]>:
            - flag server nt_board[<server.flag[nt_board].get_sub_items[1].find[<context.damager.uuid>]>]:<context.damager.uuid>/<context.damager.flag[nt_kdr]>/<context.damager.flag[nt_kills]>/<context.damager.flag[nt_deaths]>
        - else:
            - flag server nt_board:->:<context.damager.uuid>/<context.damager.flag[nt_kdr]>/<context.damager.flag[nt_kills]>/<context.damager.flag[nt_deaths]>
            
        - if <server.flag[nt_board].get_sub_items[1].contains_any[<context.entity.uuid>]>:
            - flag server nt_board[<server.flag[nt_board].get_sub_items[1].find[<context.entity.uuid>]>]:<context.entity.uuid>/<context.entity.flag[nt_kdr]>/<context.entity.flag[nt_kills]>/<context.entity.flag[nt_deaths]>
        - else:
            - flag server nt_board:->:<context.entity.uuid>/<context.entity.flag[nt_kdr]>/<context.entity.flag[nt_kills]>/<context.entity.flag[nt_deaths]>

        on kd command:
        - inject NT_Base_Inv
        on player clicks barrier in KDAINV:
        - inject NT_Base_Inv
        on player clicks in KDAINV:
        - determine passively cancelled
        on player clicks arrow in KDAINV:
        - inject NT_Next
        on player clicks compass in KDAINV:
        - if <server.flag[nt_vcopy].size> > 27:
            - inventory set d:<player.open_inventory> slot:9 "o:arrow[display_name=<&e>Next page;lore=<&7>Current<&co> 1]"
        - repeat 27:
            - inventory set d:<player.open_inventory> slot:<[value].add[18]> o:air
        #- repeat <server.flag[nt_board].size>:
        - choose <context.item.nbt[status]>:
            - case ratio:
                - flag server nt_vcopy:!|:<server.flag[nt_board]>
                - repeat <server.flag[nt_vcopy].size>:
                    - define top <server.flag[nt_vcopy].get_sub_items[3].highest>
                    - define pos <server.flag[nt_vcopy].get_sub_items[3].find[<server.flag[nt_vcopy].get_sub_items[3].highest>]>
                    - define uuid <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>]>
                    - define name <&e><server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.name>
                    - define lore "<&7>Ratio<&co> <server.flag[nt_vcopy].get_sub_items[2].get[<[pos]>]>|<&a>Kills<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_kills]>|<&7>Deaths<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_deaths]>"
                    - define plore "<&7>Ratio<&co> <player.flag[nt_kdr]>|<&7>Kills<&co> <player.flag[nt_kills]>|<&7>Deaths<&co> <player.flag[nt_deaths]>"
                    - inventory add d:<player.open_inventory> o:player_head[skull_skin=<[uuid]>;display_name=<[name]>;lore=<[lore]>]
                    - inventory set d:<player.open_inventory> slot:5 o:player_head[skull_skin=<player.uuid>;display_name=<&e><player.name>;lore=<[plore]>]
                    - inventory set d:<player.open_inventory> slot:4 "o:compass[display_name=<&e>Sorting method;lore=<&7>Ratio|<&7>⋙ <&a>Kills|<&7>Deaths;nbt=status/kills]"
                    - flag server nt_vcopy:<-:<server.flag[nt_vcopy].get[<[pos]>]>
            - case kills:
                - flag server nt_vcopy:!|:<server.flag[nt_board]>
                - repeat <server.flag[nt_vcopy].size>:
                    - define top <server.flag[nt_vcopy].get_sub_items[4].highest>
                    - define pos <server.flag[nt_vcopy].get_sub_items[4].find[<server.flag[nt_vcopy].get_sub_items[4].highest>]>
                    - define uuid <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>]>
                    - define name <&e><server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.name>
                    - define lore "<&7>Ratio<&co> <server.flag[nt_vcopy].get_sub_items[2].get[<[pos]>]>|<&7>Kills<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_kills]>|<&a>Deaths<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_deaths]>"
                    - define plore "<&7>Ratio<&co> <player.flag[nt_kdr]>|<&7>Kills<&co> <player.flag[nt_kills]>|<&7>Deaths<&co> <player.flag[nt_deaths]>"
                    - inventory add d:<player.open_inventory> o:player_head[skull_skin=<[uuid]>;display_name=<[name]>;lore=<[lore]>]
                    - inventory set d:<player.open_inventory> slot:5 o:player_head[skull_skin=<player.uuid>;display_name=<&e><player.name>;lore=<[plore]>]
                    - inventory set d:<player.open_inventory> slot:4 "o:compass[display_name=<&e>Sorting method;lore=<&7>Ratio|<&7>Kills|<&7>⋙ <&a>Deaths;nbt=status/deaths]"
                    - flag server nt_vcopy:<-:<server.flag[nt_vcopy].get[<[pos]>]>
            - case deaths:
                - flag server nt_vcopy:!|:<server.flag[nt_board]>
                - repeat <server.flag[nt_vcopy].size>:
                    - define top <server.flag[nt_vcopy].get_sub_items[2].highest>
                    - define pos <server.flag[nt_vcopy].get_sub_items[2].find[<server.flag[nt_vcopy].get_sub_items[2].highest>]>
                    - define uuid <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>]>
                    - define name <&e><server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.name>
                    - define lore "<&a>Ratio<&co> <server.flag[nt_vcopy].get_sub_items[2].get[<[pos]>]>|<&7>Kills<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_kills]>|<&7>Deaths<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_deaths]>"
                    - define plore "<&7>Ratio<&co> <player.flag[nt_kdr]>|<&7>Kills<&co> <player.flag[nt_kills]>|<&7>Deaths<&co> <player.flag[nt_deaths]>"
                    - inventory add d:<player.open_inventory> o:player_head[skull_skin=<[uuid]>;display_name=<[name]>;lore=<[lore]>]
                    - inventory set d:<player.open_inventory> slot:5 o:player_head[skull_skin=<player.uuid>;display_name=<&e><player.name>;lore=<[plore]>]
                    - inventory set d:<player.open_inventory> slot:4 "o:compass[display_name=<&e>Sorting method;lore=<&7>⋙ <&a>Ratio|<&7>Kills|<&7>Deaths;nbt=status/ratio]"
                    - flag server nt_vcopy:<-:<server.flag[nt_vcopy].get[<[pos]>]>
        on player clicks birch_sign in KDAINV:
        - flag player nt_edit:!|:<location[<player.location.x>,0,<player.location.z>,<player.world>].block.material>/<location[<player.location.x>,0,<player.location.z>,<player.world>]>
        - sign type:sign_post "" <location[<player.location.x>,0,<player.location.z>,<player.world>]>
        - wait 1t
        - adjust <player> edit_sign:<location[<player.location.x>,0,<player.location.z>,<player.world>]>
        on player changes birch_sign flagged:nt_edit:
        - modifyblock <player.flag[nt_edit].get_sub_items[2]> <player.flag[nt_edit].get_sub_items[1]>
        - define found 0
        - foreach <server.list_players> as:p:
            - if <context.new.get[1].contains[<[p].name>]>:
                - define found 1
        - if <[found]> == 1:
            - inventory open d:KDAINV
            - repeat 27:
                - inventory set d:<player.open_inventory> slot:<[value].add[18]> o:white_stained_glass_pane
            - define p <context.new.get[1].as_player>
            - define lore "<&7>Ratio<&co> <[p].flag[nt_kdr]>|<&7>Kills<&co> <[p].flag[nt_kills]>|<&7>Deaths<&co> <[p].flag[nt_deaths]>"
            - inventory set d:<player.open_inventory> slot:32 o:player_head[skull_skin=<[p].uuid>;display_name=<&e><[p].name>;lore=<[lore]>]
            - define plore "<&7>Ratio<&co> <player.flag[nt_kdr]>|<&7>Kills<&co> <player.flag[nt_kills]>|<&7>Deaths<&co> <player.flag[nt_deaths]>"
            - inventory set d:<player.open_inventory> slot:5 o:player_head[skull_skin=<player.uuid>;display_name=<&e><player.name>;lore=<[plore]>]
            - inventory set d:<player.open_inventory> slot:9 o:black_stained_glass_pane
        - else:
            - narrate "<&c>We could not find any player by that name!"


KDAINV:
  type: inventory
  inventory: CHEST
  title: KDA Tracker
  debug: false
  size: 45
  definitions:
    1: air
    2: birch_sign[display_name=<&e>Search by name]
    3: compass[display_name=<&e>Sorting method;lore=<&7>⋙ <&a>Ratio|<&7>Kills|<&7>Deaths;nbt=status/ratio]
    4: player_head
    5: black_stained_glass_pane
  slots:
    - [5] [5] [5] [3] [4] [2] [5] [5] [5]
    - [5] [5] [5] [5] [5] [5] [5] [5] [5]
    - [1] [1] [1] [1] [1] [1] [1] [1] [1]
    - [1] [1] [1] [1] [1] [1] [1] [1] [1]
    - [1] [1] [1] [1] [1] [1] [1] [1] [1]


NT_Base_Inv:
    type: task
    script:
    - inventory open d:KDAINV
    - flag server nt_vcopy:!|:<server.flag[nt_board]>
    - flag server nt_vcopy:|:<server.flag[nt_vcopy]>
    - flag server nt_vcopy:|:<server.flag[nt_vcopy]>
    - flag server nt_vcopy:|:<server.flag[nt_vcopy]>
    - flag server nt_vcopy:|:<server.flag[nt_vcopy]>
    - if <server.flag[nt_vcopy].size> > 27:
        - inventory set d:<player.open_inventory> slot:9 "o:arrow[display_name=<&e>Next page;lore=<&7>Current<&co> 1]"
    - repeat <server.flag[nt_vcopy].size>:
        - define top <server.flag[nt_vcopy].get_sub_items[2].highest>
        - define pos <server.flag[nt_vcopy].get_sub_items[2].find[<server.flag[nt_vcopy].get_sub_items[2].highest>]>
        - define uuid <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>]>
        - define name <&e><server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.name>
        - define lore "<&a>Ratio<&co> <server.flag[nt_vcopy].get_sub_items[2].get[<[pos]>]>|<&7>Kills<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_kills]>|<&7>Deaths<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_deaths]>"
        - define plore "<&7>Ratio<&co> <player.flag[nt_kdr]>|<&7>Kills<&co> <player.flag[nt_kills]>|<&7>Deaths<&co> <player.flag[nt_deaths]>"
        - inventory add d:<player.open_inventory> o:player_head[skull_skin=<[uuid]>;display_name=<[name]>;lore=<[lore]>;nbt=id/<util.random.uuid>]
        - inventory set d:<player.open_inventory> slot:5 o:player_head[skull_skin=<player.uuid>;display_name=<&e><player.name>;lore=<[plore]>]
        - flag server nt_vcopy:<-:<server.flag[nt_vcopy].get[<[pos]>]>
NT_Next:
    type: task
    script:
    - flag server nt_vcopy:!|:<server.flag[nt_board]>
    - flag server nt_vcopy:|:<server.flag[nt_vcopy]>
    - flag server nt_vcopy:|:<server.flag[nt_vcopy]>
    - flag server nt_vcopy:|:<server.flag[nt_vcopy]>
    - flag server nt_vcopy:|:<server.flag[nt_vcopy]>
    - flag server nt_vcopy:|:<server.flag[nt_vcopy]>


    - repeat "<element[27].mul[<player.open_inventory.slot[9].lore.after[ ]>]>":
        - flag server nt_vcopy:<-:<server.flag[nt_vcopy].get[1]>

    - inventory set d:<player.open_inventory> slot:9 "o:arrow[display_name=<&e>Next page;lore=<&7>Current<&co> <player.open_inventory.slot[9].lore.after[ ].add[1]>]"

    - if <server.flag[nt_vcopy].size> > 27:
        - define fsize 27
    - else:
        - define fsize <server.flag[nt_vcopy].size>
        

    - repeat 27:
        - inventory set d:<player.open_inventory> slot:<[value].add[18]> o:air

    - repeat <[fsize]>:
        - define top <server.flag[nt_vcopy].get_sub_items[2].highest>
        - define pos <server.flag[nt_vcopy].get_sub_items[2].find[<server.flag[nt_vcopy].get_sub_items[2].highest>]>
        - define uuid <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>]>
        - define name <&e><server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.name>
        - define lore "<&a>Ratio<&co> <server.flag[nt_vcopy].get_sub_items[2].get[<[pos]>]>|<&7>Kills<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_kills]>|<&7>Deaths<&co> <server.flag[nt_vcopy].get_sub_items[1].get[<[pos]>].as_player.flag[nt_deaths]>"
        - define plore "<&7>Ratio<&co> <player.flag[nt_kdr]>|<&7>Kills<&co> <player.flag[nt_kills]>|<&7>Deaths<&co> <player.flag[nt_deaths]>"
        - inventory add d:<player.open_inventory> o:player_head[skull_skin=<[uuid]>;display_name=<[name]>;lore=<[lore]>;nbt=id/<util.random.uuid>]
        - inventory set d:<player.open_inventory> slot:5 o:player_head[skull_skin=<player.uuid>;display_name=<&e><player.name>;lore=<[plore]>]
        - flag server nt_vcopy:<-:<server.flag[nt_vcopy].get[<[pos]>]>

    - if <server.flag[nt_board].size.add[10]> > <server.flag[nt_vcopy].size>:
        - inventory set d:<player.open_inventory> slot:1 "o:barrier[display_name=<&e>Back to start]"
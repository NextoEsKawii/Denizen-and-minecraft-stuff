Elytra_Physics:
    type: world
    events:
        on player damaged by FLY_INTO_WALL:
        - if <player.location.forward.material.name.contains_any_text[glass]>:
            - foreach <cuboid[<player.location.forward.center.relative[1,1,1]>|<player.location.forward.center.relative[-1,-1,-1]>].blocks> as:block:
                - if <[block].material.name.contains_any_text[glass]>:
                    - modifyblock <[block]> air
            - foreach <cuboid[<player.location.forward.center.relative[2,2,2]>|<player.location.forward.center.relative[-2,-2,-2]>].shell> as:block:
                - if <[block].material.name.contains_any_text[glass]> && <util.random.int[1].to[2]> == 2:
                    - modifyblock <[block]> air
            - foreach <cuboid[<player.location.forward.center.relative[3,3,3]>|<player.location.forward.center.relative[-3,-3,-3]>].shell> as:block:
                - if <[block].material.name.contains_any_text[glass]> && <util.random.int[1].to[5]> == 5:
                    - modifyblock <[block]> air
            - playeffect effect:blockcrack_glass at:<cuboid[<player.location.forward.center.relative[1,1,1]>|<player.location.forward.center.relative[-1,-1,-1]>]> quantity:200
            - playsound <player> sound:block_glass_break
            - determine cancelled
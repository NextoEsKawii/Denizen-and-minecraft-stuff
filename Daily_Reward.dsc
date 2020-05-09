DReward:
    type: world
    events:
        on player login:
        - wait 1s
        - if <player.has_flag[day]>:
            - if <player.flag[day]> != <util.date.time.day>:
                - flag player day:<util.date.time.day>
                - inject MissionReset

        - flag player dr_1:<util.random.int[1].to[3]>
        - flag player dr_2:<util.random.int[1].to[3]>
        - flag player dr_3:<util.random.int[1].to[2]>
        - flag player dr_4:<util.random.int[1].to[2]>

        - if <player.flag[dr_1]> == 1:
            - flag player dr_1_start:<player.statistic[MOB_KILLS]>
        - else if <player.flag[dr_1]> == 2:
            - flag player dr_1_start:<player.statistic[DAMAGE_BLOCKED_BY_SHIELD]>
        - else if <player.flag[dr_1]> == 3:
            - flag player dr_1_start:<player.statistic[DAMAGE_DEALT]>

        - if <player.flag[dr_2]> == 1:
            - flag player dr_2_start:<player.statistic[WALK_ONE_CM]>
        - else if <player.flag[dr_2]> == 2:
            - flag player dr_2_start:<player.statistic[JUMP]>
        - else if <player.flag[dr_2]> == 3:
            - flag player dr_2_start:<player.statistic[AVIATE_ONE_CM]>

        - if <player.flag[dr_3]> == 1:
            - flag player dr_3_start:<player.statistic[PLAY_ONE_MINUTE]>
        - else if <player.flag[dr_3]> == 2:
            - flag player dr_3_start:<player.statistic[TRADED_WITH_VILLAGER]>

        - if <player.flag[dr_4]> == 1:
            - flag player dr_4_start:<player.statistic[TIME_SINCE_DEATH]>
        - else if <player.flag[dr_4]> == 2:
            - flag player dr_4_start:<player.statistic[CAKE_SLICES_EATEN]>








































        on dreward command:
        - inventory open d:DReward_Inv
        - define inv <player.open_inventory>
        - if <player.flag[dr_1]> == 1:
            - define dr_1_new <player.statistic[MOB_KILLS]>
            - define dr_1_result <[dr_1_new].sub[<player.flag[dr_1_start]>].round>
        - else if <player.flag[dr_1]> == 2:
            - define dr_1_new <player.statistic[DAMAGE_BLOCKED_BY_SHIELD]>
            - define dr_1_result <[dr_1_new].sub[<player.flag[dr_1_start]>].div[25].round>
        - else if <player.flag[dr_1]> == 3:
            - define dr_1_new <player.statistic[DAMAGE_DEALT]>
            - define dr_1_result <[dr_1_new].sub[<player.flag[dr_1_start]>].round>

        - if <player.flag[dr_2]> == 1:
            - define dr_2_new <player.statistic[WALK_ONE_CM]>
            - define dr_2_result <[dr_2_new].sub[<player.flag[dr_2_start]>].div[100].round>
        - else if <player.flag[dr_2]> == 2:
            - define dr_2_new <player.statistic[JUMP]>
            - define dr_2_result <[dr_2_new].sub[<player.flag[dr_2_start]>].round>
        - else if <player.flag[dr_2]> == 3:
            - define dr_2_new <player.statistic[AVIATE_ONE_CM]>
            - define dr_2_result <[dr_2_new].sub[<player.flag[dr_2_start]>].div[100].round>

        - if <player.flag[dr_3]> == 1:
            - define dr_3_new <player.statistic[PLAY_ONE_MINUTE]>
            - define dr_3_result <[dr_3_new].sub[<player.flag[dr_3_start]>].div[20].div[60].round>
        - else if <player.flag[dr_3]> == 2:
            - define dr_3_new <player.statistic[FISH_CAUGHT]>
            - define dr_3_result <[dr_3_new].sub[<player.flag[dr_3_start]>].round>

        - if <player.flag[dr_4]> == 1:
            - define dr_4_new <player.statistic[TIME_SINCE_DEATH]>
            - define dr_4_result <[dr_4_new].sub[<player.flag[dr_4_start]>].div[20].div[60].round>
        - else if <player.flag[dr_4]> == 2:
            - define dr_4_new <player.statistic[CAKE_SLICES_EATEN]>
            - define dr_4_result <[dr_4_new].sub[<player.flag[dr_4_start]>].round>

        - announce "<&b><player.flag[dr_1]> <player.flag[dr_1_start]> | <[dr_1_new]> || <[dr_1_result]> - "
        - announce "<&b><player.flag[dr_2]> <player.flag[dr_2_start]> | <[dr_2_new]> || <[dr_2_result]> - "
        - announce "<&b><player.flag[dr_3]> <player.flag[dr_3_start]> | <[dr_3_new]> || <[dr_3_result]>"
        - announce "<&b><player.flag[dr_4]> <player.flag[dr_4_start]> | <[dr_4_new]> || <[dr_4_result]>"




        - inventory add d:<[inv]> o:<item[chest]> slot:14
        - inventory adjust d:<[inv]> slot:14 "display_name:<&6>✯ Golden Reward I <&6>✯"

        - inventory add d:<[inv]> o:<item[ender_chest]> slot:23
        - inventory adjust d:<[inv]> slot:23 "display_name:<&6>✯ Golden Reward II ✯"

        - inventory add d:<[inv]> o:end_portal_frame slot:32
        - inventory adjust d:<[inv]> slot:32 "display_name:<&6>✯ Golden Reward III ✯"



        - choose <player.flag[dr_1]>:
            - case 1:
                - inventory add d:<[inv]> o:rotten_flesh slot:11
                - inventory adjust d:<[inv]> slot:11 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - if <[dr_1_result]> >= 10:
                    - inventory adjust d:<[inv]> slot:11 "enchantments:durability,1"
                    - inventory adjust d:<[inv]> slot:11 "lore:<&a>Ready to claim!"
                    - inventory adjust d:<[inv]> slot:11 "flags:HIDE_ALL"
                - else:
                    - inventory adjust d:<[inv]> slot:11 "lore:<&a>Kill <&e><[dr_1_result]>/10<&a> enemies"


                - inventory add d:<[inv]> o:rotten_flesh slot:12
                - inventory adjust d:<[inv]> slot:12 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - if <[dr_2_result]> >= 50:
                    - inventory adjust d:<[inv]> slot:12 "enchantments:durability,1"
                    - inventory adjust d:<[inv]> slot:12 "lore:<&a>Ready to claim!"
                    - inventory adjust d:<[inv]> slot:12 "flags:HIDE_ALL"
                - else:
                    - inventory adjust d:<[inv]> slot:12 "lore:<&a>Kill <&e><[dr_1_result]>/50<&a> enemies"

                
                - inventory add d:<[inv]> o:rotten_flesh slot:13
                - inventory adjust d:<[inv]> slot:13 "display_name:<&e>✯ <&d>Reward III <&e>✯"
                - if <[dr_1_result]> >= 200:
                    - inventory adjust d:<[inv]> slot:11 "enchantments:durability,1"
                    - inventory adjust d:<[inv]> slot:11 "lore:<&a>Ready to claim!"
                    - inventory adjust d:<[inv]> slot:11 "flags:HIDE_ALL"
                - else:
                    - inventory adjust d:<[inv]> slot:13 "lore:<&a>Kill <&e><[dr_1_result]>/200<&a> enemies"


            - case 2:
                - inventory add d:<[inv]> o:shield slot:11
                - inventory adjust d:<[inv]> slot:11 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - if <[dr_2_result]> >= 10:
                    - inventory adjust d:<[inv]> slot:11 "enchantments:durability,1"
                    - inventory adjust d:<[inv]> slot:11 "lore:<&a>Ready to claim!"
                    - inventory adjust d:<[inv]> slot:11 "flags:HIDE_ALL"
                - else:
                    - inventory adjust d:<[inv]> slot:11 "lore:<&a>Deflect <&e><[dr_1_result]>/10<&a> damage"


                - inventory add d:<[inv]> o:shield slot:12
                - inventory adjust d:<[inv]> slot:12 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - inventory adjust d:<[inv]> slot:12 "lore:<&a>Deflect <&e><[dr_1_result]>/25<&a> damage"


                - inventory add d:<[inv]> o:shield slot:13
                - inventory adjust d:<[inv]> slot:13 "display_name:<&e>✯ <&d>Reward III <&e>✯"
                - inventory adjust d:<[inv]> slot:13 "lore:<&a>Deflect <&e><[dr_1_result]>/50<&a> damage"
            - case 3:
                - inventory add d:<[inv]> o:iron_sword slot:11
                - inventory adjust d:<[inv]> slot:11 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - inventory adjust d:<[inv]> slot:11 "lore:<&a>Deal <&e><[dr_1_result]>/25<&a> damage"


                - inventory add d:<[inv]> o:iron_sword slot:12
                - inventory adjust d:<[inv]> slot:12 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - inventory adjust d:<[inv]> slot:12 "lore:<&a>Deal <&e><[dr_1_result]>/75<&a> damage"


                - inventory add d:<[inv]> o:iron_sword slot:13
                - inventory adjust d:<[inv]> slot:13 "display_name:<&e>✯ <&d>Reward III <&e>✯"
                - inventory adjust d:<[inv]> slot:13 "lore:<&a>Deal <&e><[dr_1_result]>/150<&a> damage"

        - choose <player.flag[dr_2]>:
            - case 1:
                - inventory add d:<[inv]> o:compass slot:17
                - inventory adjust d:<[inv]> slot:17 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - inventory adjust d:<[inv]> slot:17 "lore:<&a>Walk <&e><[dr_2_result]>/100<&a> blocks"


                - inventory add d:<[inv]> o:compass slot:16
                - inventory adjust d:<[inv]> slot:16 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - inventory adjust d:<[inv]> slot:16 "lore:<&a>Walk <&e><[dr_2_result]>/500<&a> blocks"


                - inventory add d:<[inv]> o:compass slot:15
                - inventory adjust d:<[inv]> slot:15 "display_name:<&e>✯ <&d>Reward III <&e>✯"
                - inventory adjust d:<[inv]> slot:15 "lore:<&a>Walk <&e><[dr_2_result]>/2000<&a> blocks"


            - case 2:
                - inventory add d:<[inv]> o:iron_boots slot:17
                - inventory adjust d:<[inv]> slot:17 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - inventory adjust d:<[inv]> slot:17 "lore:<&a>Jump <&e><[dr_2_result]>/10<&a> times"


                - inventory add d:<[inv]> o:iron_boots slot:16
                - inventory adjust d:<[inv]> slot:16 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - inventory adjust d:<[inv]> slot:16 "lore:<&a>Jump <&e><[dr_2_result]>/25<&a> times"


                - inventory add d:<[inv]> o:iron_boots slot:15
                - inventory adjust d:<[inv]> slot:15 "display_name:<&e>✯ <&d>Reward III <&e>✯"
                - inventory adjust d:<[inv]> slot:15 "lore:<&a>Jump <&e><[dr_2_result]>/100<&a> times"


            - case 3:

                - inventory add d:<[inv]> o:elytra slot:17
                - inventory adjust d:<[inv]> slot:17 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - if <[dr_2_result]> >= 500:
                    - inventory adjust d:<[inv]> slot:17 "enchantments:durability,1"
                    - inventory adjust d:<[inv]> slot:17 "lore:<&a>Ready to claim!"
                    - inventory adjust d:<[inv]> slot:17 "flags:HIDE_ALL"
                - else:
                    - inventory adjust d:<[inv]> slot:17 "lore:<&a>Fly <&e><[dr_2_result]>/500<&a> blocks"


                - inventory add d:<[inv]> o:elytra slot:16
                - inventory adjust d:<[inv]> slot:16 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - if <[dr_2_result]> >= 2000:
                    - inventory adjust d:<[inv]> slot:16 "enchantments:durability,1"
                    - inventory adjust d:<[inv]> slot:16 "lore:<&a>Ready to claim!"
                    - inventory adjust d:<[inv]> slot:16 "flags:HIDE_ALL"
                - else:
                    - inventory adjust d:<[inv]> slot:16 "lore:<&a>Fly <&e><[dr_2_result]>/2000<&a> blocks"


                - inventory add d:<[inv]> o:elytra slot:15
                - inventory adjust d:<[inv]> slot:15 "display_name:<&e>✯ <&d>Reward III <&e>✯"
                - if <[dr_2_result]> >= 5000:
                    - inventory adjust d:<[inv]> slot:15 "enchantments:durability,1"
                    - inventory adjust d:<[inv]> slot:15 "lore:<&a>Ready to claim!"
                    - inventory adjust d:<[inv]> slot:15 "flags:HIDE_ALL"
                - else:
                    - inventory adjust d:<[inv]> slot:15 "lore:<&a>Fly <&e><[dr_2_result]>/5000<&a> blocks"

        - choose <player.flag[dr_3]>:
            - case 1:
                - inventory add d:<[inv]> o:clock slot:21
                - inventory adjust d:<[inv]> slot:21 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - inventory adjust d:<[inv]> slot:21 "lore:<&a>Play for <&e><[dr_3_result]>/10<&a> minutes"


                - inventory add d:<[inv]> o:clock slot:22
                - inventory adjust d:<[inv]> slot:22 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - inventory adjust d:<[inv]> slot:22 "lore:<&a>Play for <&e><[dr_3_result]>/60<&a> minutes"


            - case 2:
                - inventory add d:<[inv]> o:experience_bottle slot:21
                - inventory adjust d:<[inv]> slot:21 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - inventory adjust d:<[inv]> slot:21 "lore:<&a>Placeholder"
                - inventory add d:<[inv]> o:experience_bottle slot:22
                - inventory adjust d:<[inv]> slot:22 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - inventory adjust d:<[inv]> slot:22 "lore:<&a>Placeholder"

        - choose <player.flag[dr_4]>:
            - case 1:
                - inventory add d:<[inv]> o:map slot:25
                - inventory adjust d:<[inv]> slot:25 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - inventory adjust d:<[inv]> slot:25 "lore:<&a>Play for <&e><[dr_4_result]>/25<&a> minutes without dying"


                - inventory add d:<[inv]> o:map slot:24
                - inventory adjust d:<[inv]> slot:24 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - inventory adjust d:<[inv]> slot:24 "lore:<&a>Play for <&e><[dr_4_result]>/60<&a> minutes without dying"


            - case 2:
                - inventory add d:<[inv]> o:ender_eye slot:25
                - inventory adjust d:<[inv]> slot:25 "display_name:<&e>✯ <&7>Reward I <&e>✯"
                - inventory adjust d:<[inv]> slot:25 "lore:<&a>Eat <&e><[dr_4_result]>/2<&a> cake slices"


                - inventory add d:<[inv]> o:ender_eye slot:24
                - inventory adjust d:<[inv]> slot:24 "display_name:<&e>✯ <&b>Reward II <&e>✯"
                - inventory adjust d:<[inv]> slot:24 "lore:<&a>Eat <&e><[dr_4_result]>/5<&a> cake slices"



DReward_Inv:
  type: inventory
  inventory: chest
  title: "<&9>Daily Rewards"
  size: 45
  slots:
    - "[] [] [] [] [] [] [] [] []"
    - "[] [] [] [] [] [] [] [] []"
    - "[] [] [] [] [] [] [] [] []"

MissionReset:
    type: task
    script:
    - flag player dr_set:!

    - flag player dr_1:!
    - flag player dr_1_start:!

    - flag player dr_2:!
    - flag player dr_2_start:!

    - flag player dr_3:!
    - flag player dr_3_start:!

    - flag player dr_4:!
    - flag player dr_4_start:!
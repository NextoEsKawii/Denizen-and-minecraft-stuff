Killer:
    type: world
    debug: false
    events:
        on killer command:
        - spawn zombie <player.location> save:killer
        - age <entry[killer].spawned_entities.get[1]> baby lock
        - equip <entry[killer].spawned_entities.get[1]> head:leather_helmet chest:leather_chestplate legs:leather_leggings boots:leather_boots hand:wooden_sword
        - flag server targetnew:->:<entry[killer].spawned_entities.get[1]>
        - flag <entry[killer].spawned_entities.get[1]> bot
        on delta time secondly every:2:
        - actionbar "<&b><server.recent_tps.get[1].round> | <server.recent_tps.get[2].round> | <server.recent_tps.get[3].round>" targets:<server.list_online_players>


        on zombie spawns:
        - wait 1s
        - if <context.entity.has_flag[bot]>:
            - inject TargetBot

        on zombie kills entity:
        - if <context.damager.has_flag[bot]>:
            - inject TargetBot_Specific

TargetBot:
    type: task
    script:
    - if <server.flag[targetnew].size> >= 1:
            - foreach <server.flag[targetnew]> as:mob:
                - if <[mob].is_living||null> == null:
                    - flag server targetnew:<-:<[mob]>
                - else:
                    - define target <[mob].location.find.living_entities.within[30].remove[1]>
                    - if <[target].get[<[target].find_all_partial[e@]>]||null> != null:
                        - attack <[mob]> target:<[target].get[<[target].find_all_partial[e@].random||null>]>
TargetBot_Specific:
    type: task
    script:
    - define mob <context.damager>
    - define target <[mob].location.find.living_entities.within[10].remove[1]>
    - if <[target].get[<[target].find_all_partial[e@]>]||null> != null:
        - attack <[mob]> target:<[target].get[<[target].find_all_partial[e@].random||null>]>


FirstLoginTest:
    type: world
    events:
        on floging command:
        - flag player new
        - teleport <player> l@0.5,64,0.5,world
        - inject NewSetup
        on player walks flagged:new:
        - flag player new:!
        - inject World_Gen_task

NewSetup:
    type: task
    script:
    - if <player.has_flag[new]>:
        - title "title:" "subtitle:<&a>Move to start playing"
        - wait 5s
        - inject NewSetup
        


World_Gen:
    type: world
    events:
        on wgen command:
        - createworld w_<player.uuid> copy_from:Ship
        - wait 5s
        - teleport <player> l@-10,34.5,-105,w_<player.uuid>
        on house command:
        - teleport <player> l@-11.5,34,-105.5,0,90,w_<player.uuid>
            
World_Gen_task:
    type: task
    script:
    - createworld w_<player.uuid> copy_from:Ship
    - title "title:<&e>Starting..." "subtitle:<&e>Please wait"
    - wait 5s
    - teleport <player> l@-11.5,34,-105.5,0,90,w_<player.uuid>
    - inject New_Tutorial

New_Tutorial:
    type: task
    script:
    - spawn Pixel l@-6.5,34.5,-105.5,w_<player.uuid> save:Pixel
    - spawn Pixel_Mount l@-6.5,34.5,-105.5,w_<player.uuid> save:Pixie
    - define Pixel <entry[Pixel].spawned_entities.get[1]>
    - define Pixie <entry[Pixie].spawned_entities.get[1]>
    - mount <[Pixel]>|<[Pixie]>
    - cast invisibility d:120 p:3 <[Pixie]>
    - wait 3s
    - define w1 "<&b>Welcome to the ship, <&e>Captain<&b>."
    - define w2 "<&b>I<&sq>m your holographic assistant, also known as <&e>Pixel<&b>."
    - define w3 "<&b>As you can see, this is your ship, <&e>The Dolphin<&b>."
    - define w4 "<&b>You can edit your ship freely, but keep in mind the <&e>Oxygen<&b>, we are in space."
    - define w5 "<&b>Now, follow me towards the machine room, <&e>I<&sq>m the small blue pixel<&b> if you haven<&sq>t noticed."
    - narrate "<[w1]>"
    - repeat <[w1].length.div[2]>:
        - playsound <player> sound:entity_ender_eye_death pitch:<util.random.decimal[1.5].to[2]>
        - wait 1t
    - wait <[w1].length.mul[2]>t
    - narrate ""
    - narrate "<[w2]>"
    - narrate ""
    - repeat <[w2].length.div[2]>:
        - playsound <player> sound:entity_ender_eye_death pitch:<util.random.decimal[1.5].to[2]>
        - wait 1t
    - wait <[w2].length.mul[2]>t
    - narrate ""
    - narrate "<[w3]>"
    - repeat <[w3].length.div[2]>:
        - playsound <player> sound:entity_ender_eye_death pitch:<util.random.decimal[1.5].to[2]>
        - wait 1t
    - wait <[w3].length.mul[2]>t
    - narrate ""
    - narrate "<[w4]>"
    - repeat <[w4].length.div[2]>:
        - playsound <player> sound:entity_ender_eye_death pitch:<util.random.decimal[1.5].to[2]>
        - wait 1t
    - wait <[w4].length.mul[2]>t
    - narrate ""
    - narrate "<[w5]>"
    - repeat <[w5].length.div[2]>:
        - playsound <player> sound:entity_ender_eye_death pitch:<util.random.decimal[1.5].to[2]>
        - wait 1t
    - waituntil rate:1s <[Pixie].location.distance[<player.location>]> < 2
    - define location1 l@5.5,34,-105.5,w_<player.uuid>
    - define location2 l@5.5,34,-107.5,w_<player.uuid>
    - walk <[Pixie]> <[location1]>
    - waituntil rate:1s <[Pixie].location.distance[<[location1]>]> < 0.5 && <[Pixie].location.distance[<player.location>]> < 2
    - walk <[Pixie]> <[location2]>
    - waituntil rate:1s <[Pixie].location.distance[<[location1]>]> < 0.5 && <[Pixie].location.distance[<player.location>]> < 2
    - define w6 "<&b>This is the machine room. From here you can see your ship internal status."
    - narrate ""
    - narrate "<[w6]>"
    - repeat <[w6].length.div[2]>:
        - playsound <player> sound:entity_ender_eye_death pitch:<util.random.decimal[1.5].to[2]>
        - wait 1t
    
Pixel:
  type: entity
  entity_type: armor_stand
  visible: false
  is_small: true
  equipment: air|air|air|light_blue_stained_glass
Pixel_Mount:
  type: entity
  entity_type: pig
  silent: true
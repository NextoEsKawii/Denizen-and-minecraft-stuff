Fishing:
    type: world
    events:
        on player fishes while FISHING:
        - if <player.inventory.contains[Fish_Hook]>:
            - take Fish_Hook quantity:1

        on player fishes entity:
        - announce "Fished entity"
        - announce <context.entity.entity_type>
        on player fishes while FAILED_ATTEMPT:
        - narrate Hi1
        on player fishes while REEL_IN:
        - narrate Hi2
        on player fishes:
        - while <context.hook.location.material.name.contains_any_text[water|air]||false>:
            - if <context.hook.location.material.name.contains_any_text[water]||null>:
                #- walk <context.hook.location.find.living_entities.within[10]> <context.hook.location>
                - foreach <context.hook.location.find.living_entities.within[10]> as:fish:
                    - push <[fish]> origin:<[fish].location> destination:<context.hook.location> speed:0.05
            - wait 5s
        on player fishes while CAUGHT_FISH:
        - define fish <list[Sardine|Shark|Diamond_Fish|Iron_Fish|Gold_Fish|Coal_Fish|Emerald_Fish|Redstone_Fish|Lapis_Fish].random>
        - narrate "You caught <[fish]>"

        - define chance <util.random.int[1].to[100]>
        - narrate <[chance]>


        - determine CAUGHT:<[fish]>
        on Fish_Flesh recipe formed:
        - announce <context.inventory>
        - announce <context.item>
        - announce <context.recipe.exclude[<item[air]>].get[1]>

Fishing_Smash:
    type: world
    events:
        on player right clicks stonecutter:
        - if <context.item.nbt_keys.get[1]||null> == fish:
            - choose <context.item.scriptname>:
                # NORMAL
                - case Sardine Shark:
                    - if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]||0> <= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:1
                    - else if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]> >= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.div[3].round>
                # DIAMOND FISH
                - case Diamond_Fish:
                    - if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]||0> <= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:1
                        - drop diamond <context.location.add[0.5,0.5,0.5]> quantity:1
                    - else if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]> >= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.div[3].round>
                        - drop diamond <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.round>
                # IRON FISH
                - case Iron_Fish:
                    - if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]||0> <= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:1
                        - drop Iron_ingot <context.location.add[0.5,0.5,0.5]> quantity:1
                    - else if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]> >= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.div[3].round>
                        - drop Iron_ingot <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.round>
                # GOLD FISH
                - case Gold_Fish:
                    - if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]||0> <= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:1
                        - drop Gold_ingot <context.location.add[0.5,0.5,0.5]> quantity:1
                    - else if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]> >= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.div[3].round>
                        - drop Gold_ingot <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.round>
                # COAL FISH
                - case Coal_Fish:
                    - if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]||0> <= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:1
                        - drop Coal <context.location.add[0.5,0.5,0.5]> quantity:1
                    - else if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]> >= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.div[3].round>
                        - drop Coal <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.round>
                # EMERALD FISH
                - case Emerald_Fish:
                    - if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]||0> <= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:1
                        - drop Emerald <context.location.add[0.5,0.5,0.5]> quantity:1
                    - else if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]> >= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.div[3].round>
                        - drop Emerald <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.round>
                # REDSTONE FISH
                - case Redstone_Fish:
                    - if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]||0> <= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:1
                        - drop Redstone <context.location.add[0.5,0.5,0.5]> quantity:1
                    - else if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]> >= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.div[3].round>
                        - drop Redstone <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.round>
                # LAPIS FISH
                - case Lapis_Fish:
                    - if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]||0> <= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:1
                        - drop Lapis_lazuli <context.location.add[0.5,0.5,0.5]> quantity:1
                    - else if <context.item.lore.get[1].before[<&sp>kg].strip_color.div[3]> >= 1:
                        - drop Fish_Flesh <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.div[3].round>
                        - drop Lapis_lazuli <context.location.add[0.5,0.5,0.5]> quantity:<context.item.lore.get[1].before[<&sp>kg].strip_color.round>
            - take iteminhand quantity:1
            - playsound <context.location> sound:block_grindstone_use pitch:1.5
            - determine cancelled

Sardine:
    type: item
    material: cod
    display name: "<&f>Sardine"
    lore:
    - "<&7><util.random.decimal[0.1].to[0.3].round_to[2]> kg"
    mechanisms:
        nbt: fish/<util.random.uuid>
Shark:
    type: item
    material: cod
    display name: "<&f>Shark"
    lore:
    - "<&7><util.random.decimal[20].to[70].round_to[2]> kg"
    mechanisms:
        nbt: fish/<util.random.uuid>
Diamond_Fish:
    type: item
    material: cod
    display name: "<&f>Diamond Fish"
    lore:
    - "<&7><util.random.decimal[2].to[5].round_to[2]> kg"
    mechanisms:
        nbt: fish/<util.random.uuid>
        enchantments: durability,1
        flags: HIDE_ALL
Iron_Fish:
    type: item
    material: cod
    display name: "<&f>Iron Fish"
    lore:
    - "<&7><util.random.decimal[2].to[5].round_to[2]> kg"
    mechanisms:
        nbt: fish/<util.random.uuid>
        enchantments: durability,1
        flags: HIDE_ALL
Gold_Fish:
    type: item
    material: cod
    display name: "<&f>Gold Fish"
    lore:
    - "<&7><util.random.decimal[2].to[5].round_to[2]> kg"
    mechanisms:
        nbt: fish/<util.random.uuid>
        enchantments: durability,1
        flags: HIDE_ALL
Coal_Fish:
    type: item
    material: cod
    display name: "<&f>Coal Fish"
    lore:
    - "<&7><util.random.decimal[2].to[5].round_to[2]> kg"
    mechanisms:
        nbt: fish/<util.random.uuid>
        enchantments: durability,1
        flags: HIDE_ALL
Emerald_Fish:
    type: item
    material: cod
    display name: "<&f>Emerald Fish"
    lore:
    - "<&7><util.random.decimal[2].to[5].round_to[2]> kg"
    mechanisms:
        nbt: fish/<util.random.uuid>
        enchantments: durability,1
        flags: HIDE_ALL
Redstone_Fish:
    type: item
    material: cod
    display name: "<&f>Redstone Fish"
    lore:
    - "<&7><util.random.decimal[2].to[5].round_to[2]> kg"
    mechanisms:
        nbt: fish/<util.random.uuid>
        enchantments: durability,1
        flags: HIDE_ALL
Lapis_Fish:
    type: item
    material: cod
    display name: "<&f>Lapis Fish"
    lore:
    - "<&7><util.random.decimal[2].to[5].round_to[2]> kg"
    mechanisms:
        nbt: fish/<util.random.uuid>
        enchantments: durability,1
        flags: HIDE_ALL


Fish_Flesh:
    type: item
    material: phantom_membrane
    display name: "<&f>Fish Flesh"
Fish_Meat:
    type: item
    material: brick
    display name: "<&f>Fish Meat"
    recipes:
        1:
            type: shapeless
            input: Fish_Flesh|Fish_Flesh|Fish_Flesh|Fish_Flesh
Fish_Hook:
    type: item
    material: lead
    display name: "<&f>Fish Hook"
    recipes:
        1:
            type: shapeless
            input: Fish_Meat|String|iron_nugget
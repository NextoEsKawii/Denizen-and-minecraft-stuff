Menu:
    type: world
    debug: false
    events:
        on player respawns:
        - inventory set o:StarFragment d:<player.inventory> slot:9
        on player drops nether_star:
        - determine cancelled
        on player death:
        - determine <context.drops.remove[<context.drops.find_partial[nether_star]>]>
        on player drags StarFragment in inventory:
        - determine cancelled
        on player clicks StarFragment in inventory:
        - determine cancelled
        on player swaps items:
        - if <context.main.material.name> == nether_star || <context.offhand.material.name> == nether_star:
            - determine cancelled

        on player right clicks with StarFragment:
        - inventory open d:StarFragmentInv
        on player clicks Ship in StarFragmentInv:
        - createworld w_<player.uuid>
        - adjust <player> gamemode:adventure
        - teleport <player> <location[-11.5,34,-105.5,0,90,w_<player.uuid>]>
        - determine cancelled
        on player steps on dropper:
        - if <context.previous_location.y.is_integer>:
          - teleport <player> <context.location.center.add[0,3.5,1]>

StarFragmentInv:
  type: inventory
  inventory: CHEST
  title: Navigation
  size: 45
  definitions:
    1: air
    2: Ship
  slots:
    - [1] [1] [1] [1] [1] [1] [1] [1] [1]
    - [1] [1] [1] [1] [2] [1] [1] [1] [1]
    - [1] [1] [1] [1] [1] [1] [1] [1] [1]
    - [1] [1] [1] [1] [1] [1] [1] [1] [1]
    - [1] [1] [1] [1] [1] [1] [1] [1] [1]

Ship:
  type: item
  display name: '<&a>Your ship'
  material: player_head[skull_skin=<util.random.uuid>|eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOGRkMDhiZjM4YmQxYjIzM2U1ZDRkYzVkY2FhMDQ0YzI2NzI0NDU3NzU0MjIxZjUwM2ZkYmE1MThlNGIyNWE5ZSJ9fX0=]
  

StarFragment:
  type: item
  material: nether_star
  mechanisms:
    unbreakable: true
    flags: HIDE_ALL
  display name: <&a>Star Fragment
  lore:
  - <&7>Leads the way...
  enchantments:
  - durability:1
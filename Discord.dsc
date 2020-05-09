Discord:
    type: world
    debug: true
    events:
        on server start:
        - discord id:Scavenger connect code:Njc3ODUzMzAyODA5MDM0Nzgz.XkaTYA.0lCwF68S36cMZoHaXppwE05RggM
        #on discord message received:
        #- if <context.author.id> != <context.bot.self_user.id>:
        #    - discord id:Scavenger message channel:<context.channel> "Hola"
        #    - narrate "<context.channel>"
        on player chats:
        - flag server discord_msg:!
        - foreach <context.message.split> as:word:
            - if <[word].starts_with[@]>:
                - if <discord[Scavenger].group[Space].member[<[word].after[@]>].mention||null> != null:
                    - flag server discord_msg:->:<discord[Scavenger].group[Space].member[<[word].after[@]>].mention>
                - else:
                    - flag server discord_msg:->:<[word]>
            - else:
                    - flag server discord_msg:->:<[word]>

        - define sender <player.name>
        - if <server.flag[discord_chat_sender]||null> == <[sender]>:
            - discord id:Scavenger message channel:690655865044336682 "» <server.flag[discord_msg].space_separated>"
        - else:
            - discord id:Scavenger message channel:690655865044336682 "__**<player.name>**__:<&nl>» <server.flag[discord_msg].space_separated>"
        - flag server discord_chat_sender:<player.name>

        on player joins:
        - discord id:Scavenger message channel:690655865044336682 ":star: __**<player.name>**__ just joined!"
        - flag server discord_chat_sender:null
        on player quits:
        - discord id:Scavenger message channel:690655865044336682 ":door: __**<player.name>**__ is no more!"
        - flag server discord_chat_sender:null
        

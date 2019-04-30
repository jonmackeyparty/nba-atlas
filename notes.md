#What does this app need to do?  
  User Side:
    User opens to account page, sees:
      /user/1
        Leagues_____
          -the leagues s/he is in, listed by name
          -the teams s/he is a member of, with an option to view that         team's page: /users/1/teams/1 (this is a nested resource)
          -pending invites, with the option to accept?
              (this is a scoped method on Invitation)

  Admin Side:
    Admin opens to account page, sees:
      /admin/1
        -The name of the League s/he administrates
          -If there are teams in this league, s/he sees team names, with the option to view that team's page: /admin/1/teams/1 (this is a nested resource)
          -If there are no teams in this league, s/he sees all the players in this league.
        -pending invites
        -link to a form for a new invitation: /admin/1/invitations/new
          (this will link to Player.all, as all registered users are reachable)

#What models will this app need and what structure their data?

  Admin
    has_many: invitations
    (id)
    name: string

  Player
    (id)
    name: string
    age: integer
    nickname: string
    position: string
    jersey_number: integer

  Team
    has_many: players
    (id)
    name: string


  League
    (id)
    name: string
    type: string (ie pickup, summer league, rec league, church league)
    schedule: string


  Invitation
    admin_id
    league_id: integer
    player_id: integer
    accepted?: boolean

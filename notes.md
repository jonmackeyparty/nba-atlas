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
    has_many: leagues
    (id)
    name: string

  Player
    has_many: teams, through: leagues
    has_many: leagues, through: invitations
    has_many: invitations
    (id)
    name: string
    age: integer
    nickname: string
    position: string
    jersey_number: integer

  Team
    belongs_to: league
    has_many: players
    (id)
    name: string


  League
    belongs_to: admin
    has_many: teams
    has_many: players, through: invitations
    has_many: invitations
    (id)
    name: string
    type: string (ie pickup, summer league, rec league, church league)
    schedule: string


  Invitation
    belongs_to: league
    belongs_to: player
    league_id: integer
    player_id: integer
    accepted?: boolean

#What views will this app need? (centered on admin and user -- but who adds teams etc?  Admin can add team to his/her league, no one will add teams globally, also, players create themselves, not the admin, so no player add form for admins.  Who creates leagues?  Are admins also players?)

  Login/Logout
  /login
    -if user is admin > admin show page  
    -if user is player > player show page

  Admin
    admins/:id/leagues
      -shows leagues the admin...administrates
    admins/:id/leagues/new

    <--- The following if league.type == pickup ---->
    admins/:id/league/:id/players
    admins/:id/league/:id/players/:id
    <------Else the following is available --------->
    admins/:id/league/:id/teams/
    admins/:id/league/:id/teams/:id
    admins/:id/league/:id/teams/new

    admins/:id/league/:id/invitations/new



  Player
    players/new
      -registration form, also acts as admin registration form?
    players/:id/

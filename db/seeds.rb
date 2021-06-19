League.delete_all
Team.delete_all
Bet.delete_all

League.create name: 'CBLOL'
League.create name: 'LEC'
League.create name: 'NA'

Team.create name: 'Pain', league_id: 1
Team.create name: 'Flamengo', league_id: 1
Team.create name: 'Cloud9', league_id: 3
Team.create name: 'Fnatic', league_id: 2

Bet.create league: 'CBLOL'
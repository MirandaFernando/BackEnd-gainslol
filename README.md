# Ruby on Rails 6 as an API for website Gainslol.

This was a personal project to learn to develop Rails applications, the project is about an API so that sports traders can easily be faded and agile its entries.
The frontend of the application is at https://github.com/joao-mcf/frontend-gainslol.
Project developed along with [@Joao-MCF](https://github.com/Joao-MCF)

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      2.7.2
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      6.1.x
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      PostgreSQL
    </td>
  </tr>
</table>

## Initial settings to run the project

```bash
# clone the project
git clone https://github.com/MirandaFernando/BackEnd-gainslol.git

# enter the cloned directory
cd BackEnd-gainslol
# install Ruby on Rails dependencies
bundle install

# create the development and test databases
rails db:create

# create the tables
rails db:migrate

# run the project
rails s
```

The backend is available at `http://localhost:3000`.

## Tests

To run the tests:

```bash
rspec
```
### technologies used

- RSpec
- Shoulda Matchers
- SimpleCov
- Faker
- Factory Bot


## Using the Gainslol-api

The following endpoints are available:


## API Login
####  Create user

```
curl --request GET /api/auth
  --email: email
  --password: password
  --confirmpassword: password
```

####  Sign in

```
curl --request POST /auth/sign_in
  --email: email
  --password: password
  ```

####  Sign out

```
curl --request DELETE /auth/sign_out
      Header: token
              uid
              client
```
### bets

### Include a Header Authorization

```
  Header: acess-token, uid, client
```

| Endpoints                   | Usage                                     | Params             |
| --------------------------- | ----------------------------------------- | ------------------ |
| `GET /api/bets`           | Get all of the bets.                    |                    |
| `GET /api/bets/:id`       | Get the details of a single bet.         |                    |
| `POST /api/bets`          | Add a new bet.                           | params_bet         |
| `PUT /api/bets/:id`       | Edit the details of an existing bet.     | params_bet         |
| `DELETE /api/bets/:id`    | Remove the bet.                          |                    |

params_bet: game_date, league, style, winner, loser,  result_bet, input, odd, profit, comment

### leagues

| Endpoints                   | Usage                                     | Params             |
| --------------------------- | ----------------------------------------- | ------------------ |
| `GET /api/leagues`           | Get all of the leagues.                    |                    |
| `GET /api/leagues/:id`       | Get the details of a single league.         |                    |
| `POST /api/leagues`          | Add a new league.                           | **name**: [String] |
| `PUT /api/leagues/:id`       | Edit the details of an existing league.     | **name**: [String] |
| `DELETE /api/leagues/:id`    | Remove the league.                          |                    |

### teams

| Endpoints                  | Usage                                     | Params             |
| ---------------------------|-------------------------------------------| ------------------ |
| `GET /api/teams`           | Get all of the teams.                     |                    |
| `GET /api/teams/:id`       | Get the details of a single team.         |                    |
| `POST /api/teams`          | Add a new team.                           | **name**: [String] |
| `PUT /api/teams/:id`       | Edit the details of an existing team.     | **name**: [String] |
| `DELETE /api/teams/:id`    | Remove the team.                          |                    |

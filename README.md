# Gainslol api

Ruby on Rails 6 as an API for website gainslol.

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
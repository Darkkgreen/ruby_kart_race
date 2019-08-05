# Ruby Kart Race

Project that simulates a race. It creates the race podium, the drivers and their laps using an input file called `entry.txt` that is stored in the project's root folder.

The software will show the race podium, as well as some statistics about the drivers:

- Fastest Lap
- Average speed
- Race time

#### Dependencies

- Ruby 2.4.1
- RSpec 3.8
- require_all 2.0

#### Structure

The project folder is structured as described below:

- **Models:** Classes that define each object and its own responsibilities.
- **Services:** Services that abstract some operations, reducing Models responsibilities to calls only.
- **Utils:** Useful operations that every function could use.
- **Spec:** Tests for each component (models and services)

#### Usage

To use this project, make sure you have Ruby installed. You can download *rvm* to manage ruby versions easily.

Clone this repository:

`git clone https://github.com/Darkkgreen/ruby_kart_race`

Change to the cloned repo:

`cd ruby_kart_race`

Install all dependecies:

```
rvm install 2.4.1
gem install bundler
bundle install
```

To execute it using the `entry.txt` file already present inside this repository, use:

`ruby main.rb`

If you want to use another log file, paste it inside this repository and use:

`ruby main.rb <file_name>`

#### Output

The program will output something along these lines:

```
A volta mais rápida da corrida é de F.MASSA
E o tempo da volta foi 01:02.768

Posição: 1
038 - F.MASSA
Voltas: 4
Melhor volta: 01:02.768
Tempo total de prova: 04:11.577
Velocidade média: 44.246
```

Based on the info loaded from the file. Each block represents a driver.

#### Tests

We're using RSpec to control our tests. To run the test suit, use:

`bundle exec rspec`
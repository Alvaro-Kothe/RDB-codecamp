CREATE DATABASE worldcup;

\c worldcup

CREATE TABLE teams (
  team_id serial primary key,
  name text unique not null
);

CREATE TABLE games (
  game_id serial primary key,
  year int not null,
  round varchar(40) not null,
  winner_id int not null,
  opponent_id int not null,
  winner_goals int not null,
  opponent_goals int not null
);

ALTER TABLE games add foreign key(winner_id) references teams(team_id);
ALTER TABLE games add foreign key(opponent_id) references teams(team_id);

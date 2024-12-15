create database number_guess;

\c number_guess

create table users(user_id serial primary key, name varchar(22));
create table games(game_id serial primary key, user_id int not null, guesses int);

alter table games add foreign key(user_id) references users(user_id);

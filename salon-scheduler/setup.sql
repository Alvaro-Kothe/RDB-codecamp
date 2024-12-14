CREATE DATABASE salon;

\c salon

create table customers (customer_id serial primary key, phone varchar(40) unique, name varchar(50));
create table appointments (
  appointment_id serial primary key, 
  customer_id int not null,
  service_id int not null,
  time varchar(50)
);
create table services (service_id serial primary key, name varchar(50));

alter table appointments add FOREIGN KEY(customer_id) REFERENCES customers(customer_id);
alter table appointments add FOREIGN KEY(service_id) REFERENCES services(service_id);

INSERT INTO services ( service_id, name) VALUES 
  ( 1, 'cut' ),
  ( 2, 'color' ),
  ( 3, 'perm' ),
  ( 4, 'style' ),
  ( 5, 'trim' );

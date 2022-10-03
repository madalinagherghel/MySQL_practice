create database petclinic;
-- drop database petclinic;
show databases;
select * from information_schema.tables;
select * from information_schema.views;
create database cinema;
create database humanresources;
use petclinic;
CREATE TABLE owners (
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL
);
alter table owners add column age int;
alter table owners drop column age;
alter table owners modify firstName char(25) not null;
desc owners;
alter table owners modify lastName char(25) not null;
alter table owners change lastName ownerLastName char(25) not null;
alter table owners rename to petOwner;
-- drop table petOwner; 
desc petOwner;
rename table petOwner to owners;
alter table owners add column dateOfBirth date;
alter table owners change ownerLastName lastName varchar(25);
insert into owners (firstName, lastName, dateOfBirth)
values ('Jim', 'Jameson', '1980-01-01');
select * from owners; 
insert into owners values ('Tom', 'Anderson', '1980-01-30');
insert into owners (firstName, lastName, dateOfBirth)
values ('Andrew', 'Smith', '1957-05-20'), ('Tom', 'Thompson', '1954-07-28');
-- update owners set firstName= 'James';
-- delete from owners;
-- truncate table; 
insert into owners (firstName, lastName, dateOfBirth)
values ('Ion', 'Ionescu', '1975-06-02'), ('John', 'Andreescu', '1924-07-24');
select * from owners;
alter table owners add column age int;
select firstName, dateOfBirth from owners;
update owners set age=68 where lastName='Thompson'; 
update owners set age=42 where lastName='Anderson';
update owners set age=65 where lastName='Smith';
update owners set age=25 where lastName='Jameson';
update owners set age=47 where lastName='Ionescu';
update owners set age=98 where lastName='Andreescu';
select * from owners where age=25;
insert into owners (firstName, lastName, dateOfBirth, age)
values ('Anton', 'Popescu', '1973-06-25',51), ('Marin', 'Antonescu', '1967-01-21',54);
select * from owners where dateOfBirth > '1970-12-31';
select * from owners where age>25;
select * from owners where age<25;
select * from owners where age>=25;
select * from owners where age<=25;
select * from owners where firstName in ('Ion', 'Marin');
select * from owners where firstName not in ('Ion', 'Marin');
alter table owners add column city varchar(50);
update owners set city='Cluj' where firstName='Ion';
select * from owners where city is null;
select * from owners where city is not null;
select * from owners where age!=25;
select * from owners where firstName!='Ion';
select * from owners where firstName!='John';
select * from owners where firstName<>'John';
select * from owners where age between 40 and 60;
select * from owners where firstName like'i%';
select * from owners where firstName like'%on';
select * from owners where firstName like'%n%';
select * from owners where dateOfBirth like '1975%';
select * from owners where dateOfBirth like '197%';
select * from owners where dateOfBirth like '19%';
select * from owners where dateOfBirth like '%02';
select * from owners where dateOfBirth like '%06%';
insert into owners (firstName, lastName, dateOfBirth, age)
values ('Winston', 'Churchill', '1898-06-06',47);
select * from owners where dateOfBirth like '%-06-%';
select * from owners where firstName like '%on' and dateOfBirth like '197%';
select * from owners where (firstName like '%on' or dateOfBirth like '197%') and city='Cluj';
select * from owners where firstName like '%on' or dateOfBirth like '197%' and city='Cluj';
select sum(age) from owners;
select avg(age) from owners;
select firstName, lastName, min(age) from owners group by firstName, lastName;
select max(age) from owners;
select count(*) from owners;
select count(city) from owners;
select* from owners;
alter table owners add column ownerid int primary key auto_increment;
alter table owners modify column ownerid int auto_increment first;
desc owners;
insert into owners (firstName, lastName, dateOfBirth, age) values ('Anton', 'Pann', '1823-04-17', 95);
insert into owners (firstName, lastName, dateOfBirth, age) values ('Anton', 'Pann', '1823-04-17', 95);
create table pets(
petId int not null auto_increment,
race varchar(50) not null,
dateOfBirth date not null,
ownerId int not null,
primary key (petId),
constraint fk_pets_owners foreign key (ownerId) references owners(ownerId)
);
select * from pets;
select * from owners;
delete from owners where ownerid=11;
delete from pets where ownerid=11;
insert into pets (race, dateOfBirth, ownerId)
values ('european', '2020-02-15', 10);
delete from owners where ownerid=10;
insert into pets (race, dateOfBirth, ownerId)
values ('spitz', '2021-12-07', 10);
select * from owners cross join pets;
select * from owners inner join pets on owners.ownerId = pets.ownerId;
select * from owners left join pets on owners.ownerId = pets.ownerId;
select * from owners left join pets on owners.ownerId = pets.ownerId where pets.ownerId is null;
select * from owners left join pets on owners.ownerId = pets.ownerId where pets.ownerId is not null;
select * from owners right join pets on owners.ownerId = pets.ownerId;
select * from pets left join owners on owners.ownerId = pets.ownerId;
select * from owners right join pets on owners.ownerId = pets.ownerId where owners.ownerId is null;
select * from owners right join pets on owners.ownerId = pets.ownerId where owners.ownerId is not null;
select * from owners order by dateOfBirth;
select * from owners order by dateOfBirth desc;
select * from owners order by age desc limit 1;
select o.ownerId, firstName, lastName, count(petId)
from owners o inner join pets p on o.ownerid = p.ownerId
group by ownerId, firstName, lastName;
insert into pets (race, dateOfBirth, ownerId)
values ('dog german', '2015-07-05', 6);
insert into pets (race, dateOfBirth, ownerId)
values ('pisica norvegiana', '2016-06-03', 6);
select o.ownerId, firstName, lastName, count(petId)
from owners o inner join pets p on o.ownerid = p.ownerId
group by ownerId, firstName, lastName;
select * from owners;
select * from pets;
select o.ownerId, firstName, lastName, count(petId)
from owners o inner join pets p on o.ownerid = p.ownerId
group by ownerId, firstName, lastName
having count(petId)>1;
select * from owners inner join pets on owners.ownerId= pets.ownerId;
select * from owners o inner join pets p on o.ownerId= p.ownerId;
select o.ownerId, firstName, lastName, race, o.dateOfBirth ownerBirthdate, p.dateOfBirth petBirthDate from owners o inner join pets p on o.ownerId= p.ownerId;
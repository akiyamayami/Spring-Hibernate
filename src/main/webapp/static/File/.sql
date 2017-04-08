create table user(id varchar(20) primary key,
				  pass varchar(20),
				  roleID int);
create table role(roleID int primary key,
				  roleName nvarchar(30));
create table right(rightID int primary key,
				   name nvarchar(30),
				   detail nvarchar(100));
create table role_right(roleID int,
						rightID int);
create table user_right(id int,
					   rightID int);
alter table user add foreign key (roleID) references role(roleID);
alter table role_right add foreign key (roleID) references role(roleID);
alter table role_right add foreign key (rightID) references right(rightID);

alter table user_right add foreign key (id) references user(id);
alter table user_right add foreign key (rightID) references right(rightID);

insert into role values (1,G1);
insert into role values (2,G2);

insert into user values("1","1",1);
insert into user values("2","2",2);
insert into user values("3","3",2);

insert into right values(1,"Q1","Can do Q1");
insert into right values(2,"Q2","Can do Q2");
insert into right values(3,"Q3","Can do Q3");
insert into right values(4,"Q4","Can do Q4");
insert into right values(5,"Q5","Can do Q5");
insert into right values(6,"Q6","Can do Q6");
insert into right values(7,"Q7","Can do Q7");
insert into right values(8,"Q8","Can do Q8");
insert into right values(9,"Q9","Can do Q9");

insert into user_right values(3,9);
insert into user_right values(3,8);

insert into role_right values(1,1);
insert into role_right values(1,2);
insert into role_right values(1,3);
insert into role_right values(1,4);
insert into role_right values(2,5);
insert into role_right values(2,6);
insert into role_right values(2,7);
create table PERSON
(
  ssn char(9) not null,
  fname varchar2(20) not null,
  minit char(1),
  lname varchar2(20) not null,
  sex char(1) check (sex in ('M', 'F', 'N')),
  dob date,
  street varchar2(30),
  zipcode char(5),
  phone char(10),
  constraint personPK primary key (ssn)
);

create table STUDENT
(
  ssn char(9) not null,
  student_no char(12) not null,
  degree_prog varchar2(3),
  minor_dept number(5,0),
  major_dept number(5,0) not null,
  class varchar2(20),
  constraint studentPK primary key (ssn),
  constraint personstuFRK foreign key (ssn) references person(ssn) on delete cascade,
  constraint stunumUK unique (student_no)
);

create table COURSE
(
  cno varchar2(10) not null,
  cname varchar2(50),
  credits number(5,0),
  dno number(5,0),
  constraint coursePK primary key (cno),
  constraint coursednoFRK foreign key (dno) references department(dno) on delete cascade
);


create table COURSE_PREREQUISITE
(
  cno varchar2(10) not null,
  prerequisite_cno varchar2(10) not null,
  constraint courseprereqPK primary key (cno, prerequisite_cno),
  constraint cno1FRK foreign key (cno) references course(cno) on delete cascade,
  constraint cno2FRK foreign key (prerequisite_cno) references course(cno) on delete cascade
);

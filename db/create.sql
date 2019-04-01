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

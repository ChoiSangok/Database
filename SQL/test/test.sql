create table empl(
    eid char(3) constraint pkeid primary key ,
    ename varchar2(20) constraint nename not null,
    eno char(14) constraint ueno unique constraint NENO not null,
    email varchar2(25) constraint uemail unique,
    phone varchar2(12),
    hiredate date,
    jid char(2),
    bonuspci number,
    marriage char(1) default 'n' constraint chk check (marriage in('y','n')),
    mid char(3),
    did char(2),
    constraint fkjid foreign key (jid) references job(empno) ON DELETE SET NULL,   
    constraint fkmid foreign key(mid) references empl(eid) on delete set null,
    constraint fkdid foreign key(did) references department(departmentprimarkey)
    on delete cascade
    
    );--null 값

--컬럼지정

comment on COLUMN empl.eid is 'afdaf';

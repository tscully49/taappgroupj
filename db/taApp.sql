DROP SCHEMA IF EXISTS TaAPP CASCADE;
CREATE SCHEMA TaAPP;
SET search_path = TaAPP;

CREATE TABLE 'admin'(
admin_id integer,
admin_name varchar(60),
password varchar(40),
miz_email varchar(100),
PRIMARY KEY(admin_id)
);

INSERT INTO 'admin' VALUES (1234567,'Charles Johnson', 'Mizzou1234','CJohnson@mizzou.edu');


CREATE TABLE professors(
prof_id integer,
prof_name varchar(60),
password varchar(40),
miz_email varchar(100),
PRIMARY KEY(prof_id)
);

INSERT INTO professors VALUES (1256789,'Grant Scott','GS4320','GScott@mizzou.edu');

CREATE TYPE stutype AS ENUM ('undergrad' 'Masters' 'PHD');
CREATE TABLE students(
stu_id integer,
stu_name varchar(60), 
password varchar(40),
miz_email varchar(100),
avg_rating smallint,
student_type stutype,  --grad_phd field in ERD
PRIMARY KEY(stu_id)
);

INSERT INTO students VALUES ('1632562','Carthy Williams', 'Carthy34','Cwilliams@mail.missouri.edu','7','undergrad' );

CREATE TABLE courses(
co_id integer,
prof_id varchar(60) REFERENCES professors(prof_id), 
course_name varchar(60),
PRIMARY KEY(co_id)
);

INSERT INTO courses VALUES (4320,1256789,'Software Engineering');


CREATE TABLE ratings(
prof_id integer REFERENCES professors(prof_id),
stu_id REFERENCES students(stu_id),
co_id integer REFERENCES courses(co_id),
rating integer,
PRIMARY KEY(prof_id, stu_id, co_id)
);

INSERT INTO ratings VALUES (1256789,1632562,4320,7);

CREATE TYPE stutype AS ENUM ('undergrad' 'Masters' 'PHD');
CREATE TABLE applications(
app_id integer,
name varchar(60) REFERENCES students(stu_name),
stu_id integer REFERENCES students(stu_id),
gpa decimal,
phone_num integer,
miz_email var char (100) REFERENCES students(miz_email),
time_stamp timestamp,
date_of_app date,
ant_grad_date date,
SPEAK_score integer,
semester_of_test varchar(60),
orientation_met boolean,
international1 boolean, 
international2 boolean, --?what are these data types
international3 boolean,
accepted boolean,
phd_grade_app stutype,
PRIMARY KEY(app_id)
);

INSERT INTO applications VALUES (2345678, 'Carthy Williams',1632562,3.34,7735592456, 'Cwilliams@mail.missouri.edu','9:30','4-6-2015','May 16 2016',80,'Fall 14', 1,1,1,1,1,'undergrad')

CREATE TABLE course_want_prof(
course_id integer REFERENCES courses(co_id),
app_id integer REFERENCES applications (app_id),
grade varchar (20),
PRIMARY KEY(course_id, app_id),
);

INSERT INTO course_want_prof (4320,2345678, 'A');

CREATE TYPE taughtorteach AS ENUM ('taught', 'teach')
CREATE TABLE course_teach(
course_id integer REFERENCES courses(co_id),
app_id integer REFERENCES applications (app_id),
taught_teaching taughtorteach,
PRIMARY KEY(course_id, app_id)
);

INSERT INTO course_teach VALUES (4320,2345678,'taught');

CREATE TABLE comments(
c_id integer --comment, not
stu_id integer REFERENCES students(stu_id),
prof_id integer REFERENCES professor(prof_id),
'comment' varchar(140),
time_stamp timestamp,
date_commented date,
rating integer,
PRIMARY(c_id, student_id, p_id)
);

INSERT INTO comments VALUES (3678243,1632562,1256789,' Great Student','4:30','2:35', 7);

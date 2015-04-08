DROP SCHEMA IF EXISTS TaAPP CASCADE;
CREATE SCHEMA TaAPP;
SET search_path = TaAPP;

CREATE TABLE 'admin'(
admin_id integer,
admin_name varchar(60) NOT NULL,
password varchar(40) NOT NULL,
miz_email varchar(100) NOT NULL,
PRIMARY KEY(admin_id)
);

INSERT INTO 'admin' VALUES (1234567,'Charles Johnson','Mizzou1234','CJohnson@mizzou.edu');
INSERT INTO 'admin' VALUES (1234568,'James Rooney','password','JRooney@missouri.edu');
INSERT INTO 'admin' VALUES (1234569,'Sarah Clarke','k23NOLA','SClarke@missouri.edu');

CREATE TABLE professors(
prof_id integer,
prof_name varchar(60) NOT NULL,
password varchar(40) NOT NULL,
miz_email varchar(100) NOT NULL,
PRIMARY KEY(prof_id)
);

INSERT INTO professors VALUES (1256789,'Grant Scott','GS4320','GScott@mizzou.edu');
INSERT INTO professors VALUES (1256790,'Hugo Ferdinand','correcthorsebatterystaple','HFerdinand@missouri.edu');
INSERT INTO professors VALUES (1256791,'Melinda Swofford','twelve_jazz46','MSwofford@missouri.edu');

CREATE TYPE stutype AS ENUM ('undergrad' 'Masters' 'PHD');
CREATE TABLE students(
stu_id integer,
stu_name varchar(60) NOT NULL, 
password varchar(40) NOT NULL,
miz_email varchar(100) NOT NULL,
avg_rating smallint,
student_type stutype NOT NULL,  --grad_phd field in ERD
PRIMARY KEY(stu_id)
);

INSERT INTO students VALUES (1632562,'Carthy Williams', 'Carthy34','Cwilliams@mail.missouri.edu',7,'undergrad');
INSERT INTO students VALUES (1632563,'Benedict Cumberbatch', 'IAmSherlockHolmes','btc3d2@mail.missouri.edu',NULL,'PHD');
INSERT INTO students VALUES (1632564,'Cooper Collins', 'stoptryingtoguessmypassword','cac4yf@mail.missouri.edu',4,'Masters');
INSERT INTO students VALUES (1632565,'Anthony Tilley', 'srtdnabswwn4809#','alt55g@mail.missouri.edu',9,'undergrad');

CREATE TABLE courses(
co_id integer,
prof_id varchar(60) REFERENCES professors(prof_id), 
course_name varchar(60) NOT NULL,
PRIMARY KEY(co_id)
);

INSERT INTO courses VALUES (4320,1256789,'Software Engineering');
INSERT INTO courses VALUES (4430,1256790,'Compilers');
INSERT INTO courses VALUES (1050,1256791,'Algorithm Design and Programming I');
INSERT INTO courses VALUES (2050,1256791,'Algorithm Design and Programming II');
INSERT INTO courses VALUES (4520,1256789,'Operating Systems I');


CREATE TABLE ratings(
prof_id integer REFERENCES professors(prof_id),
stu_id integer REFERENCES students(stu_id),
co_id integer REFERENCES courses(co_id),
rating smallint NOT NULL,
PRIMARY KEY(prof_id, stu_id, co_id)
);

INSERT INTO ratings VALUES (1256789,1632562,4320,7);
INSERT INTO ratings VALUES (1256789,1632564,4320,4);
INSERT INTO ratings VALUES (1256790,1632565,2050,9);

CREATE TYPE stutype AS ENUM ('undergrad' 'Masters' 'PHD');
CREATE TABLE applications(
app_id integer,
name varchar(60) REFERENCES students(stu_name),
stu_id integer REFERENCES students(stu_id),
gpa decimal(4, 3) NOT NULL,
phone_num integer NOT NULL,
miz_email var char (100) REFERENCES students(miz_email),
time_stamp timestamp NOT NULL,
date_of_app date NOT NULL,
ant_grad_date date NOT NULL,
SPEAK_score integer,
semester_of_test varchar(60),
orientation_met boolean NOT NULL,
international1 boolean, 
international2 boolean, --?what are these data types
international3 boolean,
accepted boolean,
phd_grade_app stutype REFERENCES students(student_type), 
PRIMARY KEY(app_id)
);

INSERT INTO applications VALUES (2345678, 'Carthy Williams',1632562,3.34,7735592456, 'Cwilliams@mail.missouri.edu','9:30','4-6-2015','May 16 2016',80,'Fall 14', 1,1,1,1,1,'undergrad');
INSERT INTO applications VALUES (2345679, 'Benedict Cumberbatch',1632563,4.0,6184973215, 'btc3d2@mail.missouri.edu','12:45','3-21-2015','May 24 2018',NULL,NULL, 1,0,0,0,NULL,'PHD');
INSERT INTO applications VALUES (2345680, 'Anthony Tilley',1632565,3.792,3145978215, 'alt55g@mail.missouri.edu','11:11','4-1-2015','December 18 2016',NULL,NULL, 1,0,0,0,NULL,'undergrad');


CREATE TYPE gradetype AS ENUM ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F');
CREATE TABLE course_want_prof(
course_id integer REFERENCES courses(co_id),
app_id integer REFERENCES applications (app_id),
grade gradetype NOT NULL,
PRIMARY KEY(course_id, app_id),
);

INSERT INTO course_want_prof (4320,2345678, 'A');
INSERT INTO course_want_prof (4520,2345679, 'A');
INSERT INTO course_want_prof (4430,2345679, 'A+');
INSERT INTO course_want_prof (1050,2345680, 'A');
INSERT INTO course_want_prof (2050,2345680, 'B+');



CREATE TYPE taughtorteach AS ENUM ('taught', 'teach')
CREATE TABLE course_teach(
course_id integer REFERENCES courses(co_id),
app_id integer REFERENCES applications (app_id),
taught_teaching taughtorteach NOT NULL,
PRIMARY KEY(course_id, app_id)
);

INSERT INTO course_teach VALUES (4320,2345678,'taught');
INSERT INTO course_teach VALUES (2050,2345680,'teach');

CREATE TABLE comments(
c_id integer --comment, not
stu_id integer REFERENCES students(stu_id),
prof_id integer REFERENCES professor(prof_id),
'comment' text,
time_stamp timestamp NOT NULL,
date_commented date NOT NULL,
rating integer, --Should this reference rating? And if we have rating here, do we even need a separate rating table?
PRIMARY(c_id, student_id, p_id)
);

INSERT INTO comments VALUES (3678243,1632562,1256789,' Great Student','4:30','4-7-2015', 7);
INSERT INTO comments VALUES (3678244,1632565,1256791,"Best TA I've ever had!",'10:17','4-7-2015', 9);

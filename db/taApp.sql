DROP SCHEMA IF EXISTS TaAPP CASCADE;
CREATE SCHEMA TaAPP;
SET search_path = TaAPP;

CREATE TABLE admin(
admin_id integer,
admin_name varchar(60),
password varchar(40),
miz_email varchar(100),
PRIMARY KEY(admin_id)
);

CREATE TABLE professors(
prof_id integer,
prof_name varchar(60),
password varchar(40),
miz_email varchar(100),
PRIMARY KEY(prof_id)
);

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

CREATE TABLE courses(
co_id integer,
prof_id varchar(60) REFERENCES professors(prof_id), 
course_name varchar(60),
PRIMARY KEY(co_id)
);

CREATE TABLE ratings(
prof_id integer REFERENCES professors(prof_id),
stu_id REFERENCES students(stu_id),
co_id integer REFERENCES courses(co_id),
rating integer,
PRIMARY KEY(prof_id, stu_id, co_id)
);

CREATE TABLE applications(
app_id integer,
name varchar(60) REFERENCES students(stu_name),
stu_id integer REFERENCES students(stu_id),
gpa decimal,
phone_num integer,
miz_email REFERENCES students(miz_email),
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
phd_grade_app,
PRIMARY KEY(app_id)
);

CREATE TABLE course_want_prof(
course_id integer REFERENCES courses(co_id),
app_id integer REFERENCES applications (app_id),
grade integer,
PRIMARY KEY(course_id, app_id),
);

CREATE TYPE taughtorteach AS ENUM ('taught', 'teach')
CREATE TABLE course_teach(
course_id integer REFERENCES courses(co_id),
app_id integer REFERENCES applications (app_id),
taught_teaching taughtorteach,
PRIMARY KEY(course_id, app_id)
);

CREATE TABLE comments(
c_id integer --comment, not
stu_id integer REFERENCES students(stu_id),
prof_id integer REFERENCES professor(prof_id),
comment varchar(140),
time_stamp timestamp,
date_commented date,
rating integer,
PRIMARY(c_id, student_id, p_id)
);

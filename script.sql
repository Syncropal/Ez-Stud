CREATE TABLE bscit_sem3_timetable (
    id SERIAL PRIMARY KEY,
    day VARCHAR(10),
    time VARCHAR(20),
    section VARCHAR(20),
    hours VARCHAR(10),
    room VARCHAR(50),
    block VARCHAR(20),
    lecturer VARCHAR(50),
    module_code VARCHAR(20),
    module_title VARCHAR(120),
    class_type VARCHAR(20),
    semester VARCHAR(10),
    course VARCHAR(20)
);

INSERT INTO bscit_sem3_timetable
(day,time,section,hours,room,block,lecturer,module_code,module_title,class_type,semester,course)
VALUES
('SUN','06:30 - 08:00','A10','01:30','Manaslu Lecture Hall','Block C','Pradeep Sapkota','Non Credit','Python for AI/ML','Practical','SEM III','BSC.IT'),

('SUN','09:00 - 10:00','A10','01:00','T05 - Phewa','Block C','Aaraj Bhatarai','Non Credit','Machine Learning Fundamentals','Practical','SEM III','BSC.IT'),

('SUN','10:00 - 11:00','A(10+11+12)','01:00','Sagarmatha Lecture Hall','Block C','Tejila Bajracharya','CT127-3-2','Programming for Data Analysis','Lecture','SEM III','BSC.IT'),

('SUN','11:00 - 12:30','A10','01:30','Makalu Lecture Hall','Block C','Binay Poudel','CT046-3-2','Systems Development Methods','Practical','SEM III','BSC.IT'),

('MON','06:30 - 07:30','A(10+11+12)','01:00','Sagarmatha Lecture Hall','Block C','Binay Poudel','CT046-3-2','Systems Development Methods','Lecture','SEM III','BSC.IT'),

('MON','07:30 - 08:30','A10','01:00','T08 - Rupa','Block C','Ishan Shrestha','CT038-3-2','Object Oriented Development with Java','Tutorial','SEM III','BSC.IT'),

('MON','08:30 - 10:00','A(10+11+12)','01:30','Sagarmatha Lecture Hall','Block C','Bishnu Prasad Khanal','NPLBEF003','Technical Communication','Lecture','SEM III','BSC.IT'),

('MON','11:00 - 12:00','A10','01:00','T02 - IPSpace','Block C','Tejila Bajracharya','CT127-3-2','Programming for Data Analysis','Tutorial','SEM III','BSC.IT'),

('TUE','06:30 - 08:00','A10','01:30','T08 - Rupa','Block C','Madan Adhikari','CT106-3-2','System and Network Administration','Tutorial','SEM III','BSC.IT'),

('TUE','08:00 - 09:00','A10','01:00','T05 - Phewa','Block C','Binay Poudel','CT046-3-2','Systems Development Methods','Tutorial','SEM III','BSC.IT'),

('TUE','09:00 - 10:30','A10','01:30','T01 - AlgoSpace','Block C','Peshal Oli','CT127-3-2','Programming for Data Analysis','Practical','SEM III','BSC.IT'),

('TUE','11:30 - 13:30','A10','02:00','T02 - IPSpace','Block C','Aaraj Bhatarai','Non Credit','Machine Learning Fundamentals','Practical','SEM III','BSC.IT'),

('WED','06:30 - 07:30','A(10+11+12)','01:00','Saipal Lecture Hall','Block C','Madan Adhikari','CT106-3-2','System and Network Administration','Lecture','SEM III','BSC.IT'),

('WED','07:30 - 08:30','A(10+11+12)','01:00','Saipal Lecture Hall','Block C','Ishan Shrestha','CT038-3-2','Object Oriented Development with Java','Lecture','SEM III','BSC.IT'),

('WED','09:00 - 10:30','A10','01:30','T09 - Lhotse','Block C','Sulav Lama','CT104-3-2','Integrated Business Process with ERP SAP System','Practical','SEM III','BSC.IT'),

('WED','11:00 - 12:00','A(10+11+12)','01:00','Manaslu Lecture Hall','Block C','Sunaina Shrestha','BM111-2-2','Innovation Process','Lecture','SEM III','BSC.IT'),

('THU','06:30 - 08:00','A10','01:30','T02 - IPSpace','Block C','Pinke Yadav','CT038-3-2','Object Oriented Development with Java','Practical','SEM III','BSC.IT'),

('THU','08:00 - 09:30','A(10+11+12)','01:30','Manaslu Lecture Hall','Block C','Bishnu Prasad Khanal','NPLBEF003','Technical Communication','Lecture','SEM III','BSC.IT'),

('THU','10:30 - 11:30','A10','01:00','T09 - Lhotse','Block C','Shivaraj Pandey','CT104-3-2','Integrated Business Process with ERP SAP System','Tutorial','SEM III','BSC.IT'),

('FRI','06:30 - 08:00','A10','01:30','Makalu Lecture Hall','Block C','Anuza Poudel','CT106-3-2','System and Network Administration','Practical','SEM III','BSC.IT'),

('FRI','08:00 - 09:00','A(10+11+12)','01:00','Manaslu Lecture Hall','Block C','Sunaina Shrestha','BM111-2-2','Innovation Process','Lecture','SEM III','BSC.IT'),

('FRI','09:30 - 10:30','A(10+11+12)','01:00','Sagarmatha Lecture Hall','Block C','Shivaraj Pandey','CT104-3-2','Integrated Business Process with ERP SAP System','Lecture','SEM III','BSC.IT'),

('FRI','11:00 - 12:30','A10','01:30','T04 - Rara','Block C','Pradeep Sapkota','Non Credit','Python for AI/ML','Practical','SEM III','BSC.IT');


SELECT * FROM bscit_sem3_timetable;

-- Fetching todays routine --
SELECT
    day as Day,
    time as Time,
    module_title Subject,
    room as Class,
    lecturer,
    class_type as ClassType
FROM bscit_sem3_timetable
WHERE
    day = Trim(TO_CHAR(CURRENT_DATE, 'DY'))
ORDER BY
    time;

-- Fetching ongoing class --
SELECT
    day AS Day,
    time AS Time,
    module_title AS Subject,
    room AS Class,
    lecturer,
    class_type AS ClassType
FROM bscit_sem3_timetable
WHERE day = LOWER(TO_CHAR(CURRENT_DATE, 'Dy'))
AND CURRENT_TIME::time BETWEEN
    split_part(time, '-', 1)::time
    AND
    split_part(time, '-', 2)::time;
create database CDBMS;
use CDBMS;
-- student table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    EnrollmentDate DATE,
    DepartmentID INT,
    CourseID INT
    );
    alter table students add constraint foreign key (DepartmentID) REFERENCES Departments(DepartmentID);
    alter table students add constraint foreign KEY (CourseID) REFERENCES Courses(CourseID); 
-- teacher table
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    HireDate DATE,
    DepartmentID INT
);
alter table teachers add constraint FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
-- courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    Credits INT,
    DepartmentID INT,
    TeacherID INT
);
alter table courses add constraint FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
alter table courses add constraint FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID);
-- departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100),
    DepartmentHead INT
    );
alter table departments add constraint FOREIGN KEY (DepartmentHead) REFERENCES Teachers(TeacherID);
-- enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE
);
alter table enrollments add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
alter table enrollments add constraint FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
-- grades table
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    GradeDate DATE
);
alter table Grades add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
alter table Grades add constraint FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
-- classrooms table
CREATE TABLE Classrooms (
    ClassroomID INT PRIMARY KEY AUTO_INCREMENT,
    BuildingName VARCHAR(100),
    RoomNumber VARCHAR(10),
    Capacity INT
);
-- schedules table
CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    ClassroomID INT,
    DayOfWeek VARCHAR(10),
    StartTime TIME,
    EndTime TIME
);
alter table schedules add constraint FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
alter table schedules add constraint FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ClassroomID);
-- attendance table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Date DATE,
    Status VARCHAR(10)
);
  alter table attendance add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
  alter table attendance add constraint FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
-- exam table
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    ExamDate DATE,
    ExamType VARCHAR(50)
);
alter table exam add constraint FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
-- results table
CREATE TABLE Results (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ExamID INT,
    MarksObtained INT,
    ResultDate DATE
);
alter table results add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
alter table results add constraint FOREIGN KEY (ExamID) REFERENCES Exams(ExamID);
-- fees table
CREATE TABLE Fees (
    FeeID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    Amount DECIMAL(10, 2),
    DueDate DATE,
    PaymentDate DATE,
    Status VARCHAR(10)
);
alter table fees add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
-- library table
CREATE TABLE Library (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    Author VARCHAR(100),
    ISBN VARCHAR(20),
    Publisher VARCHAR(100),
    YearPublished YEAR,
    CopiesAvailable INT
);
-- staff table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    HireDate DATE,
    DepartmentID INT
);
alter table staff add constraint FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
-- event table
CREATE TABLE Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(100),
    EventDate DATE,
    Location VARCHAR(255),
    Description TEXT
);
-- alumni table
CREATE TABLE Alumni (
    AlumniID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    GraduationYear YEAR,
    CurrentJob VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);
-- hostel table
CREATE TABLE Hostel (
    HostelID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    RoomNumber VARCHAR(10),
    CheckInDate DATE,
    CheckOutDate DATE
);
 alter table hostel add constraint foreign key  (StudentID) REFERENCES Students(StudentID);
-- transport table
CREATE TABLE Transport (
    TransportID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    Route VARCHAR(100),
    PickupPoint VARCHAR(100),
    DropPoint VARCHAR(100)
);
alter table transport add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
-- noties table
CREATE TABLE Notices (
    NoticeID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Description TEXT,
    Date DATE
);
-- userAccounts table
CREATE TABLE UserAccounts (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50),
    Password VARCHAR(255),
    Role VARCHAR(20)
);
-- assignments table
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    Title VARCHAR(100),
    Description TEXT,
    DueDate DATE,
    SubmissionDate DATE
);
alter table assignments add constraint FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
-- subject table
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY AUTO_INCREMENT,
    SubjectName VARCHAR(100),
    CourseID INT
);
alter table subjects add constraint foreign key (CourseID) REFERENCES Courses(CourseID);
-- timetable table
CREATE TABLE Timetable (
    TimetableID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    SubjectID INT,
    DayOfWeek VARCHAR(10),
    StartTime TIME,
    EndTime TIME,
    ClassroomID INT
);
alter table timetable add constraint FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
alter table timetable add constraint FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID);
alter table timetable add constraint FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ClassroomID);
-- examSchedules table
CREATE TABLE ExamSchedules (
    ExamScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    ExamID INT,
    SubjectID INT,
    ExamDate DATE,
    StartTime TIME,
    EndTime TIME,
    ClassroomID INT
);
alter table examSchedules add constraint FOREIGN KEY (ExamID) REFERENCES Exams(ExamID);
alter table examSchedules add constraint FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID);
alter table examSchedules add constraint FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ClassroomID);
-- clubs table
CREATE TABLE Clubs (
    ClubID INT PRIMARY KEY AUTO_INCREMENT,
    ClubName VARCHAR(100),
    ClubDescription TEXT,
    PresidentID INT
);
alter table clubs add constraint FOREIGN KEY (PresidentID) REFERENCES Students(StudentID);
-- clubMembers table
CREATE TABLE ClubMembers (
    ClubMemberID INT PRIMARY KEY AUTO_INCREMENT,
    ClubID INT,
    StudentID INT,
    JoinDate DATE
);
alter table clubMembers add constraint FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID);
alter table clubMembers add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
-- scholarships table
CREATE TABLE Scholarships (
    ScholarshipID INT PRIMARY KEY AUTO_INCREMENT,
    ScholarshipName VARCHAR(100),
    Amount DECIMAL(10, 2),
    EligibilityCriteria TEXT
);
-- scholarshipApplication table
CREATE TABLE ScholarshipApplications (
    ApplicationID INT PRIMARY KEY AUTO_INCREMENT,
    ScholarshipID INT,
    StudentID INT,
    ApplicationDate DATE,
    Status VARCHAR(20)
);
alter table scholarshipApplications add constraint FOREIGN KEY (ScholarshipID) REFERENCES Scholarships(ScholarshipID);
alter table scholarshipApplications add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
-- libraryTransaction table
CREATE TABLE LibraryTransactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    StudentID INT,
    IssueDate DATE,
    ReturnDate DATE
);
alter table libraryTransactions add constraint FOREIGN KEY (BookID) REFERENCES Library(BookID);
alter table libraryTransactions add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
-- feedback table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    TeacherID INT,
    CourseID INT,
    FeedbackText TEXT,
    FeedbackDate DATE
);
alter table feedback add constraint FOREIGN KEY (StudentID) REFERENCES Students(StudentID);
alter table feedback add constraint FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID);
alter table feedback add constraint FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
-- Insert data into Students table
INSERT INTO Students (FirstName, LastName, DOB, Gender, Address, PhoneNumber, Email, EnrollmentDate, DepartmentID, CourseID)
VALUES 
    ('Suresh', 'Kumar', '1998-03-15', 'Male', '123 Main Street, Chennai', '9876543210', 'suresh.kumar@example.com', '2020-09-01', 1, 101),
    ('Priya', 'Devi', '1999-05-20', 'Female', '456 Park Avenue, Bangalore', '8765432109', 'priya.devi@example.com', '2019-08-15', 2, 102),
    ('Ganesh', 'Nair', '1997-11-10', 'Male', '789 Church Road, Hyderabad', '7654321098', 'ganesh.nair@example.com', '2021-01-10', 1, 103);

-- Insert data into Teachers table
INSERT INTO Teachers (FirstName, LastName, DOB, Gender, Address, PhoneNumber, Email, HireDate, DepartmentID)
VALUES 
    ('Meera', 'Menon', '1980-02-25', 'Female', '234 Lakeview Street, Chennai', '9876541230', 'meera.menon@example.com', '2010-07-15', 1),
    ('Rajesh', 'Iyer', '1975-09-12', 'Male', '567 Hill Road, Bangalore', '8765430123', 'rajesh.iyer@example.com', '2005-03-20', 2);

-- Insert data into Courses table
INSERT INTO Courses (CourseName, CourseDescription, Credits, DepartmentID, TeacherID)
VALUES 
    ('History of South India', 'Exploration of the rich cultural and historical heritage of South India.', 3, 1, 1),
    ('Carnatic Music Theory', 'Fundamentals and theory of Carnatic music.', 2, 2, 2),
    ('South Indian Cuisine', 'Practical and theoretical study of traditional South Indian culinary arts.', 3, 1, 1);

-- Insert data into Departments table
INSERT INTO Departments (DepartmentName, DepartmentHead)
VALUES 
    ('History and Culture', 1),
    ('Fine Arts', 2);

-- Insert data into Enrollments table
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES 
    (1, 101, '2020-09-01'),
    (2, 102, '2019-08-15'),
    (3, 103, '2021-01-10');

-- Insert data into Grades table
INSERT INTO Grades (StudentID, CourseID, Grade, GradeDate)
VALUES 
    (1, 101, 'A', '2021-05-20'),
    (2, 102, 'B+', '2021-05-22'),
    (3, 103, 'A-', '2021-05-25');

-- Insert data into Classrooms table
INSERT INTO Classrooms (BuildingName, RoomNumber, Capacity)
VALUES 
    ('Main Building', '101', 50),
    ('Arts Block', '201', 30);

-- Insert data into Schedules table
INSERT INTO Schedules (CourseID, ClassroomID, DayOfWeek, StartTime, EndTime)
VALUES 
    (101, 1, 'Monday', '09:00:00', '11:00:00'),
    (102, 2, 'Wednesday', '10:00:00', '12:00:00'),
    (103, 1, 'Friday', '13:00:00', '15:00:00');

-- Insert data into Attendance table
INSERT INTO Attendance (StudentID, CourseID, Date, Status)
VALUES 
    (1, 101, '2021-06-01', 'Present'),
    (2, 102, '2021-06-02', 'Present'),
    (3, 103, '2021-06-03', 'Present');

-- Insert data into Exams table
INSERT INTO Exams (CourseID, ExamDate, ExamType)
VALUES 
    (101, '2021-07-15', 'Final'),
    (102, '2021-07-20', 'Final'),
    (103, '2021-07-25', 'Final');

-- Insert data into Results table
INSERT INTO Results (StudentID, ExamID, MarksObtained, ResultDate)
VALUES 
    (1, 1, 85, '2021-07-20'),
    (2, 2, 78, '2021-07-22'),
    (3, 3, 92, '2021-07-27');

-- Insert data into Fees table
INSERT INTO Fees (StudentID, Amount, DueDate, PaymentDate, Status)
VALUES 
    (1, 5000.00, '2021-09-01', '2021-08-25', 'Paid'),
    (2, 5000.00, '2021-09-01', NULL, 'Pending'),
    (3, 5000.00, '2021-09-01', '2021-08-30', 'Paid');

-- Insert data into Library table
INSERT INTO Library (Title, Author, ISBN, Publisher, YearPublished, CopiesAvailable)
VALUES 
    ('History of South India', 'R. K. Narayan', '978-0140102376', 'Penguin Books', 1981, 5),
    ('The Art of South Indian Cooking', 'S. Meenakshi Ammal', '978-8129144939', 'Rupa Publications', 2016, 10),
    ('Introduction to Carnatic Music', 'B. S. Ramakrishna', '978-8186982704', 'Motilal Banarsidass', 2002, 3);

-- Insert data into Staff table
INSERT INTO Staff (FirstName, LastName, DOB, Gender, Address, PhoneNumber, Email, HireDate, DepartmentID)
VALUES 
    ('Anand', 'Menon', '1985-04-10', 'Male', '789 Lake Road, Chennai', '9876544321', 'anand.menon@example.com', '2012-03-01', 1),
    ('Sita', 'Iyer', '1988-06-18', 'Female', '234 Hill Street, Bangalore', '8765432108', 'sita.iyer@example.com', '2014-05-15', 2);

-- Insert data into Events table
INSERT INTO Events (EventName, EventDate, Location, Description)
VALUES 
    ('South Indian Cultural Festival', '2021-08-15', 'College Auditorium', 'Celebration of South Indian music, dance, and cuisine.'),
    ('Alumni Meet', '2021-09-20', 'Alumni Hall', 'Annual gathering of college alumni.');

-- Insert data into Alumni table
INSERT INTO Alumni (FirstName, LastName, GraduationYear, CurrentJob, Email, PhoneNumber)
VALUES 
    ('Shankar', 'Rao', 2010, 'Software Engineer', 'shankar.rao@example.com', '9876543210'),
    ('Lakshmi', 'Menon', 2005, 'Marketing Manager', 'lakshmi.menon@example.com', '8765432109');

-- Insert data into Hostel table
INSERT INTO Hostel (StudentID, RoomNumber, CheckInDate, CheckOutDate)
VALUES 
    (1, '101A', '2020-08-15', NULL),
    (2, '102B', '2019-07-20', '2021-06-30'),
    (3, '103A', '2020-09-01', NULL);

-- Insert data into Transport table
INSERT INTO Transport (StudentID, Route, PickupPoint, DropPoint)
VALUES 
    (1, 'Route 1', 'Main Gate', 'Campus Center'),
    (2, 'Route 2', 'Park Avenue', 'Library'),
    (3, 'Route 3', 'Church Road', 'Arts Block');

-- Insert data into Notices table
INSERT INTO Notices (Title, Description, Date)
VALUES 
    ('Holiday Notice', 'College will remain closed on 2021-09-02 due to public holiday.', '2021-08-30'),
    ('Exam Schedule', 'Final exam schedule for July 2021 released. Check your courses for details.', '2021-06-15');

-- Insert data into UserAccounts table
INSERT INTO UserAccounts (Username, Password, Role)
VALUES 
    ('suresh_kumar', 'password123', 'Student'),
    ('meera_menon', 'securepass', 'Teacher'),
    ('admin', 'adminpass', 'Admin');

-- Insert data into Assignments table
INSERT INTO Assignments (CourseID, Title, Description, DueDate, SubmissionDate)
VALUES 
    (101, 'History Essay', 'Write a 1500-word essay on the impact of Chola dynasty on South Indian history.', '2021-08-31', '2021-09-01'),
    (102, 'Music Composition', 'Compose a 5-minute Carnatic music piece based on Ragam Kalyani.', '2021-08-30', '2021-09-02');

-- Insert data into Subjects table
INSERT INTO Subjects (SubjectName, CourseID)
VALUES 
    ('South Indian History', 101),
    ('Carnatic Music Basics', 102),
    ('South Indian Cuisine', 103);

-- Insert data into Timetable table
INSERT INTO Timetable (CourseID, SubjectID, DayOfWeek, StartTime, EndTime, ClassroomID)
VALUES 
    (101, 1, 'Monday', '09:00:00', '11:00:00', 1),
    (102, 2, 'Wednesday', '10:00:00', '12:00:00', 2),
    (103, 3, 'Friday', '13:00:00', '15:00:00', 1);

-- Insert data into ExamSchedules table
INSERT INTO ExamSchedules (ExamID, SubjectID, ExamDate, StartTime, EndTime, ClassroomID)
VALUES 
    (1, 1, '2021-07-15', '09:00:00', '11:00:00', 1),
    (2, 2, '2021-07-20', '10:00:00', '12:00:00', 2),
    (3, 3, '2021-07-25', '13:00:00', '15:00:00', 1);

-- Insert data into Clubs table
INSERT INTO Clubs (ClubName, ClubDescription, PresidentID)
VALUES 
    ('South Indian Music Club', 'Promotes and preserves the tradition of South Indian music.', 1),
    ('Culinary Arts Club', 'Explores and celebrates South Indian culinary arts.', 2);

-- Insert data into ClubMembers table
INSERT INTO ClubMembers (ClubID, StudentID, JoinDate)
VALUES 
    (1, 1, '2020-10-01'),
    (2, 2, '2019-09-01');

-- Insert data into Scholarships table
INSERT INTO Scholarships (ScholarshipName, Amount, EligibilityCriteria)
VALUES 
    ('Merit Scholarship', 10000.00, 'Awarded based on academic performance.'),
    ('Cultural Excellence Scholarship', 8000.00, 'Awarded to students excelling in cultural activities.');

-- Insert data into ScholarshipApplications table
INSERT INTO ScholarshipApplications (ScholarshipID, StudentID, ApplicationDate, Status)
VALUES 
    (1, 1, '2021-06-01', 'Pending'),
    (2, 2, '2021-06-02', 'Approved');

-- Insert data into LibraryTransactions table
INSERT INTO LibraryTransactions (BookID, StudentID, IssueDate, ReturnDate)
VALUES 
    (1, 1, '2021-06-05', '2021-06-20'),
    (2, 2, '2021-06-07', '2021-06-14');

-- Insert data into Feedback table
INSERT INTO Feedback (StudentID, TeacherID, CourseID, FeedbackText, FeedbackDate)
VALUES 
    (1, 1, 101, 'Great teacher, very knowledgeable about South Indian history.', '2021-06-02'),
    (2, 2, 102, 'Enjoyed learning Carnatic music theory, very well-explained.', '2021-06-03');

insert into hostel (studentID,roomnumber,checkindate,checkoutdate) values (1,"301",current_date(),current_date());

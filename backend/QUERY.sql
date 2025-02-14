CREATE DATABASE SMS_FINAL;

USE SMS_FINAL;


CREATE TABLE APARTMENT_OWNER ( OWNER_CONTACT CHAR(10) PRIMARY KEY , OWNER_NAME VARCHAR(35) ) ;

CREATE TABLE APARTMENT( APARTMENT_ID CHAR(9) PRIMARY KEY , NAME VARCHAR(35) , OWNER_CONTACT CHAR(10), FOREIGN KEY (OWNER_CONTACT) REFERENCES APARTMENT_OWNER ( OWNER_CONTACT) );

CREATE TABLE AVAILABLE_ROOMS ( BHK INT , AVAILABLE_ROOMS INT , APARTMENT_ID CHAR(9) , FOREIGN KEY (APARTMENT_ID) REFERENCES APARTMENT (APARTMENT_ID) , PRIMARY KEY ( BHK , APARTMENT_ID) );

CREATE TABLE RESIDENTS ( REGISTRATION_ID CHAR(9) PRIMARY KEY , PASSWORD VARCHAR(35) , AADHAR_NO CHAR(12) UNIQUE , CONTACT CHAR(10) , NAME VARCHAR(35) , APARTMENT_ID CHAR(9) , ROOM_NO CHAR(4) , FOREIGN KEY ( APARTMENT_ID) REFERENCES APARTMENT (APARTMENT_ID) ) ;

CREATE TABLE RESIDENTS_DOJ ( ROOM_NO CHAR(4) , APARTMENT_ID CHAR(9) , DOJ DATE ,FOREIGN KEY ( APARTMENT_ID) REFERENCES APARTMENT (APARTMENT_ID) , PRIMARY KEY ( ROOM_NO , APARTMENT_ID) );

CREATE TABLE EVENTS ( EVENT_ID CHAR(9) PRIMARY KEY , NAME VARCHAR(35) , BUDGET INT , START_DATE DATETIME , END_DATE DATETIME , LOCATION VARCHAR(35) );

CREATE TABLE VISITORS ( VISITOR_ID CHAR(9) PRIMARY KEY , REGISTRATION_ID CHAR(9) , NAME VARCHAR(35) , CONTACT CHAR(10) , DOV DATETIME , DOL DATETIME , FOREIGN KEY (REGISTRATION_ID) REFERENCES RESIDENTS( REGISTRATION_ID) );

CREATE TABLE STAFF ( STAFF_ID CHAR(9) PRIMARY KEY , NAME VARCHAR(35) , SALARY INT, CONTACT CHAR(10));

CREATE TABLE STAFF_WORKS ( START_TIME TIME , END_TIME TIME , APARTMENT_ID CHAR(9) ,STAFF_ID CHAR(9) , FOREIGN KEY  ( APARTMENT_ID) REFERENCES APARTMENT (APARTMENT_ID) , FOREIGN KEY ( STAFF_ID) REFERENCES STAFF ( STAFF_ID) , PRIMARY KEY ( START_TIME , APARTMENT_ID , STAFF_ID) );

CREATE TABLE RESIDENT_CONDUCTS (EVENT_ID CHAR(9) , REGISTRATION_ID CHAR(9) , FOREIGN KEY (REGISTRATION_ID) REFERENCES RESIDENTS( REGISTRATION_ID) , FOREIGN KEY (EVENT_ID) REFERENCES EVENTS( EVENT_ID) , PRIMARY KEY ( EVENT_ID , REGISTRATION_ID) );

CREATE TABLE ROLE ( POST VARCHAR(35) PRIMARY KEY , REGISTRATION_ID CHAR(9) , FOREIGN KEY (REGISTRATION_ID) REFERENCES RESIDENTS( REGISTRATION_ID) );



INSERT INTO APARTMENT_OWNER VALUES
("8247713041" , "Gopi Nath"),
("8555910817" , "Sashidhar Reddy"),
("9893497541" , "Vijay Malviya");



INSERT INTO APARTMENT VALUES
("MWAPCV123", "CITY VIEW" , "8247713041"),
("MWAPSW123", "SKY WAY" , "9893497541"),
("MWAPPP123", "PARK PALACE" , "8555910817");



INSERT INTO AVAILABLE_ROOMS VALUES
(2, 34 , "MWAPCV123" ),
(3 , 16 , "MWAPCV123"),
(4 , 31 , "MWAPCV123"),
(2 , 18 , "MWAPSW123"),
(3 , 11 , "MWAPSW123"),
(4 , 29 , "MWAPSW123"),
(2 , 12 , "MWAPPP123"),
(3 , 56 , "MWAPPP123"),
(4 , 13 , "MWAPPP123");



INSERT INTO STAFF VALUES
("MINIWLD01" , "MUKESH KUMAR" , 20000 , "9827654541"),
("MINIWLD02" , "VARUN PATEL" , 17500 , "8529694532"),
("MINIWLD03" , "DEEPAK KUMAR" , 18000 , "7827774181"),
("MINIWLD04" , "RAJU SHARMA" , 15000 , "9997659998"),
("MINIWLD05" , "RAMESH KUMAR" , 16000 , "9866654540"),
("MINIWLD06" , "PAPPU SOLANKI" , 10000 , "8327699522"),
("MINIWLD07" , "SHWETA SAXENA" , 12000 , "7727654577"),
("MINIWLD08" , "NIDHI KUMARI" , 12000 , "6267694886"),
("MINIWLD09" , "ANSH PATEL" , 17500 , "6827000541"),
("MINIWLD10" , "ARIN INGLE" , 10500 , "9479515253"),
("MINIWLD11" , "CHIRAG SHAH " , 19000 , "9100604990"),
("MINIWLD12" , "MOHSIN  KHAN" , 15000 , "9226654441"),
("MINIWLD13" , "MURTAZA AZAM " , 17000 , "9144654883"),
("MINIWLD14" , "MEENA DEVI" , 16000 , "9720694000"),
("MINIWLD15" , " SHRUTI KUMARI" , 15000 , "9827666647");



INSERT INTO STAFF_WORKS VALUES
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD01" ),
("11:30:00" , "14:00:00" , "MWAPPP123" , "MINIWLD01" ),
("18:00:00" , "19:30:00" , "MWAPSW123" , "MINIWLD01" ),
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD02" ),
("11:30:00" , "14:30:00" , "MWAPSW123" , "MINIWLD02" ),
("18:30:00" , "19:30:00" , "MWAPPP123" , "MINIWLD02" ),
("07:30:00" , "09:30:00" , "MWAPSW123" , "MINIWLD03" ),
("07:30:00" , "09:30:00" , "MWAPPP123" , "MINIWLD04" ),
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD05" ),
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD06" ),
("07:30:00" , "09:30:00" , "MWAPPP123" , "MINIWLD07" ),
("07:30:00" , "09:30:00" , "MWAPSW123" , "MINIWLD08" ),
("07:30:00" , "09:30:00" , "MWAPSW123" , "MINIWLD09" ),
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD10" ),
("07:30:00" , "09:30:00" , "MWAPPP123" , "MINIWLD11" ),
("11:30:00" , "14:00:00" , "MWAPCV123" , "MINIWLD12" ),
("11:30:00" , "14:00:00" , "MWAPPP123" , "MINIWLD13" ),
("11:30:00" , "14:30:00" , "MWAPSW123" , "MINIWLD14" ),
("11:30:00" , "14:30:00" , "MWAPSW123" , "MINIWLD15" ),
("11:30:00" , "14:30:00" , "MWAPCV123" , "MINIWLD04" ),
("11:30:00" , "14:30:00" , "MWAPSW123" , "MINIWLD05" ),
("11:30:00" , "14:30:00" , "MWAPCV123" , "MINIWLD06" ),
("11:30:00" , "14:30:00" , "MWAPCV123" , "MINIWLD07" ),
("11:30:00" , "14:30:00" , "MWAPPP123" , "MINIWLD08" ),
("18:30:00" , "19:30:00" , "MWAPSW123" , "MINIWLD12" ),
("18:30:00" , "19:30:00" , "MWAPSW123" , "MINIWLD13" ),
("18:30:00" , "19:30:00" , "MWAPCV123" , "MINIWLD11" ),
("18:30:00" , "19:30:00" , "MWAPPP123" , "MINIWLD05" ),
("18:30:00" , "19:30:00" , "MWAPSW123" , "MINIWLD14" ),
("18:30:00" , "19:30:00" , "MWAPCV123" , "MINIWLD15" ),
("18:30:00" , "19:30:00" , "MWAPCV123" , "MINIWLD10" ),
("18:30:00" , "19:30:00" , "MWAPSW123" , "MINIWLD04" ),
("18:30:00" , "19:30:00" , "MWAPPP123" , "MINIWLD03" );



INSERT INTO RESIDENTS (REGISTRATION_ID, PASSWORD, AADHAR_NO, CONTACT, NAME, APARTMENT_ID, ROOM_NO) VALUES
('202211001', 'password1', '123456789012', '9876543210', 'AJAY DEEP', 'MWAPCV123', '2009'),
('202211002', 'password2', '123456789013', '9876543211', 'ANINDA PAUL', 'MWAPCV123', '2003'),
('202211003', 'password3', '123456789014', '9876543212', 'ANKIT GAUTAM', 'MWAPSW123', '2007'),
('202211005', 'password4', '123456789015', '9876543213', 'ARPITA', 'MWAPSW123', '3001'),
('202211006', 'password5', '123456789016', '9876543214', 'AYUSH GANGWAR', 'MWAPPP123', '1099'),
('202211007', 'password6', '123456789017', '9876543215', 'AYUSH GUPTA', 'MWAPPP123', '2006'),
('202211008', 'password7', '123456789018', '9876543216', 'AYUSH KUMAR', 'MWAPCV123', '3005'),
('202211009', 'password8', '123456789019', '9876543217', 'BADAVATH ARJUN', 'MWAPCV123', '3001'),
('202211010', 'password9', '123456789020', '9876543218', 'BATTU UJWAL REDDY', 'MWAPSW123', '1072'),
('202211011', 'password10', '123456789021', '9876543219', 'BHALODIA DHRUV AJAYKUMAR', 'MWAPSW123', '3003'),
('202211012', 'password11', '123456789022', '9876543220', 'BHARGAV GUGULOTHU', 'MWAPPP123', '2018'),
('202211013', 'password12', '123456789023', '9876543221', 'CHINCHKAR SNEHA ACHYUT', 'MWAPPP123', '2019'),
('202211014', 'password13', '123456789024', '9876543222', 'CHIRAG SINGH RATHORE', 'MWAPCV123', '2008'),
('202211015', 'password14', '123456789025', '9876543223', 'CHITRANSH KUMAR', 'MWAPCV123', '1095'),
('202211016', 'password15', '123456789026', '9876543224', 'DEEWAKAR GOUD', 'MWAPSW123', '2020'),
('202211017', 'password16', '123456789027', '9876543225', 'DEV ANANT PUSHKAR', 'MWAPSW123', '1018'),
('202211018', 'password17', '123456789028', '9876543226', 'DEVRIKH JATAV', 'MWAPPP123', '1018'),
('202211019', 'password18', '123456789029', '9876543227', 'DHARM SINGH DAGAR', 'MWAPPP123', '2022'),
('202211020', 'password19', '123456789030', '9876543228', 'DINESH', 'MWAPCV123', '1016'),
('202211021', 'password20', '123456789031', '9876543229', 'DIYA BHATI', 'MWAPCV123', '2012'),
('202211022', 'password21', '123456789032', '9876543230', 'ERRAMSHETTI ABHILASH', 'MWAPSW123', '2012'),
('202211023', 'password22', '123456789033', '9876543231', 'GAGANPREET SINGH', 'MWAPSW123', '2011'),
('202211027', 'password23', '123456789034', '9876543232', 'HARSHIT SONI', 'MWAPPP123', '2004'),
('202211028', 'password24', '123456789035', '9876543233', 'HIRPARA DAIVIK BHARATBHAI', 'MWAPPP123', '1001'),
('202211029', 'password25', '123456789036', '9876543234', 'HRIDYANSH SHARMA', 'MWAPCV123', '2005'),
('202211030', 'password26', '123456789037', '9876543235', 'INARAT HUSSAIN', 'MWAPCV123', '1075'),
('202211031', 'password27', '123456789038', '9876543236', 'ISHA JANGIR', 'MWAPSW123', '2010'),
('202211032', 'password28', '123456789039', '9876543237', 'JAISWAL JAIDEEP ANANDKUMAR', 'MWAPSW123', '1016'),
('202211033', 'password29', '123456789040', '9876543238', 'JIKADARA FENIL PRAVINBHAI', 'MWAPPP123', '1093'),
('202211034', 'password30', '123456789041', '9876543239', 'JOSHI URVISH RAJESHKUMAR', 'MWAPPP123', '1097'),
('202211036', 'password31', '123456789042', '9876543240', 'KAMAL MEENA', 'MWAPCV123', '1077'),
('202211038', 'password32', '123456789043', '9876543241', 'KARTIK CHUGH', 'MWAPCV123', '1077'),
('202211039', 'password33', '123456789044', '9876543242', 'KENDRE VITTHAL VASUDEV', 'MWAPSW123', '1085'),
('202211040', 'password34', '123456789045', '9876543243', 'KOCHERLA VENKATA JAYANTH', 'MWAPSW123', '1085'),
('202211041', 'password35', '123456789046', '9876543244', 'KUMAR SHANTANU', 'MWAPPP123', '2003'),
('202211042', 'password36', '123456789047', '9876543245', 'KUSHAGRA TANEJA', 'MWAPPP123', '3003'),
('202211043', 'password37', '123456789048', '9876543246', 'LAKSHAY DHIMAN', 'MWAPCV123', '2005'),
('202211044', 'password38', '123456789049', '9876543247', 'LAVUDYA SAI KEERTHANA', 'MWAPCV123', '3009'),
('202211045', 'password39', '123456789050', '9876543248', 'MAGANTI RAMESH', 'MWAPSW123', '2020'),
('202211046', 'password40', '123456789051', '9876543249', 'MAKWANA SHREYAS HEMALBHAI', 'MWAPSW123', '2019'),
('202211047', 'password41', '123456789052', '9876543250', 'MANI M KULKARNI', 'MWAPPP123', '1016'),
('202211048', 'password42', '123456789053', '9876543251', 'MD GANIM', 'MWAPPP123', '3007'),
('202211049', 'password43', '123456789054', '9876543252', 'MEHTA DAKSH HITESH', 'MWAPCV123', '1017'),
('202211050', 'password44', '123456789055', '9876543253', 'METTU MANIKANTA', 'MWAPCV123', '1017'),
('202211051', 'password45', '123456789056', '9876543254', 'MISHRA ANUJ HARIKESHNARAYAN', 'MWAPSW123', '1015'),
('202211053', 'password46', '123456789057', '9876543255', 'MOKSH ARORA', 'MWAPSW123', '1015'),
('202211054', 'password47', '123456789058', '9876543256', 'MUTYAM SAI VARSHINI VARMA', 'MWAPPP123', '3005'),
('202211055', 'password48', '123456789059', '9876543257', 'NAVEEN', 'MWAPPP123', '1101'),
('202211056', 'password49', '123456789060', '9876543258', 'NENAVATH SIDDHU NAYAK', 'MWAPCV123', '1091'),
('202211057', 'password50', '123456789061', '9876543259', 'NIMBALKAR SIDDHARTH MANOJ', 'MWAPCV123', '2010'),
('202211058', 'password51', '123456789062', '9876543260', 'NITESH PARIHAR', 'MWAPSW123', '1019'),
('202211059', 'password52', '123456789063', '9876543261', 'NITIN KUMAR', 'MWAPSW123', '3009'),
('202211060', 'password53', '123456789064', '9876543262', 'OMNI MANWANI', 'MWAPPP123', '1072'),
('202211061', 'password54', '123456789065', '9876543263', 'PAKHALE TEJAS NITIN', 'MWAPPP123', '1019'),
('202211062', 'password55', '123456789066', '9876543264', 'PALAPALA SASIDHAR REDDY', 'MWAPCV123', '2011'),
('202211063', 'password56', '123456789067', '9876543265', 'PANDEY ANAYKUMAR VINODKUMAR', 'MWAPCV123', '1097'),
('202211064', 'password57', '123456789068', '9876543266', 'PANKAJ KUMAR', 'MWAPSW123', '1101'),
('202211065', 'password58', '123456789069', '9876543267', 'PARSANIA HERRY MANHARBHAI', 'MWAPSW123', '2013'),
('202211066', 'password59', '123456789070', '9876543268', 'PATEL TRIJAY', 'MWAPPP123', '2006'),
('202211067', 'password60', '123456789071', '9876543269', 'PATEL VARSHET SHRIKAR', 'MWAPPP123', '2013'),
('202211068', 'password61', '123456789072', '9876543270', 'PRAGYA PRANATI', 'MWAPCV123', '3009'),
('202211069', 'password62', '123456789073', '9876543271', 'RAHUL GUPTA', 'MWAPCV123', '2015'),
('202211070', 'password63', '123456789074', '9876543272', 'RAJAT KUMAR THAKUR', 'MWAPSW123', '2009'),
('202211071', 'password64', '123456789075', '9876543273', 'RAJGURU SANIKA AJAY', 'MWAPSW123', '2014'),
('202211072', 'password65', '123456789076', '9876543274', 'RAMAVATH RAMCHARAN SINGH', 'MWAPPP123', '1001'),
('202211074', 'password66', '123456789077', '9876543275', 'RITIKA', 'MWAPPP123', '2021'),
('202211075', 'password67', '123456789078', '9876543276', 'RITURAJ KUMAR', 'MWAPCV123', '2008'),
('202211076', 'password68', '123456789079', '9876543277', 'SALONI SUMUKH SHEVDE', 'MWAPCV123', '2015'),
('202211077', 'password69', '123456789080', '9876543278', 'SANSKAR KOSERWAL', 'MWAPSW123', '1075'),
('202211078', 'password70', '123456789081', '9876543279', 'SAURABH', 'MWAPSW123', '2014'),
('202211080', 'password71', '123456789082', '9876543280', 'SHREYA MANYAM', 'MWAPPP123', '2022'),
('202211081', 'password72', '123456789083', '9876543281', 'SHREYAS LADHE', 'MWAPPP123', '2018'),
('202211083', 'password73', '123456789084', '9876543282', 'SIVA NAGA GOPINADH JALLIPALLI', 'MWAPCV123', '2004'),
('202211084', 'password74', '123456789085', '9876543283', 'SRIJAN SHARMA', 'MWAPCV123', '2019'),
('202211085', 'password75', '123456789086', '9876543284', 'SRUJAL DEEPAK PAWAR', 'MWAPSW123', '2024'),
('202211086', 'password76', '123456789087', '9876543285', 'SUDEEP KUMAR', 'MWAPSW123', '2017'),
('202211087', 'password77', '123456789088', '9876543286', 'SUDHIR NISHAD', 'MWAPPP123', '1099'),
('202211088', 'password78', '123456789089', '9876543287', 'SUJAL SURENDRA CHAUHAN', 'MWAPPP123', '3007'),
('202211089', 'password79', '123456789090', '9876543288', 'SUMEDHA BAGHMAR', 'MWAPCV123', '2019'),
('202211090', 'password80', '123456789091', '9876543289', 'SURAJ HUDDA', 'MWAPCV123', '1095'),
('202211091', 'password81', '123456789092', '9876543290', 'SURAJ KUMAR', 'MWAPSW123', '2021'),
('202211092', 'password82', '123456789093', '9876543291', 'SURAJ KUMAR', 'MWAPSW123', ''),
('202211093', 'password83', '123456789094', '9876543292', 'SURYANSH SINGH RAGHUVANSH', 'MWAPPP123', '1099'),
('202211094', 'password84', '123456789095', '9876543293', 'TANAY PATEL', 'MWAPPP123', '2018'),
('202211095', 'password85', '123456789096', '9876543294', 'TUNDIYA ABHI PARESHBHAI', 'MWAPCV123', '2019'),
('202211096', 'password86', '123456789097', '9876543295', 'VED PRAKASH MEENA', 'MWAPCV123', '2015'),
('202211097', 'password87', '123456789098', '9876543296', 'VIBHANSH GOEL', 'MWAPSW123', '1015'),
('202211098', 'password88', '123456789099', '9876543297', 'YUVRAJ CHAUHAN', 'MWAPSW123', '2020'),
('202211099', 'password89', '123456789100', '9876543298', 'ANSHUL SALVI', 'MWAPPP123', '1099'),
('202111088', 'password90', '123456789101', '9876543299', 'VIJAY MALVIYA', 'MWAPPP123', '3003');


INSERT INTO VISITORS VALUES 
("000000001" , "202211034", "KRATIKA SHARMA" , "8989615333" , "2023/04/27 13:00:00" , "2023/04/29 20:00:00" ),
("000000003" , "202211039", "MANISH AGARWAL" , "9899615299" , "2023/04/29 13:00:00" , "2023/05/03 20:00:00" ),
("000000004" , "202211039", "NEETA AGARWAL" , "8977715377" , "2023/04/29 13:00:00" , "2023/05/03 20:00:00" ),
("000000002" , "202211034", "MAYANK SHARMA" , "7771615332" , "2023/04/27 13:00:00" , "2023/04/29 20:00:00" ),
("000000005" , "202211010", "PRAKASH DUBEY" , "8989615991" , "2023/04/28 15:50:00" , "2023/05/06 09:30:00" ),
("000000006" , "202211055", "SATYANSH KUMAR" , "8779666991" , "2023/05/04 11:40:00" , "2023/05/06 19:30:00" ),
("000000007" , "202211010", "PRAKASH DUBEY" , "8989615991" , "2023/04/05 15:50:00" , "2023/05/06 09:30:00" ),
("000000008" , "202211032", "PRASHANT GARG" , "8989121234" , "2023/04/07 17:45:00" , "2023/05/09 09:20:00" ),
("000000009" , "202211087", "DARSHAN GUPTA" , "7789885772" , "2023/04/08 16:45:00" , "2023/05/09 15:30:00" );


INSERT INTO ROLE VALUES 
("SECRETARY" , "202211005"),
("JOINT SECRETARY" , "202211080" ),
("TREASURER" , "202211027" );


ALTER TABLE EVENTS ADD COLUMN EVENT_DESCRIPTION VARCHAR(1500) ;

INSERT INTO EVENTS VALUES
("MWEVENT01" , "NEW YEAR PARTY" , 2000000 , "2022/12/31 22:00:00" , "2023/01/01 01:00:00" , "MW EVE PARK" , "Miniworld Society welcomed the new year with great excitement and joy as they celebrated the New Year's Eve party on December 31st, 2022.
The party started in the evening and the members of the society were dressed in their best attire. The event had a lively and cheerful atmosphere with decorations, balloons, and lights adding to the festive vibe.
The party was filled with a variety of fun-filled activities, including games, music, and dancing. The society members organized various games and activities that kept everyone engaged and entertained throughout the night. The DJ played a variety of music, including the latest hits and old classics, which kept the guests dancing and grooving to the beats." ),
("MWEVENT02" , "REPUBLIC DAY" , 800000 , "2023/01/26 08:00:00" , "2023/01/01 11:00:00" , "MW EVE HALL" , "Miniworld Society celebrated the 74th Republic Day of India with great enthusiasm and patriotic fervor. The event was held on January 26th, 2023 and brought together members of the society, local school children, and community leaders.
The celebration started with the hoisting of the Indian national flag and the singing of the national anthem. The members of the society and local school children participated in a march past, showcasing their love and respect for the nation.
The event featured a variety of performances that highlighted the rich cultural heritage of India. The performances included patriotic songs, dances, and skits that represented different cultures and regions of India. The society members also organized art and craft exhibitions that showcased their artistic talents." ),
("MWEVENT03" , "VALENTINES PARTY" , 500000 , "2023/02/14 20:30:00" , "2023/02/14 23:00:00" , "CITY VIEW MAIN GROUND" , "Miniworld Society celebrated the day of love, Valentine's Day, with a delightful Valentine's party on February 14th, 2023.
The party was held in the evening and the members of the society were dressed in red and white, the traditional colors of Valentine's Day. The venue was decorated with hearts, flowers, and candles, creating a romantic atmosphere.
The event featured a variety of fun activities and games for the couples and singles. The society members had organized a game of musical chairs for couples, a treasure hunt, and a dance competition, which kept the guests entertained throughout the night." ),
("MWEVENT04" , "HOLI" , 800000 , "2023/03/08 09:00:00" , "2023/03/08 17:00:00" , "MW EVE PARK" , "Miniworld Society celebrated the festival of colors, Holi, with great joy and enthusiasm on March 8th, 2023.
The event started in the morning, and the members of the society were dressed in white, ready to embrace the colors of Holi. The venue was decorated with colorful balloons, streamers, and flowers, creating a festive atmosphere.
The society members had arranged for organic and eco-friendly colors that were safe for everyone to use. The guests enjoyed throwing colors at each other, smearing each other's faces with colorful powder, and dancing to the tunes of the traditional Holi songs." ),
("MWEVENT05" , "EID" , 500000 , "2023/04/21 08:00:00" , "2023/04/21 11:00:00" , "SKY WAY HALL 02" , "Miniworld Society celebrated the festival of Eid with great joy and enthusiasm on  April 21st, 2023.
The event started in the morning, and the members of the society were dressed in traditional attire, ready to celebrate the festival. The venue was decorated with colorful lights, flowers, and banners, creating a festive atmosphere.
The society members had arranged for a special prayer ceremony for Eid, which was attended by all the members of the community. The prayers were followed by a delicious feast, which included traditional dishes like biryani, kebabs, and sheer khurma." ),
("MWEVENT06" , "MW SUMMER CARNIVAL" , 3000000 , "2023/05/08 11:00:00" , "2023/05/09 18:00:00" , "MW EVE PARK" , "Miniworld Society organized a Summer Carnival on May 8th, 2023, which was a fun-filled event for the entire community.
The venue was transformed into a carnival, with colorful decorations and exciting games and activities for people of all ages. There were stalls selling cotton candy, popcorn, and other snacks, as well as games like ring toss, balloon darts, and a dunk tank.
Children enjoyed the bouncy castles, face painting, and temporary tattoos, while adults enjoyed participating in the various games and winning prizes. There was also a photo booth, where guests could capture their memories of the event." ),
("MWEVENT07" , "YOGA DAY" , 200000 , "2022/06/21 05:00:00" , "2022/06/21 10:00:00" , "MW EVE PARK" , "Miniworld Society celebrated International Yoga Day on June 21st, 2022, with a special yoga session for the community.
The event started early in the morning, and the members of the society gathered at the venue, dressed in comfortable clothing for the yoga session. The venue was decorated with colorful yoga mats and flowers, creating a peaceful and serene atmosphere.
The yoga session was conducted by a professional yoga instructor, who led the group through various yoga asanas and breathing exercises. The members of the community participated in the session with great enthusiasm, and the session helped them feel rejuvenated and refreshed." ),
("MWEVENT08" , "INDEPENDENCE DAY" , 600000 , "2022/08/15 08:00:00" , "2022/01/01 01:00:00" , "MW EVE HALL" , "Miniworld Society celebrated India's 76th Independence Day on August 15th, 2022, with great enthusiasm and pride.
The event started early in the morning, and the members of the society gathered at the venue, dressed in traditional attire in the colors of the Indian flag. The venue was decorated with tricolor balloons and flags, creating a festive atmosphere.
The celebration began with the hoisting of the Indian national flag, followed by the national anthem. This was followed by speeches by members of the society, who spoke about the importance of India's independence and the sacrifices made by the freedom fighters." ),
("MWEVENT09" , "JANMASHTMI" , 8000000 , "2022/08/29 22:00:00" , "2022/08/30 01:00:00" , "PARK PLACE MAIN GROUND" , "Miniworld Society celebrated Janmashtami, the birth of Lord Krishna, with great joy and devotion on August 29th, 2022.
The event started in the evening, and the members of the society gathered at the venue, which was beautifully decorated with flowers and rangolis. The venue had a small temple set up, where a beautiful idol of Lord Krishna was placed, adorned with garlands and jewels.
The celebration began with the chanting of bhajans and kirtans in praise of Lord Krishna, which created a devotional atmosphere. The members of the society also performed aarti and offered sweets and fruits to the Lord." ),
("MWEVENT10" , "GANESH CHATURTHI" , 400000 , "2022/09/10 10:00:00" , "2022/09/19 10:00:00" , "MW EVE PARK" , "Miniworld Society celebrated Ganesh Chaturthi, the festival honoring the elephant-headed God, with great devotion and enthusiasm from September 10th to September 19th, 2022.
The event started with the installation of the beautifully crafted idol of Lord Ganesha in a decorated pandal set up by the society members. The venue was adorned with colorful lights and flowers, and the aroma of incense filled the air.
The celebration began with the chanting of mantras and offering of prayers to Lord Ganesha, seeking his blessings for a prosperous and successful life. The members of the society also performed aarti and offered a variety of fruits, sweets, and flowers to the Lord." ),
("MWEVENT11" , "NAVRATRI GARBA" , 4000000 , "2022/10/07 20:00:00" , "2022/10/15 11:30:00" , "MW EVE PARK" , "Miniworld Society celebrated Navratri, the nine-day festival dedicated to the worship of Goddess Durga, with great enthusiasm and zeal from October 7th to October 15th, 2022. The highlight of the festival was the Navratri Garba, a traditional dance form that is performed during the festival.
The society members organized a beautifully decorated Garba venue with colorful lights, flowers, and decorations. The members of the society, dressed in colorful traditional attire, gathered every evening to perform the Garba dance, which was accompanied by lively music and drum beats.
The Garba dance sessions were led by a professional dance instructor who taught the members of the society various Garba steps and techniques. The members of the society danced with great joy and energy, creating a festive and joyful atmosphere." ),
("MWEVENT12" , "WINTER CARNIVAL" , 3000000 , "2022/11/23 10:00:00" , "2022/11/29 17:00:00" , "MW EVE PARK" , "Miniworld Society organized a week long Winter Carnival from November 23th, 2022, to celebrate the festive season with the members of the society. The event was a grand success and brought together the community in a festive and joyful atmosphere.
The carnival was organized at the society clubhouse and featured a variety of fun activities and games for all age groups. The society members set up stalls selling delicious food, hot beverages, and winter wear, including jackets, hats, and gloves.
The highlight of the carnival was the snowman-making competition, where the society members had to create the best snowman using artificial snow. The competition brought out the creative side of the members and was enjoyed by everyone." ),
("MWEVENT13" , "CHRISTMAS" , 100000 , "2022/12/24 19:00:00" , "2023/12/25 23:00:00" , "MW EVE PARK" , "Miniworld Society celebrated Christmas on December 24th, 2022, with great enthusiasm and joy. The event was organized by the society members to bring together the community and celebrate the festival of love and togetherness.
The society clubhouse was beautifully decorated with Christmas trees, lights, and ornaments, creating a festive and joyful atmosphere. The event started with a Christmas carol singing competition, where the members sang their favorite carols, spreading the festive cheer.
The highlight of the event was the visit from Santa Claus, who distributed gifts and sweets to the children of the society. The children were thrilled to meet Santa and receive their gifts, which added to the festive spirit of the event." );


INSERT INTO RESIDENT_CONDUCTS VALUES
("MWEVENT01" , "202211001"),
("MWEVENT01" , "202211034"),
("MWEVENT01" , "202211040"),
("MWEVENT01" , "202211066"),
("MWEVENT01" , "202211080"),
("MWEVENT01" , "202211005"),
("MWEVENT01" , "202211033"),
("MWEVENT02" , "202211029"),
("MWEVENT02" , "202211002"),
("MWEVENT02" , "202211055"),
("MWEVENT02" , "202211012"),
("MWEVENT02" , "202211013"),
("MWEVENT03" , "202211066"),
("MWEVENT03" , "202211080"),
("MWEVENT03" , "202211003"),
("MWEVENT03" , "202211077"),
("MWEVENT04" , "202211075"),
("MWEVENT04" , "202211007"),
("MWEVENT04" , "202211023"),
("MWEVENT04" , "202211039"),
("MWEVENT04" , "202211006"),
("MWEVENT04" , "202211029"),
("MWEVENT04" , "202211063"),
("MWEVENT05" , "202211051"),
("MWEVENT05" , "202211080"),
("MWEVENT05" , "202211005"),
("MWEVENT06" , "202211087"),
("MWEVENT06" , "202211033"),
("MWEVENT06" , "202211032"),
("MWEVENT06" , "202211075"),
("MWEVENT07" , "202211012");
-- ("MWEVENT07" , "202211035"),
-- ("MWEVENT07" , "202211005"),
-- ("MWEVENT07" , "202211023"),
-- ("MWEVENT07" , "202211011"),
-- ("MWEVENT08" , "202211033"),
-- ("MWEVENT08" , "202211023"),
-- ("MWEVENT08" , "202211032"),
-- ("MWEVENT08" , "202211041"),
-- ("MWEVENT08" , "202211042"),
-- ("MWEVENT09" , "202211083"),
-- ("MWEVENT09" , "202211084"),
-- ("MWEVENT09" , "202211063"),
-- ("MWEVENT09" , "202211034"),
-- ("MWEVENT09" , "202211056"),
-- ("MWEVENT09" , "202211076"),
-- ("MWEVENT10" , "202211026"),
-- ("MWEVENT10" , "202211054"),
-- ("MWEVENT10" , "202211034"),
-- ("MWEVENT10" , "202211029"),
-- ("MWEVENT11" , "202211054"),
-- ("MWEVENT11" , "202211005"),
-- ("MWEVENT11" , "202211050"),
-- ("MWEVENT11" , "202211076"),
-- ("MWEVENT11" , "202211030"),
-- ("MWEVENT11" , "202211006"),
-- ("MWEVENT11" , "202211007"),
-- ("MWEVENT12" , "202211063"),
-- ("MWEVENT12" , "202211082"),
-- ("MWEVENT12" , "202211081"),
-- ("MWEVENT12" , "202211054"),
-- ("MWEVENT12" , "202211013"),
-- ("MWEVENT12" , "202211026"),
-- ("MWEVENT12" , "202211080"),
-- ("MWEVENT12" , "202211024");


INSERT INTO RESIDENTS_DOJ VALUES
("1001","MWAPCV123","2021/04/04"),
("1001","MWAPPP123","2021/05/01"),
("1015","MWAPSW123","2021/03/14"),
("1016","MWAPCV123","2021/04/18"),
("1016","MWAPSW123","2021/05/23"),
("1017","MWAPSW123","2021/04/27"),
("1018","MWAPCV123","2021/04/19"),
("1019","MWAPSW123","2021/04/08"),
("1072","MWAPCV123","2021/05/08"),
("1072","MWAPSW123","2021/03/31"),
("1075","MWAPCV123","2021/03/29"),
("1075","MWAPPP123","2021/05/05"),
("1077","MWAPSW123","2021/03/25"),
("1085","MWAPSW123","2021/04/28"),
("1091","MWAPSW123","2021/06/14"),
("1093","MWAPSW123","2021/06/13"),
("1095","MWAPCV123","2021/03/18"),
("1095","MWAPPP123","2021/04/04"),
("1097","MWAPPP123","2021/06/17"),
("1097","MWAPSW123","2021/03/09"),
("1099","MWAPCV123","2021/04/19"),
("1099","MWAPPP123","2021/05/04"),
("1101","MWAPPP123","2021/03/05"),
("1101","MWAPSW123","2021/11/29"),
("2003","MWAPCV123","2021/08/11"),
("2003","MWAPSW123","2021/10/11"),
("2004","MWAPCV123","2021/09/18"),
("2004","MWAPPP123","2021/04/07"),
("2005","MWAPCV123","2021/08/12"),
("2005","MWAPSW123","2021/01/19"),
("2006","MWAPCV123","2021/04/05"),
("2006","MWAPPP123","2021/06/15"),
("2007","MWAPCV123","2021/02/06"),
("2008","MWAPCV123","2021/07/27"),
("2008","MWAPPP123","2021/04/28"),
("2009","MWAPCV123","2021/09/12"),
("2009","MWAPPP123","2021/08/15"),
("2010","MWAPCV123","2021/09/12"),
("2010","MWAPSW123","2021/03/05"),
("2011","MWAPCV123","2021/04/04"),
("2011","MWAPPP123","2021/06/08"),
("2012","MWAPCV123","2021/09/04"),
("2013","MWAPPP123","2021/06/29"),
("2014","MWAPPP123","2021/08/23"),
("2015","MWAPPP123","2021/06/10"),
("2017","MWAPPP123","2021/04/20"),
("2018","MWAPCV123","2021/07/07"),
("2018","MWAPPP123","2021/06/04"),
("2019","MWAPCV123","2021/08/09"),
("2019","MWAPPP123","2021/04/02"),
("2019","MWAPSW123","2021/08/01"),
("2020","MWAPCV123","2021/05/14"),
("2020","MWAPSW123","2021/08/23"),
("2021","MWAPPP123","2021/07/27"),
("2022","MWAPCV123","2021/05/18"),
("2022","MWAPPP123","2021/06/01"),
("2024","MWAPPP123","2021/09/10"),
("3001","MWAPCV123","2021/11/20"),
("3003","MWAPCV123","2021/10/31"),
("3003","MWAPSW123","2021/10/20"),
("3005","MWAPCV123","2021/10/30"),
("3005","MWAPSW123","2021/11/04"),
("3007","MWAPPP123","2021/12/04"),
("3007","MWAPSW123","2021/09/09"),
("3009","MWAPPP123","2021/06/12"),
("3009","MWAPSW123","2021/07/04");







connection.query(`SELECT PASSWORD FROM RESIDENTS WHERE REGISTRATION_ID= ? ;`,[id], 
connection.query(`SELECT * FROM RESIDENTS, RESIDENTS_DOJ WHERE RESIDENTS.REGISTRATION_ID = ? AND RESIDENTS_DOJ.ROOM_NO = RESIDENTS.ROOM_NO AND RESIDENTS_DOJ.APARTMENT_ID = RESIDENTS.APARTMENT_ID;`,[id],function
connection.query(`SELECT NAME, START_DATE FROM EVENTS, resident_conducts WHERE resident_conducts.REGISTRATION_ID = ? AND resident_conducts.EVENT_ID = EVENTS.EVENT_ID;`,[id],function
connection.query(`SELECT NAME,OWNER_NAME,APARTMENT_ID,APARTMENT.OWNER_CONTACT FROM APARTMENT,APARTMENT_OWNER WHERE APARTMENT.OWNER_CONTACT=APARTMENT_OWNER.OWNER_CONTACT`,function
connection.query(`SELECT BHK,AVAILABLE_ROOMS FROM AVAILABLE_ROOMS WHERE APARTMENT_ID='${result[id]["APARTMENT_ID"]}';`,
connection.query(`SELECT * FROM EVENTS;`,
connection.query("SHOW TABLES;", 
connection.query(`SHOW COLUMNS FROM ${table}`,
connection.query(query?`SELECT COUNT(*) FROM ${table} WHERE ${query} `:`SELECT COUNT(*) FROM ${table} `, 
connection.query(query?`SELECT * FROM ${table} WHERE ${query}`:`SELECT * FROM ${table};`, 
connection.query(`SHOW INDEX FROM ${table} WHERE Key_name = 'PRIMARY';`,
connection.query(`UPDATE ${table} SET ${r}= ? WHERE ${query}`,[v],
connection.query(`SHOW COLUMNS FROM ${table}`,
connection.query(query,
connection.query(`SHOW INDEX FROM ${table} WHERE Key_name = 'PRIMARY';`,
connection.query(`DELETE FROM ${table} WHERE ${query}`,


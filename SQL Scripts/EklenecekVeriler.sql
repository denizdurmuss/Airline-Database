INSERT INTO Company(Company_name,AirlineCompanyFlag,AirplaneCompanyFlag)
VALUES 
('Türk Hava Yollarý A.Þ.',1,0),
('Pegasus A.Þ.',1,0),
('OnurAir A.Þ.',1,0),
('AirBus A.Þ.',0,1),
('Boeing A.Þ.',0,1),
('Bombardier Aviation A.Þ.',0,1)
;


INSERT INTO Airline(Company_id,Airline_name)
VALUES 
(1,'THY'),
(2,'Pegasus'),
(3,'OnurAir')
;

INSERT INTO Airplane_type(Airplane_type_name,Max_seats)
VALUES 
('A380',853),
('Boeing 737',189),
('Bombardier Challenger 300',9),
('F35',1),
('A340',380)
;

INSERT INTO Airplane(Company_id,Airplane_type_name,Total_number_of_seats)
VALUES
(4,'A380',450),
(5,'Boeing 737',200),
(1,'A340',300),
(1,'A380',200),
(1,'Boeing 737',100),
(2,'A340',350),
(2,'A380',500),
(2,'Boeing 737',150),
(3,'A340',250),
(3,'A380',800),
(3,'Boeing 737',189),
(1,'Bombardier Challenger 300',4)
;

INSERT INTO Airport(Airport_city,Airport_name,Airport_state,Airport_cordinats)
VALUES
('Ýzmir','Adnan Menderes Airport','Türkiye',35),
('Ýstanbul','Sabiha Gökçen Airport','Türkiye',25),
('Amsterdam','Schiphol Airport','Hollanda',55),
('Grönland','Narsarsuaq Airport','Danimarka',15),
('Ankara','Atatürk Airport','Türkiye',10),
('Bursa','Yeniþehir Airport','Türkiye',16),
('Adana','Adana Airport','Türkiye',12)
;

INSERT INTO Customer(Customer_name,Customer_phone,Customer_email,Customer_adress,Customer_country,Pasaport_number)
VALUES
('Yusuf',5210,'yusufblt10@outlook.com','Bursa','Türkiye',111111111),
('Deniz',2111,'deniz@outlook.com','Bursa','Türkiye',null),
('Cem',5521,'cem@outlook.com','Bursa','Türkiye',222222222),
('Jonny',1235,'jonny@outlook.com','Budapeþte','Hindistan',894561273),
('Ahmet Taþ',05123456,'ahmtþ@hotmail.com','Bursa','Türkiye',123456789),
('Müjdat Gezen',05123457,'mjdt@outlook.com','Artvin','Türkiye',null),
('Cem Adrian',05123458,'cemadran@gmail.com','Manisa','Türkiye',123456789),
('Jhony Deep',05123459,'jonny-depp@hotmail.com','Yeni Delhi','Hindistan',123456788),
('Cüneyt Çakýr',05123410,'cüneyt@tff.com','Ýstanbul','Türkiye',123456787),
('Mesut Özil',05123411,'mst-007@fb.com','Ýstanbul','Türkiye',123456786),
('Deniz Gezen',05123412,'denizge@hotmail.com','Bursa','Türkiye',null),
('Neymar Junior',05123413,'neymar-jn@outlook.com','Paris','Paris',123456785),
('Mahmut Tuncer',05123414,'mahmut-tr@outlook.com','Budapeþte','Hindistan',123456784),
('Jennifer Lawrance',05123415,'lawrance@outlook.com','Londra','Ýngiltere',123456783),
('Rihanna',05123416,'rihann01@outlook.com','Mekke','Suriye',123456782),
('Adriana Lima',05123417,'adrinalia01@outlook.com','Rio','Brezilya',null),
('Lionel Messi',05123418,'messilionel@outlook.com','Bursa','Türkiye',123456781),
('Mustafa Topaloðlu',05123419,'mustafatopal@outlook.com','Budapeþte','Hindistan',123456780),
('Ali Koç',05123420,'alikoç@outlook.com','Bursa','Türkiye',123456779);


INSERT INTO Flight(Airline_id,Weekdays)
VALUES
(1,'Pazartesi'),
(2,'Salý'),
(3,'Cuma'),
(1,'Cumartesi'),
(2,'Salý'),
(3,'Cuma'),
(2,'Pazar'),
(3,'Pazar'),
(1,'Pazar'),
(2,'Perþembe');


INSERT INTO Flight_leg(Flight_number,Departure_airport_code,Scheduled_departure_time,Arrival_airport_code,Scheduled_arrival_time)
VALUES
(1,1,'17:45',2,'19:00'),
(2,2,'07:45',3,'08:00'),
(3,3,'09:45',4,'11:11'),
(4,4,'17:45',1,'19:17'),
(5,1,'18:55',3,'21:00'),
(6,2,'01:45',4,'09:00'),
(1,3,'11:25',2,'07:00'),
(7,7,'11:00',2,'15:00'),
(8,2,'11:00',3,'17:00'),
(8,7,'11:00',1,'15:00'),
(9,3,'11:00',4,'16:00'),
(10,2,'11:00',5,'16:00')
;


INSERT INTO Leg_Instance(Flight_number,Leg_number,Leg_date,Airplane_id,Number_of_available,Departure_airport_code,Arrival_airport_code,Departure_time,Arrival_time)
VALUES
(1,1,'2021-01-24',1,189,1,2,'17:45','19:05'),
(2,2,'2020-02-05',3,100,2,3,'07:50','08:00'),
(3,3,'2021-05-14',5,100,3,4,'09:45','19:05'),
(4,4,'2021-07-15',7,250,4,1,'17:45','11:17'),
(5,5,'2021-09-14',9,179,1,3,'18:55','21:05'),
(6,6,'2021-10-11',2,150,2,4,'01:45','09:05'),
(1,7,'2020-12-09',9,189,3,2,'11:25','07:05'),
(7,8,'2020-12-09',9,189,7,2,'11:00','15:05'),
(8,9,'2020-12-09',9,189,2,3,'11:00','17:05'),
(8,10,'2020-12-09',9,189,7,1,'11:00','15:05'),
(9,11,'2020-12-09',9,189,3,4,'11:00','15:05'),
(10,12,'2020-12-09',9,189,2,5,'11:00','15:05')
;



INSERT INTO Seat_reservation(Flight_number,Leg_number,Customer_id,Seat_number,Leg_date)
VALUES
(1,1,1,20,'2021-01-24'),
(1,1,1,14,'2021-01-24'),
(2,2,2,9,'2020-02-05'),
(3,3,3,1,'2021-05-14'),
(4,4,4,5,'2021-07-15'),
(5,5,1,11,'2021-09-14'),
(6,6,2,19,'2021-10-11'),
(1,7,3,21,'2020-12-09'),
(1,1,5,35,'2021-01-24'),
(1,1,6,36,'2021-01-24'),
(2,2,8,37,'2020-02-05'),
(3,3,9,38,'2021-05-14'),
(4,4,10,39,'2021-07-15'),
(5,5,11,40,'2021-09-14'),
(6,6,12,41,'2021-10-11'),
(1,7,13,42,'2020-12-09'),
(1,1,14,43,'2021-01-24'),
(1,1,15,44,'2021-01-24'),
(2,2,16,45,'2020-02-05'),
(3,3,17,56,'2021-05-14'),
(4,4,18,57,'2021-07-15'),
(5,5,19,58,'2021-09-14'),
(6,6,19,59,'2021-10-11'),
(1,7,18,50,'2020-12-09'),
(1,1,17,61,'2021-01-24'),
(1,1,16,62,'2021-01-24'),
(2,2,15,63,'2020-02-05'),
(3,3,14,64,'2021-05-14'),
(4,4,13,65,'2021-07-15'),
(5,5,12,66,'2021-09-14'),
(6,6,11,77,'2021-10-11'),
(1,7,10,88,'2020-12-09'),
(7,8,10,100,'2020-12-09'),
(7,8,9,12,'2020-12-09'),
(7,8,15,11,'2020-12-09'),
(7,8,8,13,'2020-12-09'),
(7,8,16,14,'2020-12-09'),
(8,9,19,10,'2020-12-09'),
(8,9,14,11,'2020-12-09'),
(8,9,5,180,'2020-12-09'),
(8,9,1,100,'2020-12-09'),
(8,9,6,70,'2020-12-09'),
(8,9,13,60,'2020-12-09'),
(8,10,12,60,'2020-12-09'),
(8,10,13,70,'2020-12-09'),
(8,10,14,200,'2020-12-09'),
(8,10,15,61,'2020-12-09'),
(8,10,1,66,'2020-12-09'),
(8,10,11,80,'2020-12-09'),
(9,11,11,80,'2020-12-09'),
(9,11,10,90,'2020-12-09'),
(9,11,18,20,'2020-12-09'),
(9,11,10,30,'2020-12-09'),
(10,12,7,80,'2020-12-09'),
(10,12,8,90,'2020-12-09'),
(10,12,2,180,'2020-12-09'),
(10,12,4,280,'2020-12-09')
;


INSERT INTO Fare(Flight_number,Amount,Restrictions)
VALUES
(1,30,'Yolculuk boyunca maske takmak zorunludur'),
(2,20,'Hes kodu olmadan girilemez'),
(3,50,'15 yaþ altý çocuklar ebeveyni olmadan uçaða biniþ yapamaz'),
(4,10,'Yolculuk boyunca maske takmak zorunludur'),
(5,50,'8 yaþ altý çocuklar uçaða binemez'),
(6,11,'Tüm yolcular havayolu ekibi tarafýndan muayeneden geçecek herhangi bir semptonu bulunan giremez'),
(1,60,null);


INSERT INTO Can_land(Airplane_type_name,Airport_code)
VALUES
('A340',1),
('A340',2),
('A340',3),
('A340',4),
('A380',1),
('A380',2),
('A380',3),
('Boeing 737',1),
('Boeing 737',2),
('Boeing 737',3),
('Boeing 737',4),
('Bombardier Challenger 300',4),
('Bombardier Challenger 300',1),
('F35',3),
('F35',2),
('F35',1),
('F35',4);

--Triggerlar eklendikten sonra eklenmeli
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(1,1,1,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(2,2,2,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(3,3,3,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(4,4,4,0);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(1,5,5,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(2,6,6,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(3,1,7,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(5,1,1,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(6,1,1,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(7,2,2,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(8,3,3,0);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(9,4,4,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(10,5,5,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(11,6,6,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(12,1,7,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(13,1,1,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(14,1,1,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(15,2,2,0);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(16,3,3,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(17,4,4,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(18,5,5,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(17,1,7,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(16,1,1,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(15,1,1,0);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(14,2,2,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(13,3,3,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(12,5,5,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(10,1,7,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(10,7,8,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(9,7,8,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(15,7,8,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(9,7,8,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(8,7,8,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(16,7,8,1)
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(19,8,9,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(14,8,9,0);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(5,8,9,0);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(1,8,9,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(6,8,9,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(13,8,9,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(12,8,10,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(13,8,10,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(14,8,10,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(15,8,10,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(1,8,10,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(11,8,10,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(11,9,11,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(10,9,11,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(18,9,11,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(7,10,12,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(8,10,12,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(2,10,12,1);
INSERT INTO Check_in(Customer_id,Flight_number,Leg_number,Check_position)
VALUES
(4,10,12,1);

--Airport table
Create table Airport(
Airport_code int IDENTITY(1,1) NOT NULL,
Airport_name varchar(255) NOT NULL,
Airport_city varchar(255) NOT NULL,
Airport_state varchar(255),
Airport_cordinats int NOT NULL,
PRIMARY KEY (Airport_code)
);

--Company table
Create table Company(
Company_id int IDENTITY(1,1) NOT NULL,
Company_name varchar(255) UNIQUE NOT NULL,
AirlineCompanyFlag bit NOT NULL,
AirplaneCompanyFlag bit NOT NULL,
PRIMARY KEY (Company_id),

CONSTRAINT Company_Flag_check
CHECK(AirlineCompanyFlag!=0 or AirplaneCompanyFlag!=0) --Check Constraint Flagler 0 olamaz
);

--Airline table
Create table Airline(
Airline_id int IDENTITY(1,1) NOT NULL,
Company_id int NOT NULL,
Airline_name varchar(255) UNIQUE NOT NULL,
PRIMARY KEY (Airline_id),
FOREIGN KEY (Company_id) REFERENCES Company(Company_id)
);

--Flight table
Create table Flight(
Flight_number int IDENTITY(1,1) NOT NULL,
Airline_id int,
Weekdays varchar(255),
PRIMARY KEY (Flight_number),
FOREIGN KEY (Airline_id) REFERENCES Airline(Airline_id),

CONSTRAINT Weekdays_Checker
CHECK (Weekdays IN ('Pazartesi','Salý','Çarþamba','Perþembe','Cuma', 'Cumartesi','Pazar')) --Check Constraint Haftanýn günleri
); 

--Flight_Leg table
Create table Flight_leg(
Flight_number int NOT NULL,
Leg_number int IDENTITY(1,1) NOT NULL,
Departure_airport_code int NOT NULL,
Scheduled_departure_time time ,
Arrival_airport_code int NOT NULL,
Scheduled_arrival_time time,
PRIMARY KEY (Flight_number,Leg_number),
FOREIGN KEY (Flight_number) REFERENCES Flight(Flight_number),
CONSTRAINT Departure_airport_code FOREIGN KEY (Departure_airport_code) REFERENCES Airport(Airport_code),
CONSTRAINT Scheduled_departure_time FOREIGN KEY (Arrival_airport_code) REFERENCES Airport(Airport_code),

CONSTRAINT Flight_leg_code_check	-- Check Constraint Uçak kalktýðý yere inemez
CHECK(Departure_airport_code!=Arrival_airport_code)
);

--Leg_Instance table
Create table Leg_Instance(
Flight_number int NOT NULL,
Leg_number int NOT NULL,
Leg_date Date NOT NULL,
Airplane_id int NOT NULL,
Number_of_available int NOT NULL,
Departure_airport_code int NOT NULL,
Arrival_airport_code int NOT NULL,
Departure_time time,
Arrival_time time,
PRIMARY KEY (Flight_number,Leg_number,Leg_date),
FOREIGN KEY (Flight_number,Leg_number) REFERENCES Flight_leg(Flight_number,Leg_number),
FOREIGN KEY(Departure_airport_code)REFERENCES Airport(Airport_code),
FOREIGN KEY(Arrival_airport_code)REFERENCES Airport(Airport_code),

CONSTRAINT Leg_Instance_code_check	-- Check Constraint Uçak kalktýðý yere inemez
CHECK(Departure_airport_code!=Arrival_airport_code)
);

--Fare table
Create table Fare(
Flight_number int  NOT NULL,
Fare_code	int IDENTITY(1,1)NOT NULL,
Amount money NOT NULL,
Restrictions varchar(255),
PRIMARY KEY (Flight_number,Fare_Code),
FOREIGN KEY (Flight_number) REFERENCES Flight(Flight_number),

CONSTRAINT Amount_check		--Check Constraint Amount
CHECK(Amount>0)
);

--Airplane_type Table
Create table Airplane_type(
Airplane_type_name varchar(255) UNIQUE NOT NULL,
Max_seats int NOT NULL,
PRIMARY KEY (Airplane_type_name)
);

--Can_Land table
Create table Can_land(
Airplane_type_name varchar(255) NOT NULL,
Airport_code int NOT NULL,
PRIMARY KEY (Airplane_type_name,Airport_code),
CONSTRAINT Airplane_type_name FOREIGN KEY (Airplane_type_name) REFERENCES Airplane_type(Airplane_type_name),
CONSTRAINT Airport_code FOREIGN KEY (Airport_code) REFERENCES Airport(Airport_code)
);

--Airplane table
Create table Airplane(
Airplane_id int IDENTITY(1,1) NOT NULL,
Company_id int NOT NULL,
Airplane_type_name varchar(255) NOT NULL,
Total_number_of_seats int NOT NULL,
PRIMARY KEY (Airplane_id),
FOREIGN KEY (Company_id) REFERENCES Company(Company_id),
FOREIGN KEY (Airplane_type_name) REFERENCES Airplane_type(Airplane_type_name)
);

--Customer table
Create table Customer(
Customer_id int IDENTITY(1,1)NOT NULL,
Customer_name varchar(255) NOT NULL,
Customer_phone int,
Pasaport_number int,
Customer_email varchar(255),
Customer_adress varchar(255),
Customer_country varchar(255),
PRIMARY KEY(Customer_id),

CONSTRAINT Customer_iletiþim_check
CHECK(Customer_phone!=null or Customer_email!=null or Customer_adress!=null)  -- Check Constrait Customerin en az 1 tane iletiþime geçebileceði bir bilgi olmalý
);

--FFC table
Create table FFC(
Customer_id int NOT NULL,
FFC_card_no int NOT NULL,
Credit_point int,
Airline_id int NOT NULL,
FFC_type int ,
PRIMARY KEY(Customer_id,FFC_card_no),
FOREIGN KEY (Airline_id) REFERENCES Airline(Airline_id),
CONSTRAINT Customer_id FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),

CONSTRAINT FFC_türleri
CHECK(0<FFC_type and FFC_type<4),	--Check Constraint FFC türleri

CONSTRAINT Credit_point_check		--Check Constraint Credi point
CHECK(Credit_point>0)
);

--Check_in table 
Create table Check_in(
Customer_id int NOT NULL,
Flight_number int NOT NULL,
Leg_number int NOT NULL,
Check_position bit,
PRIMARY KEY(Flight_number,Leg_number,Customer_id),
FOREIGN KEY (Flight_number,Leg_number) REFERENCES Flight_leg(Flight_number,Leg_number),
FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

--Transaction_record table
Create table Transaction_record(
Flight_number int NOT NULL,
Leg_number int NOT NULL,
Customer_id int NOT NULL,
Mileage int,
PRIMARY KEY(Flight_number,Leg_number,Customer_id),
FOREIGN KEY (Flight_number,Leg_number,Customer_id) REFERENCES Check_in(Flight_number,Leg_number,Customer_id),

CONSTRAINT Transaction_record_check		-- Check Constraint mesafe 0 dan büyük olmalý	
CHECK(Mileage>0)
);

--Seat_reservation table
Create table Seat_reservation(
Flight_number int NOT NULL,
Leg_number int NOT NULL,
Customer_id int NOT NULL,
Seat_number int  NOT NULL,
Leg_date date,
PRIMARY KEY(Customer_id,Leg_number,Flight_number,Seat_number,Leg_date),
FOREIGN KEY (Flight_number,Leg_number,Leg_date) REFERENCES Leg_Instance(Flight_number,Leg_number,Leg_date),
FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);
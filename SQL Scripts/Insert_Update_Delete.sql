

--1
INSERT INTO Company(Company_name,AirlineCompanyFlag,AirplaneCompanyFlag)
VALUES 
('Atlas Jet A.Þ',1,1)

UPDATE Company set AirplaneCompanyFlag=0 where Company_name='Atlas Jet A.Þ'

DELETE FROM Company where Company_name='Atlas Jet A.Þ'

--2
INSERT INTO Airport(Airport_city,Airport_name,Airport_state,Airport_cordinats)
VALUES
('NYC','JFK','ABD',22)

UPDATE Airport set Airport_name='New York City' where Airport_name='NYC'

DELETE FROM Airport where Airport_name='New York City'

--3
INSERT INTO Customer(Customer_name,Customer_phone,Customer_email,Customer_adress,Customer_country,Pasaport_number)
VALUES
('Murat',5210,'murat.yýlmaz@outlook.com','Adana','Türkiye',123414)

UPDATE Customer set Customer_name='Murat Yýlmaz' where Customer_name='Murat'

DELETE FROM Customer where Customer_name='Murat Yýlmaz'

--4
INSERT INTO Fare(Flight_number,Amount,Restrictions)
VALUES
(3,30,'Maskesiz girilmez')

UPDATE Fare set Restrictions='Maske takmak zorunlu deðildir' where Restrictions='Maskesiz girilmez'

DELETE FROM Fare where Restrictions='Maske takmak zorunlu deðildir'

--5
INSERT INTO FFC(Customer_id,FFC_card_no,Credit_point,Airline_id,FFC_type)
VALUES
(3,9999,999999,1,3)

UPDATE FFC set Credit_point=9999 where FFC.Customer_id=3 and FFC.Airline_id=1

DELETE FROM FFC where Credit_point=9999 and Customer_id=3 and Airline_id=1
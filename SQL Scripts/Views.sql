-- Havayolu �irketlerinin u�aklar�
Create view Havayolu_�irketlerin_u�aklar�
as
SELECT Company_name,Airline_name,Airplane_type.Airplane_type_name
FROM Airline,Airplane_type,Company,Airplane
where Airline.Company_id=Company.Company_id and Company.AirlineCompanyFlag=1 and Company.AirplaneCompanyFlag=0 and Airplane.Company_id=Company.Company_id and Airplane_type.Airplane_type_name=Airplane.Airplane_type_name

Select * from Havayolu_�irketlerin_u�aklar�


--Checkin yapmayan m��terilerin bilgileri ve check-in yapmad�klar� u�u�
Create view Checkin_Yapmayan_M��teriler
as
Select Customer_name,Customer_phone,Pasaport_number,Customer_email,Check_in.Flight_number,Check_in.Leg_number
from Customer,Check_in
where Customer.Customer_id=Check_in.Customer_id and Check_in.Check_position=0

select * from Checkin_Yapmayan_M��teriler



--Hava yoluna ait u�u�lar�
Create view Havayollar�n�n_u�u�lar�
as
select Airline_name,Flight.Flight_number,Flight_leg.Departure_airport_code, Flight_leg.Arrival_airport_code
from Airline,Flight,Flight_leg
where Airline.Airline_id=Flight.Airline_id and Flight_leg.Flight_number=Flight.Airline_id 

select * from Havayollar�n�n_u�u�lar�


--Hava yolunun FFC m��terileri
Create view Havayollar�n�n_FFC_M��terileri
as
select Customer_name,Credit_point,FFC_type,Airline.Airline_name
from Customer,FFC,Airline
where Customer.Customer_id=FFC.Customer_id and FFC.Airline_id=Airline.Airline_id

select * from Havayollar�n�n_FFC_M��terileri


--U�u�lar�n �cretleri
Create view U�u�lar�n_�cret_Bilgileri
as
select Fare.Flight_number,Fare.Amount,Flight.Weekdays
from Fare,Flight
where Fare.Flight_number=Flight.Flight_number

select * from U�u�lar�n_�cret_Bilgileri
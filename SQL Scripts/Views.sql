-- Havayolu şirketlerinin uçakları
Create view Havayolu_Şirketlerin_uçakları
as
SELECT Company_name,Airline_name,Airplane_type.Airplane_type_name
FROM Airline,Airplane_type,Company,Airplane
where Airline.Company_id=Company.Company_id and Company.AirlineCompanyFlag=1 and Company.AirplaneCompanyFlag=0 and Airplane.Company_id=Company.Company_id and Airplane_type.Airplane_type_name=Airplane.Airplane_type_name

Select * from Havayolu_Şirketlerin_uçakları


--Checkin yapmayan müşterilerin bilgileri ve check-in yapmadıkları uçuş
Create view Checkin_Yapmayan_Müşteriler
as
Select Customer_name,Customer_phone,Pasaport_number,Customer_email,Check_in.Flight_number,Check_in.Leg_number
from Customer,Check_in
where Customer.Customer_id=Check_in.Customer_id and Check_in.Check_position=0

select * from Checkin_Yapmayan_Müşteriler



--Hava yoluna ait uçuşları
Create view Havayollarının_uçuşları
as
select Airline_name,Flight.Flight_number,Flight_leg.Departure_airport_code, Flight_leg.Arrival_airport_code
from Airline,Flight,Flight_leg
where Airline.Airline_id=Flight.Airline_id and Flight_leg.Flight_number=Flight.Airline_id 

select * from Havayollarının_uçuşları


--Hava yolunun FFC müşterileri
Create view Havayollarının_FFC_Müşterileri
as
select Customer_name,Credit_point,FFC_type,Airline.Airline_name
from Customer,FFC,Airline
where Customer.Customer_id=FFC.Customer_id and FFC.Airline_id=Airline.Airline_id

select * from Havayollarının_FFC_Müşterileri


--Uçuşların ücretleri
Create view Uçuşların_Ücret_Bilgileri
as
select Fare.Flight_number,Fare.Amount,Flight.Weekdays
from Fare,Flight
where Fare.Flight_number=Flight.Flight_number

select * from Uçuşların_Ücret_Bilgileri
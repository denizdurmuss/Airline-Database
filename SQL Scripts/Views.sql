-- Havayolu þirketlerinin uçaklarý
Create view Havayolu_Þirketlerin_uçaklarý
as
SELECT Company_name,Airline_name,Airplane_type.Airplane_type_name
FROM Airline,Airplane_type,Company,Airplane
where Airline.Company_id=Company.Company_id and Company.AirlineCompanyFlag=1 and Company.AirplaneCompanyFlag=0 and Airplane.Company_id=Company.Company_id and Airplane_type.Airplane_type_name=Airplane.Airplane_type_name

Select * from Havayolu_Þirketlerin_uçaklarý


--Checkin yapmayan müþterilerin bilgileri ve check-in yapmadýklarý uçuþ
Create view Checkin_Yapmayan_Müþteriler
as
Select Customer_name,Customer_phone,Pasaport_number,Customer_email,Check_in.Flight_number,Check_in.Leg_number
from Customer,Check_in
where Customer.Customer_id=Check_in.Customer_id and Check_in.Check_position=0

select * from Checkin_Yapmayan_Müþteriler



--Hava yoluna ait uçuþlarý
Create view Havayollarýnýn_uçuþlarý
as
select Airline_name,Flight.Flight_number,Flight_leg.Departure_airport_code, Flight_leg.Arrival_airport_code
from Airline,Flight,Flight_leg
where Airline.Airline_id=Flight.Airline_id and Flight_leg.Flight_number=Flight.Airline_id 

select * from Havayollarýnýn_uçuþlarý


--Hava yolunun FFC müþterileri
Create view Havayollarýnýn_FFC_Müþterileri
as
select Customer_name,Credit_point,FFC_type,Airline.Airline_name
from Customer,FFC,Airline
where Customer.Customer_id=FFC.Customer_id and FFC.Airline_id=Airline.Airline_id

select * from Havayollarýnýn_FFC_Müþterileri


--Uçuþlarýn ücretleri
Create view Uçuþlarýn_Ücret_Bilgileri
as
select Fare.Flight_number,Fare.Amount,Flight.Weekdays
from Fare,Flight
where Fare.Flight_number=Flight.Flight_number

select * from Uçuþlarýn_Ücret_Bilgileri
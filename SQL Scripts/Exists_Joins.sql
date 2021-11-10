--Credi puan� 1000den fazla olan m��teri varsa bunlar�n bilgileri(exist)
Select *
from Customer
where exists (select Credit_point from FFC where Credit_point>1000 and Customer.Customer_id=FFC.Customer_id)


--U�a�� olmayan manufacture �irketler varsa bu �irketlerin bilgileri(exist)
Select *
from Company
where  exists(select Company_id from Airplane where Airplane.Company_id=Company.Company_id and Company.AirplaneCompanyFlag=1 and Company.AirlineCompanyFlag=0)


--T�m verilerdeki Credi pointi 1000 den k���k olan m��teriler varsa bu m��terilerin bilgileri(not exist)
Select  *
from Customer,FFC
where FFC.Customer_id=Customer.Customer_id and not exists (select Credit_point from FFC where Credit_point>1000 and Customer.Customer_id=FFC.Customer_id)


--LEFT JOIN
--T�m m��terilerin FFC ise oldu�u airline ve ordaki puan�
Select Customer_name,Airline_name,Credit_point
from Customer
LEFT JOIN FFC on FFC.Customer_id=Customer.Customer_id
LEFT JOIN Airline on FFC.Airline_id=Airline.Airline_id

--RIGHT JOIN
--M��terilerin koltuk numaralar�
Select Customer_name,Seat_reservation.Flight_number,Seat_reservation.Leg_number,Seat_reservation.Seat_number
from Seat_reservation
Right JOIN Customer on Seat_reservation.Customer_id=Customer.Customer_id

-- FULL OUTHER JOIN
--Airportlara inebilen u�aklar
select DISTINCT  Airport_name,Airplane.Airplane_type_name
from Airport
FULL OUTER JOIN Can_land on Can_land.Airport_code=Airport.Airport_code
FULL OUTER JOIN Airplane_type on Can_land.Airplane_type_name=Airplane_type.Airplane_type_name
FULL OUTER JOIN Airplane on Airplane.Airplane_type_name =Airplane_type.Airplane_type_name
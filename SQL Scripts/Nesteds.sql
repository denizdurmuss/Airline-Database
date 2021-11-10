-- THY deki card nosu belirlenen ki�inin ffc bilgileri
Select *
From Customer,Airline
where Customer.Customer_id=(Select FFC.Customer_id from FFC where FFC.FFC_card_no= and Airline.Airline_id=FFC.Airline_id) 


-- U�u� numars� 1 ve Fare codu 7 olan u�u�un bilgileri
SELECT *
from Flight
where Flight.Flight_number=(Select Fare.Flight_number from Fare where Fare.Fare_code=7)


--Amsterdamdan Gr�nlanda giden u�u�taki 21 koltuk numaral� ki�inin bilgileri
Select *
from Customer
where Customer.Customer_id=(Select Seat_reservation.Customer_id from Seat_reservation where Seat_reservation.Flight_number=1 and Seat_reservation.Leg_number=7 and Seat_number=21)


--THY �irketinin A380 u�a��n�n bilgileri 
Select *
from Airplane
where Airplane.Company_id=(select Company.Company_id from Company where Company.Company_name='T�rk Hava Yollar� A.�.' and Airplane.Airplane_type_name='A380')
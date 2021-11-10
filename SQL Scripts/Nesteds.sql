-- THY deki card nosu belirlenen kiþinin ffc bilgileri
Select *
From Customer,Airline
where Customer.Customer_id=(Select FFC.Customer_id from FFC where FFC.FFC_card_no= and Airline.Airline_id=FFC.Airline_id) 


-- Uçuþ numarsý 1 ve Fare codu 7 olan uçuþun bilgileri
SELECT *
from Flight
where Flight.Flight_number=(Select Fare.Flight_number from Fare where Fare.Fare_code=7)


--Amsterdamdan Grönlanda giden uçuþtaki 21 koltuk numaralý kiþinin bilgileri
Select *
from Customer
where Customer.Customer_id=(Select Seat_reservation.Customer_id from Seat_reservation where Seat_reservation.Flight_number=1 and Seat_reservation.Leg_number=7 and Seat_number=21)


--THY þirketinin A380 uçaðýnýn bilgileri 
Select *
from Airplane
where Airplane.Company_id=(select Company.Company_id from Company where Company.Company_name='Türk Hava Yollarý A.Þ.' and Airplane.Airplane_type_name='A380')
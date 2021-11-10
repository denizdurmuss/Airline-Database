

--Þirketlerdeki müþtelerin adlarý ve puanlarý -3 Table
select Customer_name,Airline_name,Credit_point
from Airline,FFC,Customer
where Airline.Airline_id=FFC.Airline_id and Customer.Customer_id=FFC.Customer_id

--Türk hava yoluna ait FFCler - 3 Table
select Airline_name,Customer_name,FFC_card_no
from Airline,Customer,FFC
where Airline.Airline_id=FFC.Airline_id and Customer.Customer_id=FFC.Customer_id and Airline.Airline_name='THY'

-- Dolu koluða sahip þirketler - 3 Table
select Company_name,Total_number_of_seats,Number_of_available,(Airplane.Total_number_of_seats-Leg_Instance.Number_of_available)AS Satýlan_koltuklar
FROM Company,Airplane,Leg_Instance
where Company.Company_id=Airplane.Company_id and Airplane.Airplane_id=Leg_Instance.Airplane_id
Order by (Satýlan_koltuklar) desc

--checkin yapan müþterilerin mileage kayýtlarý -3Table
select Customer_name,Mileage,Transaction_record.Flight_number,Transaction_record.Leg_number
from Check_in,Customer,Transaction_record
where Customer.Customer_id=Transaction_record.Customer_id and Check_in.Check_position=1 and Check_in.Customer_id=Customer.Customer_id and Check_in.Flight_number=Transaction_record.Flight_number and Check_in.Leg_number=Transaction_record.Leg_number
order by (Mileage)desc


--Customer idsi 3 olan müþterinin katýldýðý uçuþ kayýtlarý - 2 Table
Select Customer.Customer_name,Transaction_record.Flight_number,Transaction_record.Leg_number,Transaction_record.Mileage
from Transaction_record,Customer
where Transaction_record.Customer_id=3 and Customer.Customer_id=3


--Gold olan FFCler -2 Table
Select Customer_name ,Customer_phone,Credit_point
from FFC,Customer
where Customer.Customer_id = FFC.Customer_id and FFC.FFC_type=3;


-- Manufacture yapan þirketlerin ürettikleri uçaklar - 2 Table
select Company_name,Airplane_type_name
from Company,Airplane
where Company.AirplaneCompanyFlag='True' and Airplane.Company_id=Company.Company_id


-- uçuþlarýn plananlar kalkýþ ve iniþ süreleri  ve gerçekleþen süreler -4 Table
Select Airline_name,Flight_leg.Flight_number,Flight_leg.Leg_number,Scheduled_departure_time , Scheduled_arrival_time,Departure_time,Arrival_time
from Flight_leg,Leg_Instance,Airline,Flight
where Flight_leg.Leg_number=Leg_Instance.Leg_number and Flight_leg.Flight_number=Leg_Instance.Flight_number and  Flight_leg.Flight_number=Flight.Flight_number and Airline.Airline_id=Flight.Airline_id


--uçaðýn türü , kaltýðý havalimaný  ve inebildiði havalimaný  - 4 Table
select Airline_id,Airplane_type_name,Departure_airport_code,Arrival_airport_code
from Can_land,Flight_leg,Airport,Flight
where Airport.Airport_code=Can_land.Airport_code and Airport.Airport_code=Flight_leg.Departure_airport_code and Flight.Flight_number=Flight_leg.Flight_number

--uçuþlarýn günleri ve ücretleri -4 Table
select Leg_Instance.Flight_number,Leg_Instance.Leg_number,Leg_date,Amount,Restrictions
from Leg_Instance,Fare,Flight_leg,Flight
where Flight.Flight_number=Fare.Flight_number and Leg_Instance.Flight_number=Flight.Flight_number and Leg_Instance.Leg_number=Flight_leg.Leg_number
order by (Amount) desc
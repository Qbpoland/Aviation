-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Wrz 2023, 10:39
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `aviation_data`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `airplane_data`
--

CREATE TABLE `airplane_data` (
  `registration_number` varchar(20) NOT NULL,
  `airplane_model` varchar(255) DEFAULT NULL,
  `seating_capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `airplane_data`
--

INSERT INTO `airplane_data` (`registration_number`, `airplane_model`, `seating_capacity`) VALUES
('D-EFG567', 'Embraer E190', 100),
('F-HIJ890', 'Airbus A380', 500),
('G-789XYZ', 'Boeing 777', 300),
('N12345', 'Airbus A320', 180),
('SP-ABC123', 'Boeing 737', 150);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `backup_log`
--

CREATE TABLE `backup_log` (
  `Backup_ID` int(11) NOT NULL,
  `Backup_Date` datetime DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `backup_log`
--

INSERT INTO `backup_log` (`Backup_ID`, `Backup_Date`, `Description`) VALUES
(0, '2023-09-27 10:30:44', 'Kopia zapasowa danych przed aktualizacją');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `baggage`
--

CREATE TABLE `baggage` (
  `baggage_id` int(11) NOT NULL,
  `ticket_number` varchar(20) DEFAULT NULL,
  `flight_number` varchar(20) DEFAULT NULL,
  `baggage_weight` decimal(5,2) DEFAULT NULL,
  `baggage_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `baggage`
--

INSERT INTO `baggage` (`baggage_id`, `ticket_number`, `flight_number`, `baggage_weight`, `baggage_status`) VALUES
(1, 'T12345', 'AA123', '20.50', 'odebrany'),
(2, 'T23456', 'UA456', '18.00', 'odebrany'),
(3, 'T34567', 'DL789', '23.50', 'odebrany'),
(4, 'T45678', 'BA234', '15.00', 'zgubiony'),
(5, 'T56789', 'LH567', '21.80', 'odebrany');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `baggage_tracking`
--

CREATE TABLE `baggage_tracking` (
  `Tracking_ID` int(11) NOT NULL,
  `Passenger_Name` varchar(255) DEFAULT NULL,
  `Flight_Number` varchar(10) DEFAULT NULL,
  `Baggage_Tag` varchar(20) DEFAULT NULL,
  `Departure_Airport` varchar(50) DEFAULT NULL,
  `Arrival_Airport` varchar(50) DEFAULT NULL,
  `Tracking_Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `baggage_tracking`
--

INSERT INTO `baggage_tracking` (`Tracking_ID`, `Passenger_Name`, `Flight_Number`, `Baggage_Tag`, `Departure_Airport`, `Arrival_Airport`, `Tracking_Status`) VALUES
(1, 'John Smith', 'LO123', 'ABC123', 'JFK', 'LAX', 'W trakcie dostawy'),
(2, 'Mary Johnson', 'LH456', 'XYZ456', 'ORD', 'DFW', 'Dostarczono na miejsce'),
(3, 'David Brown', 'AA789', 'LMN789', 'ATL', 'MIA', 'Zgubiony'),
(4, 'Sarah Davis', 'DL654', 'PQR654', 'SFO', 'SEA', 'W trakcie przekształceń'),
(5, 'Michael Wilson', 'UA321', 'DEF321', 'DEN', 'PHX', 'Dostarczono na miejsce');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cargo_data`
--

CREATE TABLE `cargo_data` (
  `shipment_number` varchar(20) NOT NULL,
  `shipment_weight` decimal(8,2) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `cargo_flight_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `cargo_data`
--

INSERT INTO `cargo_data` (`shipment_number`, `shipment_weight`, `delivery_address`, `cargo_flight_number`) VALUES
('CARGO001', '500.00', '123 Main St, New York, NY', 'CARGO123'),
('CARGO002', '800.50', '456 Elm St, Los Angeles, CA', 'CARGO456'),
('CARGO003', '300.25', '789 Oak St, Chicago, IL', 'CARGO789'),
('CARGO004', '600.75', '101 Pine St, Miami, FL', 'CARGO101'),
('CARGO005', '400.20', '202 Maple St, Houston, TX', 'CARGO202');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customer_support`
--

CREATE TABLE `customer_support` (
  `Support_ID` int(11) NOT NULL,
  `Passenger_Name` varchar(255) DEFAULT NULL,
  `Support_Type` varchar(50) DEFAULT NULL,
  `Support_Date` datetime DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Resolution` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `customer_support`
--

INSERT INTO `customer_support` (`Support_ID`, `Passenger_Name`, `Support_Type`, `Support_Date`, `Description`, `Resolution`) VALUES
(1, 'John Smith', 'Skarga', '2023-10-15 10:30:00', 'Opóźnienie lotu', 'Oferowana rekompensata'),
(2, 'Mary Johnson', 'Pytanie', '2023-10-16 14:15:00', 'Zmiana miejsca siedzenia', 'Zaktualizowano miejsce siedzenia'),
(3, 'David Brown', 'Skarga', '2023-10-17 16:45:00', 'Zagubiony bagaż', 'Trwa śledzenie bagażu'),
(4, 'Sarah Davis', 'Pytanie', '2023-10-18 11:20:00', 'Zasady odprawy', 'Udzielono informacji'),
(5, 'Michael Wilson', 'Skarga', '2023-10-19 12:00:00', 'Zła obsługa na pokładzie', 'W toku dochodzenie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `flight_control`
--

CREATE TABLE `flight_control` (
  `Flight_ID` int(11) NOT NULL,
  `Flight_Number` varchar(10) DEFAULT NULL,
  `Aircraft_Type` varchar(50) DEFAULT NULL,
  `Departure_Airport` varchar(50) DEFAULT NULL,
  `Arrival_Airport` varchar(50) DEFAULT NULL,
  `Departure_Time` datetime DEFAULT NULL,
  `Arrival_Time` datetime DEFAULT NULL,
  `Current_Location` varchar(50) DEFAULT NULL,
  `Altitude` int(11) DEFAULT NULL,
  `Speed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `flight_control`
--

INSERT INTO `flight_control` (`Flight_ID`, `Flight_Number`, `Aircraft_Type`, `Departure_Airport`, `Arrival_Airport`, `Departure_Time`, `Arrival_Time`, `Current_Location`, `Altitude`, `Speed`) VALUES
(1, 'LO123', 'Boeing 737', 'JFK', 'LAX', '2023-10-15 08:00:00', '2023-10-15 12:00:00', '40.7128° N, -74.0060° W', 35000, 500),
(2, 'LH456', 'Airbus A320', 'ORD', 'DFW', '2023-10-16 09:15:00', '2023-10-16 11:45:00', '41.8781° N, -87.6298° W', 32000, 480),
(3, 'AA789', 'Boeing 777', 'ATL', 'MIA', '2023-10-17 11:30:00', '2023-10-17 13:30:00', '33.7489° N, -84.3879° W', 33000, 520),
(4, 'DL654', 'Airbus A350', 'SFO', 'SEA', '2023-10-18 10:45:00', '2023-10-18 12:30:00', '37.7749° N, -122.4194° W', 36000, 540),
(5, 'UA321', 'Boeing 787', 'DEN', 'PHX', '2023-10-19 14:20:00', '2023-10-19 16:10:00', '39.7392° N, -104.9903° W', 31000, 470);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `flight_history`
--

CREATE TABLE `flight_history` (
  `flight_id` int(11) NOT NULL,
  `flight_number` varchar(20) DEFAULT NULL,
  `flight_date` date DEFAULT NULL,
  `departure_airport` varchar(50) DEFAULT NULL,
  `destination_airport` varchar(50) DEFAULT NULL,
  `flight_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `flight_history`
--

INSERT INTO `flight_history` (`flight_id`, `flight_number`, `flight_date`, `departure_airport`, `destination_airport`, `flight_status`) VALUES
(1, 'AA123', '2023-09-01', 'JFK', 'LAX', 'W drodze'),
(2, 'UA456', '2023-09-02', 'ORD', 'SFO', 'Zakończony'),
(3, 'DL789', '2023-09-03', 'ATL', 'MIA', 'Zakończony'),
(4, 'BA234', '2023-09-04', 'LHR', 'CDG', 'Zakończony'),
(5, 'LH567', '2023-09-05', 'TXL', 'FCO', 'W drodze');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `flight_info`
--

CREATE TABLE `flight_info` (
  `flight_id` int(11) NOT NULL,
  `flight_number` varchar(20) DEFAULT NULL,
  `departure_datetime` datetime DEFAULT NULL,
  `arrival_datetime` datetime DEFAULT NULL,
  `departure_gate_number` varchar(10) DEFAULT NULL,
  `route_start` varchar(255) DEFAULT NULL,
  `route_destination` varchar(255) DEFAULT NULL,
  `free_seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `flight_info`
--

INSERT INTO `flight_info` (`flight_id`, `flight_number`, `departure_datetime`, `arrival_datetime`, `departure_gate_number`, `route_start`, `route_destination`, `free_seats`) VALUES
(1, 'AA123', '2023-09-28 08:00:00', '2023-09-28 10:30:00', 'Gate 1', 'New York', 'Los Angeles', 100),
(2, 'UA456', '2023-09-29 12:30:00', '2023-09-29 15:15:00', 'Gate 3', 'Chicago', 'San Francisco', 75),
(3, 'DL789', '2023-09-30 09:45:00', '2023-09-30 12:15:00', 'Gate 2', 'Atlanta', 'Miami', 50),
(4, 'BA234', '2023-10-01 14:15:00', '2023-10-01 16:45:00', 'Gate 4', 'London', 'Paris', 120),
(5, 'LH567', '2023-10-02 17:30:00', '2023-10-02 20:00:00', 'Gate 5', 'Berlin', 'Rome', 80);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `flight_reservations`
--

CREATE TABLE `flight_reservations` (
  `Reservation_ID` int(11) NOT NULL,
  `Passenger_Name` varchar(255) DEFAULT NULL,
  `Flight_Number` varchar(10) DEFAULT NULL,
  `Reservation_Date` date DEFAULT NULL,
  `Payment_Amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `flight_reservations`
--

INSERT INTO `flight_reservations` (`Reservation_ID`, `Passenger_Name`, `Flight_Number`, `Reservation_Date`, `Payment_Amount`) VALUES
(1, 'John Smith', 'LO123', '2023-10-15', '250.00'),
(2, 'Mary Johnson', 'LH456', '2023-10-16', '320.50'),
(3, 'David Brown', 'AA789', '2023-10-17', '180.75'),
(4, 'Sarah Davis', 'DL654', '2023-10-18', '295.50'),
(5, 'Michael Wilson', 'UA321', '2023-10-19', '210.25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `passenger_data`
--

CREATE TABLE `passenger_data` (
  `passenger_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `passport_or_id` varchar(20) DEFAULT NULL,
  `country_of_origin` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `passenger_data`
--

INSERT INTO `passenger_data` (`passenger_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `passport_or_id`, `country_of_origin`, `contact_info`) VALUES
(1, 'Anna', 'Nowak', '1990-05-15', 'Female', 'ABC12345', 'Polska', 'ul. Kwiatowa 1, 00-001 Warszawa, +48 123 456 789, anna.nowak@example.com'),
(2, 'Jan', 'Kowalski', '1985-03-20', 'Male', 'XYZ98765', 'Polska', 'ul. Ogrodowa 2, 00-002 Warszawa, +48 987 654 321, jan.kowalski@example.com'),
(3, 'Maria', 'Smith', '1992-08-10', 'Female', 'DEF45678', 'USA', '123 Main St, New York, NY, +1 (123) 456-7890, maria.smith@example.com'),
(4, 'John', 'Johnson', '1980-12-03', 'Male', 'GHI78901', 'USA', '456 Elm St, Los Angeles, CA, +1 (987) 654-3210, john.johnson@example.com'),
(5, 'Marta', 'García', '1995-04-25', 'Female', 'JKL23456', 'Hiszpania', 'Calle Principal 3, Madrid, +34 987 654 321, marta.garcia@example.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personnel`
--

CREATE TABLE `personnel` (
  `personnel_id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `employee_id` varchar(20) DEFAULT NULL,
  `working_hours` varchar(255) DEFAULT NULL,
  `airport_or_flight_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `personnel`
--

INSERT INTO `personnel` (`personnel_id`, `full_name`, `job_title`, `employee_id`, `working_hours`, `airport_or_flight_code`) VALUES
(1, 'Karolina Wojcik', 'Obsługa pasażerów', 'EMP12345', '8:00 AM - 4:00 PM', 'EPGD'),
(2, 'Marcin Nowak', 'Pilot', 'EMP23456', 'Variable Shifts', 'LOT345'),
(3, 'Ewa Johnson', 'Personel naziemny', 'EMP34567', '9:00 AM - 5:00 PM', 'EPKK'),
(4, 'Robert Smith', 'Technik obsługi samolotów', 'EMP45678', '12:00 PM - 8:00 PM', 'LHR789'),
(5, 'Andrzej Kowalski', 'Kierownik lotniska', 'EMP56789', '7:00 AM - 3:00 PM', 'EGLL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resource_management`
--

CREATE TABLE `resource_management` (
  `resource_id` int(11) NOT NULL,
  `resource_type` varchar(50) DEFAULT NULL,
  `resource_name` varchar(255) DEFAULT NULL,
  `resource_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `resource_management`
--

INSERT INTO `resource_management` (`resource_id`, `resource_type`, `resource_name`, `resource_status`) VALUES
(1, 'Bramka', 'Gate 1', 'Dostępna'),
(2, 'Bramka', 'Gate 2', 'Zajęta'),
(3, 'Stan paliwa', 'Terminal 1', 'Pełny'),
(4, 'Stan paliwa', 'Terminal 2', 'Pusty'),
(5, 'Sloty startowe', 'Slot 1', 'Dostępny'),
(6, 'Sloty startowe', 'Slot 2', 'Zajęty');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `security_data`
--

CREATE TABLE `security_data` (
  `security_id` int(11) NOT NULL,
  `passenger_name` varchar(255) DEFAULT NULL,
  `security_list_type` varchar(50) DEFAULT NULL,
  `security_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `security_data`
--

INSERT INTO `security_data` (`security_id`, `passenger_name`, `security_list_type`, `security_info`) VALUES
(1, 'John Doe', 'Lista No Fly', 'Potencjalne zagrożenie'),
(2, 'Jane Smith', 'Lista SSSS', 'Kontrola dodatkowa'),
(3, 'David Johnson', 'Lista Bezpieczeństwa', 'Brak zagrożenia'),
(4, 'Emily Brown', 'Lista TSA', 'Kontrola bagażu'),
(5, 'Michael Wilson', 'Lista No Fly', 'Potencjalne zagrożenie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `security_permissions`
--

CREATE TABLE `security_permissions` (
  `Permission_ID` int(11) NOT NULL,
  `Role_Name` varchar(50) DEFAULT NULL,
  `Data_Type` varchar(50) DEFAULT NULL,
  `Data_Category` varchar(50) DEFAULT NULL,
  `Permission_Level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `security_permissions`
--

INSERT INTO `security_permissions` (`Permission_ID`, `Role_Name`, `Data_Type`, `Data_Category`, `Permission_Level`) VALUES
(1, 'Admin', 'Personal', 'Contact', 'Full Access'),
(2, 'Employee', 'Personal', 'Contact', 'Read Only'),
(3, 'Employee', 'Personal', 'Financial', 'Full Access'),
(4, 'Customer', 'Personal', 'Contact', 'Read Only'),
(5, 'Customer', 'Personal', 'Financial', 'No Access');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stats_data`
--

CREATE TABLE `stats_data` (
  `stats_id` int(11) NOT NULL,
  `report_name` varchar(255) DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  `number_of_passengers` int(11) DEFAULT NULL,
  `flight_delays` int(11) DEFAULT NULL,
  `flight_cancellations` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `stats_data`
--

INSERT INTO `stats_data` (`stats_id`, `report_name`, `report_date`, `number_of_passengers`, `flight_delays`, `flight_cancellations`) VALUES
(1, 'Miesięczny raport lotniska', '2023-08-01', 25000, 120, 10),
(2, 'Roczne statystyki linii lotniczych', '2023-12-31', 300000, 1500, 45),
(3, 'Raport tygodniowy', '2023-09-15', 18000, 75, 5),
(4, 'Raport kwartalny', '2023-09-30', 75000, 320, 25),
(5, 'Dzienny raport kontroli bezpieczeństwa', '2023-09-27', 4000, 30, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ticket_reservation`
--

CREATE TABLE `ticket_reservation` (
  `ticket_number` varchar(20) NOT NULL,
  `ticket_price` decimal(8,2) DEFAULT NULL,
  `ticket_class` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ticket_reservation`
--

INSERT INTO `ticket_reservation` (`ticket_number`, `ticket_price`, `ticket_class`, `payment_status`) VALUES
('T12345', '250.00', 'ekonomiczna', 'opłacone'),
('T23456', '550.00', 'biznesowa', 'opłacone'),
('T34567', '950.00', 'pierwsza klasa', 'opłacone'),
('T45678', '300.00', 'ekonomiczna', 'opłacone'),
('T56789', '750.00', 'biznesowa', 'nieopłacone');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Role_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`User_ID`, `Username`, `Password`, `Role_Name`) VALUES
(1, 'admin_user', 'hashed_password', 'Admin'),
(2, 'employee_user', 'hashed_password', 'Employee'),
(3, 'employee_user2', 'hashed_password', 'Employee'),
(4, 'customer_user1', 'hashed_password', 'Customer'),
(5, 'customer_user2', 'hashed_password', 'Customer');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `your_data`
--

CREATE TABLE `your_data` (
  `Data_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `airplane_data`
--
ALTER TABLE `airplane_data`
  ADD PRIMARY KEY (`registration_number`);

--
-- Indeksy dla tabeli `backup_log`
--
ALTER TABLE `backup_log`
  ADD PRIMARY KEY (`Backup_ID`);

--
-- Indeksy dla tabeli `baggage`
--
ALTER TABLE `baggage`
  ADD PRIMARY KEY (`baggage_id`);

--
-- Indeksy dla tabeli `baggage_tracking`
--
ALTER TABLE `baggage_tracking`
  ADD PRIMARY KEY (`Tracking_ID`);

--
-- Indeksy dla tabeli `cargo_data`
--
ALTER TABLE `cargo_data`
  ADD PRIMARY KEY (`shipment_number`);

--
-- Indeksy dla tabeli `customer_support`
--
ALTER TABLE `customer_support`
  ADD PRIMARY KEY (`Support_ID`);

--
-- Indeksy dla tabeli `flight_control`
--
ALTER TABLE `flight_control`
  ADD PRIMARY KEY (`Flight_ID`);

--
-- Indeksy dla tabeli `flight_history`
--
ALTER TABLE `flight_history`
  ADD PRIMARY KEY (`flight_id`);

--
-- Indeksy dla tabeli `flight_info`
--
ALTER TABLE `flight_info`
  ADD PRIMARY KEY (`flight_id`);

--
-- Indeksy dla tabeli `flight_reservations`
--
ALTER TABLE `flight_reservations`
  ADD PRIMARY KEY (`Reservation_ID`);

--
-- Indeksy dla tabeli `passenger_data`
--
ALTER TABLE `passenger_data`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indeksy dla tabeli `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`personnel_id`);

--
-- Indeksy dla tabeli `resource_management`
--
ALTER TABLE `resource_management`
  ADD PRIMARY KEY (`resource_id`);

--
-- Indeksy dla tabeli `security_data`
--
ALTER TABLE `security_data`
  ADD PRIMARY KEY (`security_id`);

--
-- Indeksy dla tabeli `security_permissions`
--
ALTER TABLE `security_permissions`
  ADD PRIMARY KEY (`Permission_ID`);

--
-- Indeksy dla tabeli `stats_data`
--
ALTER TABLE `stats_data`
  ADD PRIMARY KEY (`stats_id`);

--
-- Indeksy dla tabeli `ticket_reservation`
--
ALTER TABLE `ticket_reservation`
  ADD PRIMARY KEY (`ticket_number`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indeksy dla tabeli `your_data`
--
ALTER TABLE `your_data`
  ADD PRIMARY KEY (`Data_ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `baggage`
--
ALTER TABLE `baggage`
  MODIFY `baggage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `flight_history`
--
ALTER TABLE `flight_history`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `flight_info`
--
ALTER TABLE `flight_info`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `passenger_data`
--
ALTER TABLE `passenger_data`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `personnel`
--
ALTER TABLE `personnel`
  MODIFY `personnel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `resource_management`
--
ALTER TABLE `resource_management`
  MODIFY `resource_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `security_data`
--
ALTER TABLE `security_data`
  MODIFY `security_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `stats_data`
--
ALTER TABLE `stats_data`
  MODIFY `stats_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

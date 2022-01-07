-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2022 at 11:39 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc_stock`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(10) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Phone_Number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `Username`, `Password`, `Name`, `Phone_Number`) VALUES
(1, 'admin', 'admin', 'admin', 123456789);

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER ` Admin_Update` AFTER UPDATE ON `admin` FOR EACH ROW INSERT INTO admin_logs VALUES(null, NEW.ID, NEW.Name, 'Update', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Admin_Delete` BEFORE DELETE ON `admin` FOR EACH ROW INSERT INTO admin_logs VALUES(null, OLD.ID, OLD.Name, 'Delete', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Admin_Insert` AFTER INSERT ON `admin` FOR EACH ROW INSERT INTO admin_logs VALUES(null, NEW.ID, NEW.Name, 'Inserted', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `ID` int(10) NOT NULL,
  `Admin_ID` int(10) NOT NULL,
  `Admin_Name` varchar(20) NOT NULL,
  `Action` varchar(20) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_logs`
--

INSERT INTO `admin_logs` (`ID`, `Admin_ID`, `Admin_Name`, `Action`, `Date`) VALUES
(1, 1, 'admin', 'Inserted', '2020-10-25 22:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ID` int(10) NOT NULL,
  `First_Name` varchar(254) NOT NULL,
  `Last_Name` varchar(254) NOT NULL,
  `Contact_Number` int(10) NOT NULL,
  `Address_Line1` varchar(254) NOT NULL,
  `Address_Line2` varchar(254) NOT NULL,
  `Address_Line3` varchar(254) NOT NULL,
  `Email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ID`, `First_Name`, `Last_Name`, `Contact_Number`, `Address_Line1`, `Address_Line2`, `Address_Line3`, `Email`) VALUES
(1, 'John', 'Smith', 123456789, '3 East Av', 'Bentley', 'WA 6102', 'john@gmail.com'),
(2, 'Jill', 'Brody', 123456789, '42 Bent St', 'Perth', 'WA 6001', 'jil@gmail.com');

--
-- Triggers `client`
--
DELIMITER $$
CREATE TRIGGER `Client_Delete` BEFORE DELETE ON `client` FOR EACH ROW INSERT INTO client_logs VALUES(null, OLD.ID,OLD.First_Name, 'Delete', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Client_Insert` AFTER INSERT ON `client` FOR EACH ROW INSERT INTO client_logs VALUES(null, NEW.ID, NEW.First_Name,'Inserted', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Client_Update` AFTER UPDATE ON `client` FOR EACH ROW INSERT INTO client_logs VALUES(null, NEW.ID,NEW.First_Name, 'Update', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `client_logs`
--

CREATE TABLE `client_logs` (
  `ID` int(10) NOT NULL,
  `Client_ID` int(10) NOT NULL,
  `Client_Name` varchar(254) NOT NULL,
  `Action` varchar(20) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_logs`
--

INSERT INTO `client_logs` (`ID`, `Client_ID`, `Client_Name`, `Action`, `Date`) VALUES
(1, 1, 'John', 'Inserted', '2020-10-25 20:31:31'),
(2, 2, 'Jill', 'Inserted', '2020-10-25 20:31:31');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Invoice_Number` int(10) NOT NULL,
  `Name` varchar(254) NOT NULL,
  `Date` date NOT NULL,
  `Total_Cost` double(10,2) NOT NULL,
  `Payment` double(10,2) NOT NULL,
  `Balance` double(10,2) NOT NULL,
  `Status` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Invoice_Number`, `Name`, `Date`, `Total_Cost`, `Payment`, `Balance`, `Status`) VALUES
(1, 'John', '2001-10-02', 12000.00, 12000.00, 0.00, 'Approved'),
(2, 'John', '2002-06-08', 21000.00, 21000.00, 0.00, 'Approved'),
(3, 'John', '2000-02-12', 29000.00, 29000.00, 0.00, 'Approved'),
(4, 'John', '2001-04-10', 78000.00, 78000.00, 0.00, 'Approved'),
(5, 'John', '2001-08-11', 64000.00, 64000.00, 0.00, 'Approved'),
(6, 'Jill', '2000-01-30', 10500.00, 10500.00, 0.00, 'Approved'),
(7, 'Jill', '2001-01-30', 21600.00, 21600.00, 0.00, 'Approved'),
(8, 'Jill', '2002-10-02', 12000.00, 12000.00, 0.00, 'Approved'),
(9, 'Jill', '1999-10-05', 12000.00, 12000.00, 0.00, 'Approved'),
(10, 'Jill', '2000-12-12', 27500.00, 27500.00, 0.00, 'Approved');

--
-- Triggers `invoice`
--
DELIMITER $$
CREATE TRIGGER `Invoice_Delete` BEFORE DELETE ON `invoice` FOR EACH ROW INSERT INTO invoice_logs VALUES(null, OLD.Invoice_Number, 'Deleted', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Invoice_Insert` AFTER INSERT ON `invoice` FOR EACH ROW INSERT INTO invoice_logs VALUES(null, NEW.Invoice_Number, 'Inserted', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Invoice_Update` AFTER UPDATE ON `invoice` FOR EACH ROW INSERT INTO invoice_logs VALUES(null, NEW.Invoice_Number, 'Updated', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_logs`
--

CREATE TABLE `invoice_logs` (
  `ID` int(10) NOT NULL,
  `Invoice_Number` int(10) NOT NULL,
  `Action` varchar(20) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice_logs`
--

INSERT INTO `invoice_logs` (`ID`, `Invoice_Number`, `Action`, `Date`) VALUES
(1, 1, 'Inserted', '2020-10-25 20:31:44'),
(2, 2, 'Inserted', '2020-10-25 20:31:44'),
(3, 3, 'Inserted', '2020-10-25 20:31:44'),
(4, 4, 'Inserted', '2020-10-25 20:31:44'),
(5, 5, 'Inserted', '2020-10-25 20:31:44'),
(6, 6, 'Inserted', '2020-10-25 20:31:44'),
(7, 7, 'Inserted', '2020-10-25 20:31:44'),
(8, 8, 'Inserted', '2020-10-25 20:31:44'),
(9, 9, 'Inserted', '2020-10-25 20:31:44'),
(10, 10, 'Inserted', '2020-10-25 20:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_records`
--

CREATE TABLE `invoice_records` (
  `ID` int(10) NOT NULL,
  `Invoice_Number` int(10) NOT NULL,
  `Company_ID` varchar(254) NOT NULL,
  `Company_Name` varchar(254) NOT NULL,
  `Product_ID` varchar(254) NOT NULL,
  `Product_Name` varchar(255) NOT NULL,
  `Price` double(10,2) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `Total` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice_records`
--

INSERT INTO `invoice_records` (`ID`, `Invoice_Number`, `Company_ID`, `Company_Name`, `Product_ID`, `Product_Name`, `Price`, `Quantity`, `Total`) VALUES
(1, 1, 'BHP#0001', 'BHP', '#0001', 'RAM', 12.00, 1000, 12000.00),
(2, 2, 'BHP#0001', 'BHP', '#0001', 'RAM', 10.50, 2000, 21000.00),
(3, 3, 'IBM#0001', 'IBM', '#0002', 'Motherboard', 58.00, 500, 29000.00),
(4, 4, 'IBM#0001', 'IBM', '#0002', 'Motherboard', 65.00, 1200, 78000.00),
(5, 5, 'INFOSYS#0001', 'INFOSYS', '#0003', 'Keyboard', 64.00, 1000, 64000.00),
(6, 6, 'INTEL#0001', 'INTEL', '#0004', 'Hard-Disk', 35.00, 300, 10500.00),
(7, 7, 'INTEL#0001', 'INTEL', '#0004', 'Hard-Disk', 54.00, 400, 21600.00),
(8, 8, 'INTEL#0001', 'INTEL', '#0004', 'Hard-Disk', 60.00, 200, 12000.00),
(9, 9, 'FORD#0001', 'FORD', '#0005', 'USB', 40.00, 300, 12000.00),
(10, 10, 'GM#0001', 'GM', '#0006', 'Micro-SD', 55.00, 500, 27500.00);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `Order_Number` int(100) NOT NULL,
  `Company_ID` varchar(254) NOT NULL,
  `Cost` double(10,2) NOT NULL,
  `Payment` double(10,2) NOT NULL,
  `Balance` double(10,2) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`Order_Number`, `Company_ID`, `Cost`, `Payment`, `Balance`, `Date`) VALUES
(1, 'BHP#0001', 1600000.00, 1600000.00, 0.00, '2020-10-25'),
(2, 'BHP#0001', 1800000.00, 1800000.00, 0.00, '2020-10-25'),
(3, 'IBM#0001', 2250000.00, 2300000.00, 50000.00, '2020-10-25'),
(4, 'GM#0001', 49160.00, 50000.00, 840.00, '2020-10-25');

--
-- Triggers `purchase`
--
DELIMITER $$
CREATE TRIGGER `Purchase_Delete` BEFORE DELETE ON `purchase` FOR EACH ROW INSERT INTO purchase_logs VALUES(null, OLD.Order_Number, 'Deleted', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Purchase_Insert` AFTER INSERT ON `purchase` FOR EACH ROW INSERT INTO purchase_logs VALUES(null, NEW.Order_Number, 'Inserted', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Purchase_Update` AFTER UPDATE ON `purchase` FOR EACH ROW INSERT INTO purchase_logs VALUES(null, NEW.Order_Number, 'Updated', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `ID` int(100) NOT NULL,
  `Order_Number` int(100) NOT NULL,
  `Company_ID` varchar(254) NOT NULL,
  `City` varchar(254) NOT NULL,
  `Product_ID` varchar(254) NOT NULL,
  `Product_Name` varchar(254) NOT NULL,
  `Item_Price` decimal(10,2) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `Cost` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_details`
--

INSERT INTO `purchase_details` (`ID`, `Order_Number`, `Company_ID`, `City`, `Product_ID`, `Product_Name`, `Item_Price`, `Quantity`, `Cost`) VALUES
(1, 1, 'BHP#0001', 'Sydney', '#0007', 'Laptop', '80000.00', 20, 1600000.00),
(2, 2, 'BHP#0001', 'New York', '#0008', 'Computer', '60000.00', 30, 1800000.00),
(3, 3, 'IBM#0001', 'New York', '#0009', 'Tab', '50000.00', 45, 2250000.00),
(4, 4, 'GM#0001', 'New York', '#0010', 'Keyboard', '599.00', 40, 23960.00),
(5, 4, 'GM#0001', 'New York', '#0011', 'Mouse', '560.00', 45, 25200.00);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_logs`
--

CREATE TABLE `purchase_logs` (
  `ID` int(10) NOT NULL,
  `Order_Number` int(100) NOT NULL,
  `Action` varchar(20) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_logs`
--

INSERT INTO `purchase_logs` (`ID`, `Order_Number`, `Action`, `Date`) VALUES
(1, 1, 'Inserted', '2020-10-25 20:56:14'),
(2, 2, 'Inserted', '2020-10-25 20:57:29'),
(3, 3, 'Inserted', '2020-10-25 20:59:59'),
(4, 4, 'Inserted', '2020-10-25 22:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `ready_to_sales_stock`
--

CREATE TABLE `ready_to_sales_stock` (
  `ID` int(100) NOT NULL,
  `Company_ID` varchar(254) NOT NULL,
  `Company_Name` varchar(254) NOT NULL,
  `Product_ID` varchar(254) NOT NULL,
  `Product_Name` varchar(254) NOT NULL,
  `Selling_Price` double(10,2) NOT NULL,
  `Quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ready_to_sales_stock`
--

INSERT INTO `ready_to_sales_stock` (`ID`, `Company_ID`, `Company_Name`, `Product_ID`, `Product_Name`, `Selling_Price`, `Quantity`) VALUES
(1, 'BHP#0001', 'BHP', '#0007', 'Laptop', 100000.00, 20),
(2, 'GM#0001', 'GM', '#0010', 'Keyboard', 750.00, 40);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_company`
--

CREATE TABLE `supplier_company` (
  `ID` int(10) NOT NULL,
  `Company_ID` varchar(254) NOT NULL,
  `Company_Name` varchar(254) NOT NULL,
  `Contact_Number` int(10) NOT NULL,
  `Email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_company`
--

INSERT INTO `supplier_company` (`ID`, `Company_ID`, `Company_Name`, `Contact_Number`, `Email`) VALUES
(1, 'BHP#0001', 'BHP', 123456789, 'bhp@gmail.com'),
(2, 'IBM#0001', 'IBM', 123456789, 'ibm@gmail.com'),
(3, 'INTEl#0001', 'INTEL', 123456789, 'intel@gmail.com'),
(4, 'FORD#0001', 'FORD', 123456789, 'ibm@gmail.com'),
(5, 'GM#0001', 'GM', 123456789, 'gm@gmail.com'),
(6, 'INFOSYS#0001', 'INFOSYS', 123456789, 'infosys@gmail.com');

--
-- Triggers `supplier_company`
--
DELIMITER $$
CREATE TRIGGER `supplier_company_Delete` BEFORE DELETE ON `supplier_company` FOR EACH ROW INSERT INTO supplier_company_logs VALUES(null, OLD.Company_ID, 'Deleted', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `supplier_company_Insert` AFTER INSERT ON `supplier_company` FOR EACH ROW INSERT INTO supplier_company_logs VALUES(null, NEW.Company_ID, 'Inserted', NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `supplier_company_Update` AFTER UPDATE ON `supplier_company` FOR EACH ROW INSERT INTO supplier_company_logs VALUES(null, NEW.Company_ID, 'Updated', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_company_logs`
--

CREATE TABLE `supplier_company_logs` (
  `ID` int(10) NOT NULL,
  `Company_ID` varchar(254) NOT NULL,
  `Action` varchar(20) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_company_logs`
--

INSERT INTO `supplier_company_logs` (`ID`, `Company_ID`, `Action`, `Date`) VALUES
(1, 'BHP#0001', 'Inserted', '2020-10-25 20:41:52'),
(2, 'IBM#0001', 'Inserted', '2020-10-25 20:41:52'),
(3, 'INTEl#0001', 'Inserted', '2020-10-25 20:41:52'),
(4, 'FORD#0001', 'Inserted', '2020-10-25 20:41:52'),
(5, 'GM#0001', 'Inserted', '2020-10-25 20:41:52'),
(6, 'INFOSYS#0001', 'Inserted', '2020-10-25 20:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_import_city`
--

CREATE TABLE `supplier_import_city` (
  `ID` int(100) NOT NULL,
  `Supplier_ID` varchar(254) NOT NULL,
  `City` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_import_city`
--

INSERT INTO `supplier_import_city` (`ID`, `Supplier_ID`, `City`) VALUES
(1, 'BHP#0001', 'Sydney'),
(2, 'BHP#0001', 'New York'),
(3, 'IBM#0001', 'New York'),
(4, 'IBM#0001', 'London'),
(5, 'IBM#0001', 'Tokyo'),
(6, 'INTEl#0001', 'New York'),
(7, 'INTEl#0001', 'London'),
(8, 'FORD#0001', 'New York'),
(9, 'GM#0001', 'New York'),
(10, 'INFOSYS#0001', 'New York');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `ID` int(10) NOT NULL,
  `Order_Number` int(10) NOT NULL,
  `Company_ID` varchar(254) NOT NULL,
  `Company_Name` varchar(254) DEFAULT NULL,
  `Product_ID` varchar(254) NOT NULL,
  `Product_Name` varchar(254) NOT NULL,
  `Item_Price` double(10,2) NOT NULL,
  `Quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`ID`, `Order_Number`, `Company_ID`, `Company_Name`, `Product_ID`, `Product_Name`, `Item_Price`, `Quantity`) VALUES
(2, 2, 'BHP#0001', 'BHP', '#0008', 'Computer', 60000.00, 30),
(3, 3, 'IBM#0001', 'IBM', '#0009', 'Tab', 50000.00, 45),
(5, 5, 'GM#0001', 'GM', '#0011', 'Mouse', 560.00, 45);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `client_logs`
--
ALTER TABLE `client_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Invoice_Number`);

--
-- Indexes for table `invoice_logs`
--
ALTER TABLE `invoice_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `invoice_records`
--
ALTER TABLE `invoice_records`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Fk2` (`Invoice_Number`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`Order_Number`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Fk` (`Order_Number`);

--
-- Indexes for table `purchase_logs`
--
ALTER TABLE `purchase_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ready_to_sales_stock`
--
ALTER TABLE `ready_to_sales_stock`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `supplier_company`
--
ALTER TABLE `supplier_company`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `supplier_company_logs`
--
ALTER TABLE `supplier_company_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `supplier_import_city`
--
ALTER TABLE `supplier_import_city`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client_logs`
--
ALTER TABLE `client_logs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `Invoice_Number` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_logs`
--
ALTER TABLE `invoice_logs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_records`
--
ALTER TABLE `invoice_records`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `Order_Number` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_logs`
--
ALTER TABLE `purchase_logs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ready_to_sales_stock`
--
ALTER TABLE `ready_to_sales_stock`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier_company`
--
ALTER TABLE `supplier_company`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supplier_company_logs`
--
ALTER TABLE `supplier_company_logs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supplier_import_city`
--
ALTER TABLE `supplier_import_city`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_records`
--
ALTER TABLE `invoice_records`
  ADD CONSTRAINT `Fk2` FOREIGN KEY (`Invoice_Number`) REFERENCES `invoice` (`Invoice_Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `Fk` FOREIGN KEY (`Order_Number`) REFERENCES `purchase` (`Order_Number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

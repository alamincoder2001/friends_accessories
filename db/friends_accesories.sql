-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2023 at 01:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `friends_accesories`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `Acc_SlNo` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`Acc_SlNo`, `branch_id`, `Acc_Code`, `Acc_Tr_Type`, `Acc_Name`, `Acc_Type`, `Acc_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 1, 'A0001', '', 'Conveyance Exp', '', '', 'a', 'Admin', '2022-12-28 12:32:47', NULL, NULL),
(2, 1, 'A0002', '', 'Office Maintenance Exp', '', '', 'a', 'Admin', '2022-12-28 12:33:59', NULL, NULL),
(3, 1, 'A0003', '', 'Link Up technology Ltd', '', '', 'd', 'Admin', '2023-01-22 18:04:14', NULL, NULL),
(4, 1, 'A0004', '', 'Delivery Exp', '', 'Selling exp', 'a', 'Admin', '2023-02-08 16:45:12', NULL, NULL),
(5, 1, 'A0005', '', 'Entertainment Exp', '', 'Administrative Exp', 'a', 'Admin', '2023-02-08 16:46:07', NULL, NULL),
(6, 1, 'A0006', '', 'Bank charge', '', '', 'a', 'Admin', '2023-02-25 10:48:14', NULL, NULL),
(7, 1, 'A0007', '', 'Electricity Bill', '', 'Administrative Exp', 'a', 'Admin', '2023-02-26 14:55:24', NULL, NULL),
(8, 1, 'A0008', '', 'Factory Rent', '', 'Administrative Exp', 'a', 'Admin', '2023-03-02 10:19:45', 'Admin', '2023-03-02 10:25:49'),
(9, 1, 'A0009', '', 'Software development(Link up Technology)', '', 'Administrative Exp', 'a', 'Admin', '2023-03-02 12:02:40', NULL, NULL),
(10, 1, 'A0010', '', 'Business development expense', '', 'Selling exp', 'a', 'Admin', '2023-03-12 10:32:56', NULL, NULL),
(11, 1, 'A0011', '', 'Carriage In-word', '', 'Administrative Exp', 'a', 'Admin', '2023-03-12 12:01:08', NULL, NULL),
(12, 1, 'A0012', '', 'Internet bill', '', 'Administrative Exp', 'a', 'Admin', '2023-03-12 12:13:02', NULL, NULL),
(13, 1, 'A0013', '', 'Dearness Allowance(D/A bill)', '', 'Administrative Exp', 'a', 'Admin', '2023-03-12 12:28:32', NULL, NULL),
(14, 1, 'A0014', '', 'Wastage sales', '', 'others income', 'a', 'Admin', '2023-03-13 14:21:40', 'Admin', '2023-03-13 14:23:37'),
(15, 1, 'A0015', '', 'Printing & Stationary', '', '', 'a', 'Admin', '2023-03-13 14:57:04', NULL, NULL),
(16, 1, 'A0016', '', 'Production Utilities Exp.', '', '', 'a', 'Admin', '2023-03-13 16:07:09', 'Admin', '2023-03-14 13:02:27'),
(17, 1, 'A0017', '', 'Printing & Packaging', '', '', 'a', 'Admin', '2023-03-14 11:06:16', NULL, NULL),
(18, 1, 'A0018', '', 'Repair & Maintenance Machinery', '', '', 'a', 'Admin', '2023-03-14 13:12:52', NULL, NULL),
(19, 1, 'A0019', '', 'Denim trade international', '', '', 'a', 'Admin', '2023-03-23 13:08:40', 'Admin', '2023-03-28 15:37:10'),
(20, 1, 'A0020', '', 'Index Logistics Ltd.', '', '', 'a', 'Admin', '2023-03-23 13:09:41', 'Admin', '2023-03-28 15:39:54'),
(21, 1, 'A0021', '', 'Transport cost', '', '', 'a', 'Admin', '2023-03-23 13:10:15', NULL, NULL),
(22, 1, 'A0022', '', 'Karnaphuli insurance limited', '', '', 'a', 'Admin', '2023-03-28 16:41:51', NULL, NULL),
(23, 1, 'A0023', '', 'Courier Bill ', '', '', 'a', 'Admin', '2023-04-12 11:55:50', NULL, NULL),
(24, 1, 'A0024', '', 'Repair & Maintenance Exp', '', '', 'a', 'Admin', '2023-04-12 13:26:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assets`
--

CREATE TABLE `tbl_assets` (
  `as_id` int(11) NOT NULL,
  `as_date` date DEFAULT NULL,
  `as_name` varchar(50) DEFAULT NULL,
  `as_sp_name` varchar(100) DEFAULT NULL,
  `as_qty` int(11) DEFAULT NULL,
  `as_rate` decimal(10,2) DEFAULT NULL,
  `as_amount` decimal(10,2) DEFAULT NULL,
  `buy_or_sale` enum('buy','sale') NOT NULL DEFAULT 'buy',
  `valuation` decimal(20,2) DEFAULT 0.00,
  `unit_valuation` decimal(20,2) DEFAULT 0.00,
  `as_note` text DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `branchid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_accounts`
--

CREATE TABLE `tbl_bank_accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `description` varchar(2000) NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_bank_accounts`
--

INSERT INTO `tbl_bank_accounts` (`account_id`, `account_name`, `account_number`, `account_type`, `bank_name`, `branch_name`, `initial_balance`, `description`, `saved_by`, `saved_datetime`, `updated_by`, `updated_datetime`, `branch_id`, `status`) VALUES
(1, 'HELIX ELECTRICALS  LIMITED', '05010110002458', 'Current Account', 'UNION BANK LTD. 2458)', 'MYMENSINGH', 0, '', 1, '2023-02-25 10:42:38', 1, '2023-03-09 10:06:40', 1, 1),
(2, 'Helix Electricals Ltd', '60633000094', 'Current Account', 'Bank Asia 0094)', 'Mymensing', 0, '', 1, '2023-03-09 09:49:29', 1, '2023-03-09 10:06:55', 1, 1),
(3, 'Helix Electricals Ltd.', '0072-02100-12452', 'Current Account', 'NCC Bank Ltd', 'Mymensingh', 0, '', 1, '2023-05-22 18:04:16', 1, '2023-05-25 09:58:13', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_transactions`
--

CREATE TABLE `tbl_bank_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_SiNo` int(11) NOT NULL,
  `ProductCategory_SlNo` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL,
  `brand_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brunch`
--

CREATE TABLE `tbl_brunch` (
  `brunch_id` int(11) NOT NULL,
  `Brunch_name` varchar(250) NOT NULL,
  `Brunch_title` varchar(250) NOT NULL,
  `Brunch_address` text NOT NULL,
  `Brunch_sales` varchar(1) NOT NULL COMMENT 'Wholesales = 1, Retail = 2',
  `add_date` date NOT NULL,
  `add_time` datetime NOT NULL,
  `add_by` char(50) NOT NULL,
  `update_by` char(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `is_production` varchar(10) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_brunch`
--

INSERT INTO `tbl_brunch` (`brunch_id`, `Brunch_name`, `Brunch_title`, `Brunch_address`, `Brunch_sales`, `add_date`, `add_time`, `add_by`, `update_by`, `status`, `is_production`) VALUES
(1, 'Main Branch', 'Friends Accessories', '9, Saheb Ali Road, (1st floor), Natun Bazer, Mymensingh-2200', '', '2022-06-12', '2022-06-12 06:40:28', '', 'Admin', 'a', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashtransaction`
--

CREATE TABLE `tbl_cashtransaction` (
  `Tr_SlNo` int(11) NOT NULL,
  `Tr_Id` varchar(50) NOT NULL,
  `Tr_date` date NOT NULL,
  `Tr_Type` varchar(20) NOT NULL,
  `Tr_account_Type` varchar(50) NOT NULL,
  `Acc_SlID` int(11) NOT NULL,
  `Tr_Description` varchar(255) NOT NULL,
  `In_Amount` decimal(18,2) NOT NULL,
  `Out_Amount` decimal(18,2) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Tr_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checks`
--

CREATE TABLE `tbl_checks` (
  `id` int(20) UNSIGNED NOT NULL,
  `cus_id` int(20) DEFAULT NULL,
  `SM_id` int(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `check_no` varchar(250) DEFAULT NULL,
  `check_amount` decimal(18,2) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `check_date` timestamp NULL DEFAULT NULL,
  `remid_date` timestamp NULL DEFAULT NULL,
  `sub_date` timestamp NULL DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `check_status` char(5) DEFAULT 'Pe' COMMENT 'Pe =Pending, Pa = Paid',
  `status` char(5) NOT NULL DEFAULT 'a',
  `created_by` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `branch_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

CREATE TABLE `tbl_color` (
  `color_SiNo` int(11) NOT NULL,
  `color_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_companies`
--

CREATE TABLE `tbl_companies` (
  `Company_SlNo` int(11) NOT NULL,
  `Company_Code` varchar(50) NOT NULL,
  `Company_Name` varchar(150) NOT NULL,
  `Company_Phone` varchar(50) NOT NULL,
  `Company_Mobile` varchar(15) NOT NULL,
  `Company_Email` varchar(50) DEFAULT NULL,
  `Company_OfficePhone` varchar(50) NOT NULL,
  `Company_Address` varchar(300) NOT NULL,
  `area_ID` int(11) NOT NULL,
  `Company_Credit_Limit` decimal(18,2) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Company_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_companies`
--

INSERT INTO `tbl_companies` (`Company_SlNo`, `Company_Code`, `Company_Name`, `Company_Phone`, `Company_Mobile`, `Company_Email`, `Company_OfficePhone`, `Company_Address`, `area_ID`, `Company_Credit_Limit`, `previous_due`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Company_brunchid`) VALUES
(1, 'C00001', 'Company name', '', '01737484046', '', '', 'dhaka', 1, '0.00', '0.00', 'a', 'Admin', '2023-10-03 11:02:27', 'Admin', '2023-10-03 11:17:21', 1),
(2, 'C00002', 'New Company', '', '01737484047', '', '', 'dhaka', 3, '0.00', '0.00', 'a', 'Admin', '2023-10-04 16:57:36', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `Company_SlNo` int(11) NOT NULL,
  `Company_Name` varchar(150) NOT NULL,
  `Repot_Heading` text NOT NULL,
  `Company_Logo_org` varchar(250) NOT NULL,
  `Company_Logo_thum` varchar(250) NOT NULL,
  `Invoice_Type` int(11) NOT NULL,
  `Currency_Name` varchar(50) DEFAULT NULL,
  `Currency_Symbol` varchar(10) DEFAULT NULL,
  `SubCurrency_Name` varchar(50) DEFAULT NULL,
  `print_type` int(11) NOT NULL,
  `company_BrunchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`Company_SlNo`, `Company_Name`, `Repot_Heading`, `Company_Logo_org`, `Company_Logo_thum`, `Invoice_Type`, `Currency_Name`, `Currency_Symbol`, `SubCurrency_Name`, `print_type`, `company_BrunchId`) VALUES
(1, 'Friends Accessories', 'Estern Housing, Mirpur-12', 'No-Image-Placeholder_svg.png', 'No-Image-Placeholder_svg.png', 1, 'BDT', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `Country_SlNo` int(11) NOT NULL,
  `CountryName` varchar(50) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currentinventory`
--

CREATE TABLE `tbl_currentinventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_quantity` float NOT NULL,
  `purchase_return_quantity` float NOT NULL,
  `production_quantity` float NOT NULL,
  `sales_quantity` float NOT NULL,
  `sales_return_quantity` float NOT NULL,
  `damage_quantity` float NOT NULL,
  `transfer_from_quantity` float NOT NULL,
  `transfer_to_quantity` float NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_currentinventory`
--

INSERT INTO `tbl_currentinventory` (`inventory_id`, `product_id`, `purchase_quantity`, `purchase_return_quantity`, `production_quantity`, `sales_quantity`, `sales_return_quantity`, `damage_quantity`, `transfer_from_quantity`, `transfer_to_quantity`, `branch_id`) VALUES
(1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(2, 2, 0, 0, 798, 0, 0, 0, 0, 0, 1),
(3, 3, 0, 0, 669, 0, 0, 0, 0, 0, 1),
(4, 1, 0, 0, 1990, 0, 0, 0, 0, 0, 1),
(5, 4, 0, 0, 1450, 0, 0, 0, 0, 0, 1),
(6, 5, 0, 0, 992, 0, 0, 0, 0, 0, 1),
(7, 6, 0, 0, 1495, 2, 0, 0, 0, 0, 1),
(8, 9, 0, 0, 596, 0, 0, 0, 0, 0, 1),
(9, 10, 0, 0, 298, 1, 0, 0, 0, 0, 1),
(10, 11, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(11, 23, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(12, 22, 0, 0, 12, 0, 0, 0, 0, 0, 1),
(13, 21, 0, 0, 7, 0, 0, 0, 0, 0, 1),
(14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(15, 19, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(16, 18, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(17, 17, 0, 0, 10, 0, 0, 0, 0, 0, 1),
(18, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(19, 15, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(20, 12, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `Customer_SlNo` int(11) NOT NULL,
  `Customer_Code` varchar(50) NOT NULL,
  `Customer_Name` varchar(150) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Customer_Type` varchar(50) NOT NULL,
  `Customer_Phone` varchar(50) NOT NULL,
  `Customer_Mobile` varchar(15) NOT NULL,
  `Customer_Email` varchar(50) NOT NULL,
  `Customer_OfficePhone` varchar(50) NOT NULL,
  `Customer_Address` varchar(300) NOT NULL,
  `owner_name` varchar(250) DEFAULT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `area_ID` int(11) NOT NULL,
  `Customer_Web` varchar(50) NOT NULL,
  `Customer_Credit_Limit` decimal(18,2) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Customer_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`Customer_SlNo`, `Customer_Code`, `Customer_Name`, `Company_Id`, `Customer_Type`, `Customer_Phone`, `Customer_Mobile`, `Customer_Email`, `Customer_OfficePhone`, `Customer_Address`, `owner_name`, `Country_SlNo`, `area_ID`, `Customer_Web`, `Customer_Credit_Limit`, `previous_due`, `image_name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Customer_brunchid`) VALUES
(1, 'C00001', 'Maa Enterprise', 1, 'retail', '', '01959269744', '', '', 'Sadar, Narail', 'Md Najim Mina', 0, 1, '', '0.00', '0.00', NULL, 'a', 'Admin', '2022-10-14 15:14:01', NULL, NULL, 1),
(2, 'C00002', 'Mazumder Electrical Store', 1, 'retail', '', '01711613728', '', '', 'Baro Bazar, Natrokona', 'Ratan Mazumder', 0, 2, '', '300000.00', '0.00', NULL, 'a', 'Admin', '2022-10-16 15:50:53', 'Admin', '2022-10-23 12:46:41', 1),
(3, 'C00003', 'Jhanto Electric & Electronics', 1, 'retail', '', '01711176101', '', '', 'Kakoli Market, Shohid bulbul Sarak, Sherpur', 'Ramendronath Saha Belto', 0, 3, '', '500000.00', '0.00', NULL, 'a', 'Admin', '2022-10-16 15:57:28', 'Admin', '2023-03-19 20:06:04', 1),
(4, 'C00004', 'New Light House ', 1, 'retail', '', '01711296146', '', '', 'Duck Bangla Market, Khulna', 'Abu Bokkor Torofder Lito', 0, 4, '', '400000.00', '0.00', NULL, 'a', 'Admin', '2022-10-16 16:08:59', 'Admin', '2023-04-02 20:28:04', 1),
(5, 'C00005', 'Jamuna electric', 1, 'retail', '', '01724902510', '', '', 'Jc Goho Road', 'Biddut Chandra Saha', 0, 5, '', '200000.00', '0.00', NULL, 'd', 'Admin', '2022-10-25 21:53:56', NULL, NULL, 1),
(6, 'C00006', 'Shishir Electric & Electronics', 1, 'retail', '', '01724902510', '', '', 'JC Goha Road ,Mymensingh', 'Biddut Chandra Saha', 0, 5, '', '300000.00', '0.00', NULL, 'a', 'Admin', '2022-10-26 15:32:37', NULL, NULL, 1),
(7, 'C00007', 'Alam Eletric', 1, 'retail', '', '01711247582', '', '', 'Nakla, Sherpur', 'A K M Mahbubul Alam Sabuj', 0, 6, '', '200000.00', '0.00', NULL, 'a', 'Admin', '2022-11-11 11:07:53', NULL, NULL, 1),
(8, 'C00008', 'Mymensingh Electric', 1, 'retail', '', '01712604549', '', '', 'TN Roy Road, Sadar Mymensingh', 'Fajol Hoque Sikder', 0, 5, '', '200000.00', '0.00', NULL, 'a', 'Admin', '2022-11-12 11:54:46', 'Admin', '2022-11-29 17:22:06', 1),
(9, 'C00009', 'Sun Sine Electric', 1, 'retail', '', '01712010606', '', '', 'TN Roy Road, Sadar ,Mymensingh', 'Farhana Bipasa', 0, 5, '', '500000.00', '0.00', NULL, 'a', 'Admin', '2022-11-12 12:18:46', 'Admin', '2023-08-31 10:33:01', 1),
(10, 'C00010', 'Ujjol Electric House', 1, 'retail', '', '01710403218', '', '', 'TN Roy Road,Sadar,Mymensingh', 'Ujjol sarkar', 0, 5, '', '200000.00', '0.00', NULL, 'a', 'Admin', '2022-11-13 18:11:45', 'Admin', '2023-03-16 17:57:04', 1),
(11, 'C00011', 'Dhaka electric', 1, 'retail', '', '01620393834', '', '', 'ram babu road', 'shah mohammad siam', 0, 5, '', '150000.00', '0.00', NULL, 'a', 'Admin', '2023-01-04 16:53:27', 'Admin', '2023-03-28 16:18:38', 1),
(12, 'C00012', 'Seba Electric', 1, 'retail', '', '01718820842', '', '', 'Ram babu Road', 'Rinko Sarkar', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-01-09 18:47:56', NULL, NULL, 1),
(13, 'C00013', 'AL Razzak Electric', 1, 'retail', '', '01711962842', '', '', 'Hazi M. Rahman Electric market, 36/44, Nandankanan, Chittagong', '', 0, 7, '', '300000.00', '0.00', NULL, 'a', 'Admin', '2023-01-17 12:52:33', 'Admin', '2023-04-13 16:10:41', 1),
(14, 'C00014', 'M/s Sanath Electric', 1, 'retail', '', '01740818407', '', '', 'TN Roy Road, Mymensing', '', 0, 5, '', '300000.00', '0.00', NULL, 'a', 'Admin', '2023-01-18 19:23:18', NULL, NULL, 1),
(15, 'C00015', 'Urmy Electric', 1, 'retail', '', '01711171675', '', '', 'Ram babu road, Mymensingh', 'Uttom Gosh', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-02-01 14:17:35', 'Admin', '2023-02-01 14:55:13', 1),
(16, 'C00016', 'Turag Enterprise', 1, 'retail', '', '01716772142', '', '', 'Muktagacha , Mymensing', 'MR. Hafizur Rahman', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-02-16 18:01:15', NULL, NULL, 1),
(17, 'C00017', 'New Dhaka Electric', 1, 'retail', '', '01701262530', '', '', 'Rambabu road, Mymensingh', 'Mr. Hedayetul Islam Ratul', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-03-13 15:00:24', NULL, NULL, 1),
(18, 'C00018', 'Ratan Electric', 1, 'retail', '', '01745115388', '', '', 'TN roy road, Mymensingh', 'Mr. Ratan', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-03-13 15:05:12', NULL, NULL, 1),
(19, 'C00019', 'Jhalak Enterprise', 1, 'retail', '', '01716297872', '', '', 'JC Guho road, Mymmensingh', 'Mr. Shafiqul Alam Shipon', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-03-14 16:55:00', NULL, NULL, 1),
(20, 'C00020', 'Electric Center', 1, 'retail', '', '01931420730', '', '', 'TN roy road, Mymensingh', 'Mr. Abul Hashem', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-03-14 17:13:44', NULL, NULL, 1),
(21, 'C00021', 'New jamuna Electric', 1, 'retail', '', '01739855008', '', '', 'Rambabu road', 'sampad saha', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-03-15 17:27:19', NULL, NULL, 1),
(22, 'C00022', 'Doha Electric', 1, 'retail', '', '01929910149', '', '', 'rambabu Road', 'wahidojjaman mia', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-03-15 17:28:41', NULL, NULL, 1),
(23, 'C00023', ' New SM Electric', 1, 'retail', '', '01916242442', '', '', 'Rambabu road', 'Pappu', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-03-15 17:29:38', 'Admin', '2023-05-31 10:44:55', 1),
(24, 'C00024', 'Chairman sir', 1, 'retail', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2023-03-21 16:48:43', 'Admin', '2023-04-10 12:58:00', 1),
(25, 'C00025', 'Chairman sir', 1, 'retail', '', '', '', '', '', NULL, 0, 0, '', '0.00', '0.00', NULL, 'a', 'Admin', '2023-03-21 16:49:29', 'Admin', '2023-04-08 15:39:28', 1),
(26, 'C00026', 'M/s Hashem Electric', 1, 'retail', '', '01713561349', '', '', 'Fulbaria road, Dapunia Bazar, Mymensingh', 'Mr. Md. Abul Hashem', 0, 5, '', '200000.00', '0.00', NULL, 'a', 'Admin', '2023-03-27 11:42:22', 'Admin', '2023-04-13 20:10:27', 1),
(27, 'C00027', 'Electric point', 1, 'retail', '', '01747122422', '', '', '21, Rambabu road,City school road, Mymensingh', '', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-03-29 10:41:50', NULL, NULL, 1),
(28, 'C00028', 'Karim Electric', 1, 'retail', '', '01888001876', '', '', 'Rambabu road, Mymensingh', '', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-03-29 10:43:25', 'Admin', '2023-06-04 16:23:09', 1),
(29, 'C00029', 'Islamia Electric', 1, 'retail', '', '01713523512', '', '', 'Tarakanda bazar main road ,tarakanda', 'Md. Emdadul hoque', 0, 5, '', '150000.00', '0.00', NULL, 'a', 'Admin', '2023-03-29 17:42:27', 'Admin', '2023-05-14 12:59:39', 1),
(30, 'C00030', 'Dolal Electronics', 1, 'retail', '', '01712527952', '', '', 'Rambabu Road,Mymensingh', 'Dolal', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-04-10 09:53:43', NULL, NULL, 1),
(31, 'C00031', 'Dhala  Paper And Electric House', 1, 'retail', '', '01933310012', '', '', 'J.C Goha Road,Mymensingh', 'Jasim Uddin', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-04-10 09:55:57', NULL, NULL, 1),
(32, 'C00032', 'Shithi Electric', 1, 'retail', '', '01737878100', '', '', 'Rambabu Road, Mymensingh', 'Mr. Mithun Shaha', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-04-12 11:46:48', 'Admin', '2023-04-12 13:29:58', 1),
(33, 'C00033', 'Atik Enterprise', 1, 'retail', '', '01726473201', '', '', 'Katgola Bazar,Sadar, Mymensingh', 'Ataur Rahman Atik', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-04-15 21:22:30', NULL, NULL, 1),
(34, 'C00034', 'Zaman Radio Service', 1, 'retail', '', '01911074053', '', '', 'Rambabu Road, Sadar, Mymensingh', 'Dr.Saima Zaman', 0, 5, '', '200000.00', '0.00', NULL, 'a', 'Admin', '2023-04-16 20:56:17', NULL, NULL, 1),
(35, 'C00035', 'Badhon Electric', 1, 'retail', '', '01727252341', '', '', 'Rambabu Road Mymensingh', 'Bappi Da Badhon', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-04-16 20:59:06', 'Admin', '2023-04-16 22:00:39', 1),
(36, 'C00036', 'Mithila Electric & telecom', 1, 'retail', '', '01971719034', '', '', 'Madan Babu Road,Mymensing', 'Khokon rai', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-04-18 19:37:42', NULL, NULL, 1),
(37, 'C00037', 'M/s Mona Electric House', 1, 'retail', '', '01768963003', '', '', 'Hazi Mohammad Mohshin road(Chapa Mashjid), Pabna', 'Md. Atikur Rahman(Mona)', 0, 10, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-04-26 14:14:20', NULL, NULL, 1),
(38, 'C00038', 'Amir Electric', 1, 'retail', '', '01737125266', '', '', '304/2 Chorpara mor, Mymensingh', 'Md. Amirul Islam', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-04-30 09:32:35', NULL, NULL, 1),
(39, 'C00039', 'Ashik Electric', 1, 'retail', '', '01748021052', '', '', 'Near Mayor Market, Trishal Bazar, Trishal , Mymensingh', 'Mr. Ashik Sharker', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-04-30 09:49:38', NULL, NULL, 1),
(40, 'C00040', 'Ribu Electric & Hardware', 1, 'retail', '', '01724734962', '', '', '186/16 Doladia (Saleha Market), Shadar, Mymensingh', 'Md. Akram Hossain', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-02 18:37:54', NULL, NULL, 1),
(41, 'C00041', 'Janata Electric Store', 1, 'retail', '', '01799652725', '', '', 'Main road , Old bus stand , Muktagacha, Mymensingh', 'Md. Farhad Hossen', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-05-02 18:44:15', NULL, NULL, 1),
(42, 'C00042', 'Kanchan Store', 1, 'retail', '', '01925618619', '', '0', 'Bodorer more', 'Md Abul Kaiom', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-05-04 19:34:58', NULL, NULL, 1),
(43, 'C00043', 'Vai Vai Traders', 1, 'retail', '', '01734115114', '', '', 'Galaganda 3 raster morw mymensing', 'Mohammad Faruk', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-05-06 19:06:00', 'Admin', '2023-05-09 11:48:23', 1),
(44, 'C00044', 'Chan Mia Store', 1, 'retail', '', '01739674830', '', '', 'Aqua natun Bus stand, Mymensingh', 'Md. Jwel Rana', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-07 09:47:07', 'Admin', '2023-05-07 09:52:24', 1),
(45, 'C00045', 'Maher Electric', 1, 'retail', '', '01770097038', '', '', '29, Pandit para Road, Jila School Mor , Mymensingh', 'Md. Lukman Hossain', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-08 18:23:16', NULL, NULL, 1),
(46, 'C00046', 'Vai vai Enterprise, Saleha Market', 1, 'retail', '', '01919128149', '', '', 'DUladia Taltola, Saleha Market, Mymensingh', 'Mr. Farhad', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-09 11:47:40', NULL, NULL, 1),
(47, 'C00047', 'Sami Traders', 1, 'retail', '', '01917923490', '', '', 'Duladia Saleha Market, Shadar , Mymensingh', 'Masum Ahmed', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-09 11:50:58', NULL, NULL, 1),
(48, 'C00048', 'Bhai Bhai Store And Enterprise', 1, 'retail', '', '017133445215', '', '', 'Rajendrapur(IN front of Palli biddut Office) chollisha, Netrokuna', 'Md. Habibullah Misbah', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-05-10 11:25:30', NULL, NULL, 1),
(49, 'C00049', 'Sarker Electronics', 1, 'retail', '', '01712954244', '', '', '2 no, ram babu road,mymensing', 'Dipak sarker', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-05-13 10:09:22', 'Admin', '2023-05-13 10:14:38', 1),
(50, 'C00050', 'Netrokuna Electric', 1, 'retail', '', '01714898929', '', '', '21, TN roy road, rambabu road, Mymensingh', 'Md. Arif', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-14 09:43:06', NULL, NULL, 1),
(51, 'C00051', 'Rakhal Store', 1, 'retail', '', '01712980321', '', '', 'Main road, Isshorgonj, Mymensingh', '', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-14 09:48:08', NULL, NULL, 1),
(52, 'C00052', 'Ranju Electric', 2, 'retail', '', '01757220562', '', '', 'Gohail Kandi High school, Mymensingh', 'Nur Mohammad Ranju', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-14 10:01:38', 'Admin', '2023-10-04 17:02:24', 1),
(53, 'C00053', 'Apon Electric', 1, 'retail', '', '01716175822', '', '', 'Charpara Mor, Mymensingh', '', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-14 10:37:31', 'Admin', '2023-10-03 17:44:12', 1),
(54, 'C00054', 'Sharker sanitary Hardware & Electric Store', 2, 'retail', '', '01612287786', '', '', 'Sharker Market, Station road, Begun bari bazar , Shadar, Mymensingh ', 'Md. Azharul Islam', 0, 5, '', '0.00', '0.00', NULL, 'a', 'Admin', '2023-05-20 09:51:17', 'Admin', '2023-10-04 16:58:07', 1),
(55, 'C00055', 'Islam Electronics', 1, 'retail', '', '01715208192', '', '', '94, Jobbar Ali Complex, Rambabu road, Mymensingh', 'Nazrul Islam', 0, 5, '', '50000.00', '0.00', NULL, 'a', 'Admin', '2023-05-21 10:26:59', 'Admin', '2023-10-03 17:43:57', 1),
(56, 'C00056', 'Majumder Electric, Mymensingh', 1, 'retail', '', '01710546970', '', '', 'TN Roy road, Amlapara , Sadar , Mymensingh', '', 0, 5, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2023-05-28 10:01:55', 'Admin', '2023-10-03 17:43:51', 1),
(57, 'C00057', 'Sharif Sanitary Mart ', 2, 'retail', '', '01761526694', '', '', 'Dhanikhola Bazar, Katakhali road, Trishal', 'Md. Sharif Uddin', 0, 5, '', '0.00', '0.00', NULL, 'a', 'Admin', '2023-05-28 15:00:12', 'Admin', '2023-10-04 16:58:01', 1),
(58, 'C00058', 'FAHIM ELECTRIC', 2, 'retail', '', '01729474560', '', '', 'Jail road katgola Bazar, Mymensingh', 'MONIRUZZAMAN TIPU', 0, 5, '', '0.00', '0.00', NULL, 'a', 'Admin', '2023-05-31 10:20:16', 'Admin', '2023-10-04 16:57:54', 1),
(59, 'B00059', 'Nayeem Electric', 1, 'retail', '', '01734226071', '', '', 'Atani Bazar, Muktagacha, Mymensingh', 'Nayeem Ahmmed', 0, 5, '', '0.00', '0.00', NULL, 'a', 'Admin', '2023-06-03 09:29:33', 'Admin', '2023-10-03 11:38:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_payment`
--

CREATE TABLE `tbl_customer_payment` (
  `CPayment_id` int(11) NOT NULL,
  `CPayment_date` date DEFAULT NULL,
  `CPayment_invoice` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CPayment_customerID` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CPayment_TransactionType` varchar(20) DEFAULT NULL,
  `CPayment_amount` decimal(18,2) DEFAULT NULL,
  `out_amount` float NOT NULL DEFAULT 0,
  `CPayment_Paymentby` varchar(50) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `CPayment_notes` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CPayment_brunchid` int(11) DEFAULT NULL,
  `CPayment_previous_due` float NOT NULL DEFAULT 0,
  `CPayment_Addby` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CPayment_AddDAte` date DEFAULT NULL,
  `CPayment_status` varchar(1) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `CPayment_UpdateDAte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damage`
--

CREATE TABLE `tbl_damage` (
  `Damage_SlNo` int(11) NOT NULL,
  `Damage_InvoiceNo` varchar(50) NOT NULL,
  `Damage_Date` date NOT NULL,
  `Damage_Description` varchar(300) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Damage_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damagedetails`
--

CREATE TABLE `tbl_damagedetails` (
  `DamageDetails_SlNo` int(11) NOT NULL,
  `Damage_SlNo` int(11) NOT NULL,
  `Product_SlNo` int(11) NOT NULL,
  `DamageDetails_DamageQuantity` float NOT NULL,
  `damage_rate` float NOT NULL,
  `damage_amount` float NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `Department_SlNo` int(11) NOT NULL,
  `Department_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`Department_SlNo`, `Department_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Factory', 'a', 'Admin', '2022-06-12 16:52:30', NULL, NULL),
(2, 'Sales ', 'a', 'Admin', '2023-05-16 18:59:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `Designation_SlNo` int(11) NOT NULL,
  `Designation_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_designation`
--

INSERT INTO `tbl_designation` (`Designation_SlNo`, `Designation_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'security', 'a', 'Admin', '2022-06-12 16:52:16', NULL, NULL),
(2, 'Production Manager', 'a', 'Admin', '2022-10-14 14:04:31', NULL, NULL),
(3, 'Production Superviser', 'a', 'Admin', '2022-10-14 14:04:52', NULL, NULL),
(4, 'Production Assistant', 'a', 'Admin', '2022-10-14 14:05:33', NULL, NULL),
(5, 'Asst. Manager Accounts cum Store', 'a', 'Admin', '2022-10-14 14:06:49', 'Admin', '2022-11-19 12:09:57'),
(6, 'Office Assistant', 'a', 'Admin', '2022-10-14 14:07:20', NULL, NULL),
(7, 'Officer sales ', 'a', 'Admin', '2023-04-26 16:34:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `District_SlNo` int(11) NOT NULL,
  `District_Name` varchar(50) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`District_SlNo`, `District_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Narail distric', 'a', 'Admin', '2022-10-14 15:09:43', NULL, NULL),
(2, 'Netrokona Distric', 'a', 'Admin', '2022-10-14 15:10:30', NULL, NULL),
(3, 'Sherpur Sadar, Nalitabari, Sribordi', 'a', 'Admin', '2022-10-16 15:54:27', NULL, NULL),
(4, 'Khulna Distric', 'a', 'Admin', '2022-10-16 16:06:44', NULL, NULL),
(5, 'Mymensingh', 'a', 'Admin', '2022-10-25 21:52:11', NULL, NULL),
(6, 'Nakla', 'a', 'Admin', '2022-11-11 11:04:57', NULL, NULL),
(7, 'Chittagong District', 'a', 'Admin', '2023-01-17 12:48:16', NULL, NULL),
(8, 'Kholna', 'a', 'Admin', '2023-04-02 20:22:49', NULL, NULL),
(9, 'Pabna', 'd', 'Admin', '2023-04-26 12:34:16', NULL, NULL),
(10, 'Pabna District', 'a', 'Admin', '2023-04-26 12:36:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `Employee_SlNo` int(11) NOT NULL,
  `Designation_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Employee_ID` varchar(50) NOT NULL,
  `bio_id` varchar(50) DEFAULT NULL,
  `Employee_Name` varchar(150) NOT NULL,
  `Employee_JoinDate` date NOT NULL,
  `Employee_Gender` varchar(20) NOT NULL,
  `Employee_BirthDate` date NOT NULL,
  `Employee_NID` varchar(50) NOT NULL,
  `Employee_ContactNo` varchar(20) NOT NULL,
  `Employee_Email` varchar(50) NOT NULL,
  `Employee_MaritalStatus` varchar(50) NOT NULL,
  `Employee_FatherName` varchar(150) NOT NULL,
  `Employee_MotherName` varchar(150) NOT NULL,
  `Employee_PrasentAddress` text NOT NULL,
  `Employee_PermanentAddress` text NOT NULL,
  `Employee_Pic_org` varchar(250) NOT NULL,
  `Employee_Pic_thum` varchar(250) NOT NULL,
  `salary_range` int(11) NOT NULL,
  `Employee_Reference` text DEFAULT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(50) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(50) NOT NULL,
  `Employee_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`Employee_SlNo`, `Designation_ID`, `Department_ID`, `Employee_ID`, `bio_id`, `Employee_Name`, `Employee_JoinDate`, `Employee_Gender`, `Employee_BirthDate`, `Employee_NID`, `Employee_ContactNo`, `Employee_Email`, `Employee_MaritalStatus`, `Employee_FatherName`, `Employee_MotherName`, `Employee_PrasentAddress`, `Employee_PermanentAddress`, `Employee_Pic_org`, `Employee_Pic_thum`, `salary_range`, `Employee_Reference`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Employee_brinchid`) VALUES
(1, 1, 1, 'E1001', '', 'Md. Rofiqul Islam', '2022-08-05', 'Male', '1964-01-01', '', '01987133021', '', 'married', 'Lalu Mia', 'Meher Banu', '38/kha, Golapjan road, Kanchi jhuli, sadar, mymensingh', '38/kha, Golapjan road, Kanchi jhuli, sadar, mymensingh', 'E1001.jpg', 'E1001.jpg', 8000, '', 'a', 'Admin', '2022-06-12 16:55:59', 'Admin', '2022-11-30 12:17:49', 1),
(2, 1, 1, 'E1002', '2', 'Md. Abdul Mannan', '2022-05-08', 'Male', '1962-12-01', '', '01867841112', '', 'married', 'late Siraj Ali', 'Late. umme kulsum', 'Lokkhipur, alimnagor, Fulbaria', 'Lokkhipur, alimnagor, Fulbaria', 'E10021.jpg', 'E10021.jpg', 8000, '', 'a', 'Admin', '2022-06-12 16:58:29', 'Admin', '2022-11-30 12:16:56', 1),
(3, 2, 1, 'E1003', '', 'Engr. Mohammad Nasir Uddin', '2022-10-01', 'Male', '1997-07-06', '', '01829050311', 'uddinnasir744@gmail.com', 'unmarried', 'Nabir hosen', 'katiza begum', 'Doladia, mymensigh', '3no shawnirvor Rangunia, chottagram', '', '', 40000, '', 'a', 'Admin', '2022-10-14 14:16:43', 'Admin', '2022-11-30 12:14:38', 1),
(4, 3, 1, 'E1004', '', 'shas enjam raj monir', '2022-10-15', 'Male', '2022-10-14', '', '01777072675', '', 'married', '', '', '23no word,sutiakhali,sadar,mymensigh', 'Fulbaria, mymensigh', '', '', 9000, '', 'a', 'Admin', '2022-10-14 14:23:41', 'Admin', '2023-04-05 13:11:40', 1),
(5, 3, 1, 'E1005', '', 'Md. Razib', '2022-10-15', 'Male', '2001-03-15', '', '01999365559', 'mdrazibk659@gmail.com', 'unmarried', 'Md. Mostafezur Rahaman', 'Achia Begum', 'santi para,doladia, mymensigh', 'Deula, talukdar Bari, Borhan Uddin ,Bhola', '', '', 9000, '', 'a', 'Admin', '2022-10-14 14:30:53', 'Admin', '2023-04-05 13:11:22', 1),
(6, 4, 1, 'E1006', '', 'Nurjahan begum', '2022-10-15', 'Male', '2022-10-15', '', '01967267764', '', 'married', 'Nur islam', 'Joleka begum', 'gonti, mymensigh', 'gonti, mymensigh', 'E1006.jpg', 'E1006.jpg', 6000, '', 'a', 'Admin', '2022-10-14 14:38:15', 'Admin', '2023-04-05 13:10:39', 1),
(7, 4, 1, 'E1007', '', 'Joma akter suma', '2022-10-15', 'Female', '2009-10-04', '', '01939891568', '', 'married', 'chan mia', 'manoara begum', 'Kagdohor, gonti,mymensigh', 'Kagdohor, gonti,mymensigh', 'E1007.jpg', 'E1007.jpg', 5000, '', 'p', 'Admin', '2022-10-14 14:41:33', 'Admin', '2023-01-28 13:13:45', 1),
(8, 4, 1, 'E1008', '', 'Mist. Kajal', '2022-10-15', 'Female', '1980-09-23', '', '01405675582', '', 'married', 'samsuddin', 'rabea khaton', 'Kagdohor, gonti,mymensigh', 'Kagdohor, gonti,mymensigh', 'E1008.jpg', 'E1008.jpg', 6000, '', 'a', 'Admin', '2022-10-14 14:45:23', 'Admin', '2023-04-05 13:10:15', 1),
(9, 4, 1, 'E1009', '', 'Bristi Akter', '2022-10-15', 'Female', '1992-03-01', '', '01000000000', '', 'married', 'Mofajjol hosen', 'Amena Khaton', 'Kagdohor, gonti,mymensigh', 'Kagdohor, gonti,mymensigh', 'E1009.jpg', 'E1009.jpg', 6000, '', 'a', 'Admin', '2022-10-14 14:59:46', 'Admin', '2023-04-05 13:09:58', 1),
(10, 4, 1, 'E1010', '', 'Nasima Begum', '2022-10-15', 'Female', '1984-03-20', '', '01985942642', '', 'married', 'Nayeb ali', 'Rohima Begum', 'Kagdohor, gonti,mymensigh', 'Kagdohor, gonti,mymensigh', 'E1010.jpg', 'E1010.jpg', 6000, '', 'a', 'Admin', '2022-10-14 15:01:43', 'Admin', '2023-04-05 13:09:23', 1),
(11, 4, 1, 'E1011', '', 'Sabina Yeasmin', '2022-10-15', 'Female', '1993-05-05', '', '01911357788', '', 'married', 'Soroj ali', 'Rina Akter', 'Kagdohor, gonti,mymensigh', 'Kagdohor, gonti,mymensigh', 'E1011.jpg', 'E1011.jpg', 6000, '', 'a', 'Admin', '2022-10-14 15:03:41', 'Admin', '2023-04-05 13:01:36', 1),
(12, 4, 1, 'E1012', '2211', 'Mst. Anuwara Begum', '2022-09-01', 'Female', '1982-01-18', '', '01710000000', '', 'married', 'Hasen Ali', 'Salemon Khatun', 'Khagdahar', 'khagdahar', 'E1012.jpg', 'E1012.jpg', 6000, '.', 'a', 'Admin', '2022-11-02 11:12:52', 'Admin', '2023-04-05 13:01:22', 1),
(13, 5, 1, 'E1013', '', 'Janntul Naime', '2022-11-05', 'Male', '2022-11-12', '', '01777476480', 'jannatul.naime@gmail.com', 'married', 'Ibrahim Khalil', 'Fardoushi Begum', 'House no- 09, Uzan Barera, Khan Bari Road, Shadar, Mymensingh', 'House no- 09, Uzan Barera, Khan Bari Road, Shadar, Mymensingh', '', '', 15000, '', 'a', 'Admin', '2022-11-12 13:15:09', 'Admin', '2023-04-05 13:00:51', 1),
(14, 4, 1, 'E1014', '', 'Shamim', '2022-11-01', 'Male', '1990-01-04', '', '01738883847', '', 'married', 'Md.Homaun Kabir', 'Monjila', 'Gohailkandi,Jamtola ,Mymensing', ',Gohailkandi,Jamtola ,Mymensing', 'E1014.jpg', 'E1014.jpg', 7000, '', 'a', 'Admin', '2022-11-30 12:02:33', 'Admin', '2023-05-20 16:31:53', 1),
(15, 1, 1, 'E1015', '', 'Jobayed hossen (Arif) ', '2023-03-16', 'Male', '2023-04-05', '', '01735710122', '', 'married', '', '', 'saleha market , Sadar , Mymensingh', 'saleha market , Sadar , Mymensingh', '', '', 8000, '', 'd', 'Admin', '2023-04-05 15:57:45', '', '', 1),
(16, 7, 1, 'E1016', '', 'Babor Ahmed Jony', '2023-04-06', 'Male', '1989-12-12', '', '01982785811', 'baborahmedjony@gmail.com', 'married', 'Md. Abdul Quddus', 'Satara Parvin', '103/2Dhuladia(Kathgula Balurghat), Shadar Mymensingh', '103/2Dhuladia(Kathgula Balurghat), Shadar Mymensingh', '', '', 8000, '', 'a', 'Admin', '2023-04-26 16:41:45', 'Admin', '2023-05-20 16:30:21', 1),
(17, 7, 1, 'E1017', '', 'Rafiul Islam Shohan', '2023-04-10', 'Male', '2002-06-28', '', '01312021522', 'rafiulislam2021441@gmail.com', 'unmarried', 'Md. Jinnat Ali ', 'Shahanaz begum', '47/11/3, Moinarmor, Kewatkhali Bypass, Sadar, Mymensingh', '47/11/3, Moinarmor, Kewatkhali Bypass, Sadar, Mymensingh', '', '', 0, '', 'a', 'Admin', '2023-04-26 16:47:39', '', '', 1),
(18, 7, 1, 'E1018', '', 'Md. Shawan', '2023-04-08', 'Male', '1999-04-19', '', '01306831385', '', 'unmarried', 'Md. Ruhul Amin', 'Rehima Begum', '3/A, road 88, Gulshan-2, Dhaka-1212', 'Vill: Shampur, POst: Kalupur, Ps: Bhola, Dist : Bhola', '', '', 0, '', 'p', 'Admin', '2023-04-26 16:54:35', 'Admin', '2023-05-09 12:23:24', 1),
(19, 7, 2, 'E1019', '', 'Probir Bashak', '2023-05-16', 'Male', '2023-05-16', '', '01777222091', 'probir bashak1980@gmail.com', 'married', 'Profulla Bashak', 'Chanda Rani Bashak', 'Vill: Sirta, Post: Sirta Bazar,Dist Mymensingh', 'Vill: Sirta, Post: Sirta Bazar,Dist Mymensingh', '', '', 12000, '', 'a', 'Admin', '2023-05-16 18:57:01', 'Admin', '2023-05-16 19:00:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment`
--

CREATE TABLE `tbl_employee_payment` (
  `id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `month_id` int(11) NOT NULL,
  `total_payment_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` char(2) DEFAULT 'a',
  `saved_by` int(11) NOT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment_details`
--

CREATE TABLE `tbl_employee_payment_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `salary` decimal(20,2) NOT NULL DEFAULT 0.00,
  `benefit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `deduction` decimal(20,2) NOT NULL DEFAULT 0.00,
  `net_payable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `payment` decimal(20,2) NOT NULL DEFAULT 0.00,
  `comment` text DEFAULT NULL,
  `saved_by` int(11) UNSIGNED DEFAULT NULL,
  `saved_at` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT 'a',
  `branch_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_head`
--

CREATE TABLE `tbl_expense_head` (
  `id` int(11) NOT NULL,
  `head_name` varchar(100) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status` enum('a','d') DEFAULT 'a',
  `saved_by` int(11) DEFAULT NULL,
  `saved_datetime` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investment_account`
--

CREATE TABLE `tbl_investment_account` (
  `Acc_SlNo` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investment_transactions`
--

CREATE TABLE `tbl_investment_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loan_accounts`
--

CREATE TABLE `tbl_loan_accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(500) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `description` varchar(2000) NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `save_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loan_transactions`
--

CREATE TABLE `tbl_loan_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(30) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_materialcategory`
--

CREATE TABLE `tbl_materialcategory` (
  `ProductCategory_SlNo` int(11) NOT NULL,
  `ProductCategory_Name` varchar(150) NOT NULL,
  `ProductCategory_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `category_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_materialcategory`
--

INSERT INTO `tbl_materialcategory` (`ProductCategory_SlNo`, `ProductCategory_Name`, `ProductCategory_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `category_branchid`) VALUES
(1, 'Base Cap', '', 'a', 'Admin', '2022-11-12 14:03:37', 'Admin', '2023-08-31 14:45:36', 1),
(2, 'Housing', '', 'a', 'Admin', '2022-11-12 14:03:48', '', '', 1),
(3, 'Driver', '', 'a', 'Admin', '2022-11-12 14:03:57', 'Admin', '2023-05-14 17:39:33', 1),
(4, 'Diffuser', '', 'a', 'Admin', '2022-11-12 14:04:19', '', '', 1),
(5, 'PCV/Chip', '', 'a', 'Admin', '2022-11-12 14:04:43', 'Admin', '2022-11-12 14:05:11', 1),
(6, 'Glue', '', 'a', 'Admin', '2023-05-14 17:10:56', '', '', 1),
(7, 'End Cap', '', 'a', 'Admin', '2023-05-14 17:11:18', '', '', 1),
(8, 'Screw', '', 'a', 'Admin', '2023-05-14 17:13:29', '', '', 1),
(9, 'Packet', '', 'a', 'Admin', '2023-05-14 17:13:44', '', '', 1),
(10, 'Master carton', '', 'a', 'Admin', '2023-05-14 17:13:58', '', '', 1),
(11, 'Bettary', '', 'a', 'Admin', '2023-05-14 17:14:21', 'Admin', '2023-08-31 11:23:57', 1),
(12, 'Warrenty card', '', 'a', 'Admin', '2023-05-14 17:14:57', '', '', 1),
(13, 'Connecting wire', '', 'a', 'Admin', '2023-05-14 17:15:18', '', '', 1),
(14, 'Heat sink', '', 'a', 'Admin', '2023-05-14 17:38:51', '', '', 1),
(15, 'Clam', '', 'a', 'Admin', '2023-05-16 15:56:25', '', '', 1),
(16, 'Switch socket', '', 'a', 'Admin', '2023-05-20 13:08:52', '', '', 1),
(17, 'Soldering Iron', '', 'a', 'Admin', '2023-05-31 12:51:07', '', '', 1),
(18, 'Soldering wire', '', 'a', 'Admin', '2023-05-31 12:56:38', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_materials`
--

CREATE TABLE `tbl_materials` (
  `material_id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `reorder_level` float NOT NULL,
  `purchase_rate` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_materials`
--

INSERT INTO `tbl_materials` (`material_id`, `code`, `name`, `category_id`, `reorder_level`, `purchase_rate`, `unit_id`, `status`, `branch_id`, `created_at`) VALUES
(1, 'M0001', 'B22', 1, 0, 3, 1, 1, 1, '2023-03-25 11:11:58'),
(6, 'M0006', '12W Housing', 2, 0, 9, 1, 1, 1, '2023-05-14 11:42:09'),
(7, 'M0007', '15W Housing', 2, 0, 10, 1, 1, 1, '2023-05-14 11:42:54'),
(8, 'M0008', '20W Housing', 2, 0, 12, 1, 1, 1, '2023-05-14 11:43:36'),
(9, 'M0009', '12W AC/DC Housing', 2, 0, 15, 1, 1, 1, '2023-05-14 11:44:44'),
(10, 'M0010', '40W Tube Housing', 2, 0, 60, 1, 1, 1, '2023-05-14 11:48:30'),
(11, 'M0011', '60W tube Housing', 2, 0, 110, 1, 1, 1, '2023-05-14 11:49:05'),
(12, 'M0012', '5W Driver', 3, 0, 18, 1, 1, 1, '2023-05-14 11:53:53'),
(13, 'M0013', '5W diffuser ', 4, 0, 4.8, 1, 1, 1, '2023-05-15 05:17:57'),
(14, 'M0014', '7W Driver', 3, 0, 25, 1, 1, 1, '2023-05-15 05:24:12'),
(15, 'M0015', '5W chip', 5, 0, 15, 1, 1, 1, '2023-05-15 05:25:32'),
(16, 'M0016', '7W Chip', 5, 0, 17, 1, 1, 1, '2023-05-15 05:26:56'),
(17, 'M0017', '7W Diffuser', 4, 0, 5.64, 1, 1, 1, '2023-05-15 05:28:11'),
(18, 'M0018', '9W Driver', 3, 0, 23, 1, 1, 1, '2023-05-15 05:34:50'),
(19, 'M0019', '9W Chip', 5, 0, 16, 1, 1, 1, '2023-05-15 05:36:50'),
(20, 'M0020', '9W Diffuser', 4, 0, 5.88, 1, 1, 1, '2023-05-15 05:39:11'),
(21, 'M0021', '12W Driver', 3, 0, 30, 1, 1, 1, '2023-05-15 06:04:56'),
(22, 'M0022', '12W Chip', 5, 0, 20, 1, 1, 1, '2023-05-15 06:08:02'),
(23, 'M0023', '12W Diffuser', 4, 0, 6, 1, 1, 1, '2023-05-15 06:08:38'),
(24, 'M0024', '15W Driver', 3, 0, 35, 1, 1, 1, '2023-05-16 09:51:57'),
(25, 'M0025', '15W Chip', 5, 0, 24, 1, 1, 1, '2023-05-16 09:52:39'),
(26, 'M0026', '15W Diffuser', 4, 0, 7.39, 1, 1, 1, '2023-05-16 09:53:25'),
(27, 'M0027', '20W Driver', 3, 0, 48, 1, 1, 1, '2023-05-16 09:54:21'),
(28, 'M0028', '20W Chip', 5, 0, 40, 1, 1, 1, '2023-05-16 09:55:08'),
(29, 'M0029', '40W clam', 15, 0, 1, 1, 1, 1, '2023-05-16 09:57:05'),
(30, 'M0030', '40W connecting Wire', 13, 0, 15, 1, 1, 1, '2023-05-16 09:58:08'),
(31, 'M0031', 'Poly bag', 8, 0, 2, 1, 1, 1, '2023-05-16 09:58:49'),
(32, 'M0032', 'Aluminum Housing 40 W tube ', 2, 0, 65, 1, 1, 1, '2023-05-16 09:59:43'),
(33, 'M0033', '40W Tube', 7, 0, 10, 1, 1, 1, '2023-05-16 10:00:53'),
(34, 'M0034', '40W Tube Diffuser', 4, 0, 20.2, 1, 1, 1, '2023-05-16 10:01:38'),
(35, 'M0035', '40W Tube Driver', 3, 0, 80, 1, 1, 1, '2023-05-16 10:02:35'),
(36, 'M0036', '40W Tube Tube chip', 5, 0, 50, 1, 1, 1, '2023-05-16 10:03:09'),
(37, 'M0037', '12W AC/DC plastic heat sink', 14, 0, 5, 1, 1, 1, '2023-05-16 10:05:00'),
(38, 'M0038', '12W AC/DC Bettary', 11, 0, 100, 1, 1, 1, '2023-05-16 10:06:06'),
(39, 'M0039', '12W AC/DC Driver', 3, 0, 95, 1, 1, 1, '2023-05-16 10:08:12'),
(40, 'M0040', '12W AC/DC chip', 5, 0, 61, 1, 1, 1, '2023-05-16 10:08:55'),
(41, 'M0041', '12W AC/DC Diffuser', 4, 0, 10.8436, 1, 1, 1, '2023-05-16 10:09:48'),
(42, 'M0042', '12W AC/DC Base wire', 13, 0, 5, 1, 1, 1, '2023-05-16 10:10:27'),
(43, 'M0043', '20W Deffuser', 4, 0, 11.9374, 1, 1, 1, '2023-05-16 10:25:54'),
(44, 'M0044', '60W tube clam', 15, 0, 1, 1, 1, 1, '2023-05-20 06:32:04'),
(45, 'M0045', '60W Connecting wire', 13, 0, 20, 1, 1, 1, '2023-05-20 06:32:39'),
(46, 'M0046', '60W tube End cap', 7, 0, 15, 1, 1, 1, '2023-05-20 06:35:07'),
(47, 'M0047', '60W Tube Driver', 3, 0, 105, 1, 1, 1, '2023-05-20 06:35:46'),
(48, 'M0048', '60W tube chip', 5, 0, 65, 1, 1, 1, '2023-05-20 06:36:48'),
(49, 'M0049', '60W tube diffuser', 4, 0, 29, 1, 1, 1, '2023-05-20 06:38:57'),
(50, 'M0050', '1 Gang 1 Way switch', 16, 0, 77, 1, 1, 1, '2023-05-20 07:11:32'),
(51, 'M0051', '2 Gang 1Way switch', 16, 0, 91, 1, 1, 1, '2023-05-20 07:12:21'),
(52, 'M0052', '3 Gang 1 Way', 16, 0, 130, 1, 1, 1, '2023-05-20 07:13:03'),
(53, 'M0053', '4 Gang 1 Way switch', 16, 0, 150, 1, 1, 1, '2023-05-20 07:13:37'),
(54, 'M0054', 'Fan dimmer', 16, 0, 207, 1, 1, 1, '2023-05-20 07:14:42'),
(55, 'M0055', '15 A round socket', 16, 0, 150, 1, 1, 1, '2023-05-20 07:15:45'),
(56, 'M0056', '2 Pin Socket', 16, 0, 139, 1, 1, 1, '2023-05-20 07:17:07'),
(57, 'M0057', '5 Pin Multi socket', 16, 0, 149, 1, 1, 1, '2023-05-20 07:17:54'),
(58, 'M0058', 'TV Socket', 16, 0, 125, 1, 1, 1, '2023-05-20 07:19:35'),
(59, 'M0059', '45A DP Switch', 16, 0, 272, 1, 1, 1, '2023-05-20 07:20:48'),
(60, 'M0060', 'Bell Switch', 16, 0, 95, 1, 1, 1, '2023-05-20 07:22:36'),
(61, 'M0061', '5W packet', 9, 0, 4.3, 1, 1, 1, '2023-05-20 13:58:30'),
(62, 'M0062', '7W packet', 9, 0, 4.8, 1, 1, 1, '2023-05-20 13:59:09'),
(63, 'M0063', '9W packet', 9, 0, 4.8, 1, 1, 1, '2023-05-20 14:00:07'),
(64, 'M0064', '12W packet', 9, 0, 5.5, 1, 1, 1, '2023-05-20 14:00:35'),
(65, 'M0065', '15W packet', 9, 0, 7.3, 1, 1, 1, '2023-05-20 14:01:03'),
(66, 'M0066', '20W packet', 9, 0, 8.8, 1, 1, 1, '2023-05-20 14:01:47'),
(67, 'M0067', '5W Master cartoon(size: 12x12x9)', 10, 0, 32, 1, 1, 1, '2023-05-21 07:01:43'),
(68, 'M0068', '7W Master cartoon(size: 13.5x13.5x10.5)', 10, 0, 35, 1, 1, 1, '2023-05-21 07:02:45'),
(69, 'M0069', '9W Master cartoon( size: 13.5x13.5x10.5)', 10, 0, 35, 1, 1, 1, '2023-05-21 07:04:38'),
(70, 'M0070', '12W Master cartoon( size: 14.5x14.5x11.5)', 10, 0, 50, 1, 1, 1, '2023-05-21 07:06:44'),
(71, 'M0071', '15W Master Cartoon ( Size: 16x16x12.5)', 10, 0, 56, 1, 1, 1, '2023-05-21 07:08:06'),
(72, 'M0072', '20W Master cartoon(size: 19x19x14)', 10, 0, 60, 1, 1, 1, '2023-05-21 07:09:41'),
(73, 'M0073', '12W AC/DC Master cartoon(size: 17x17x13', 10, 0, 56, 1, 1, 1, '2023-05-21 07:10:52'),
(74, 'M0074', '40W Tube Packet', 9, 0, 23.5, 1, 1, 1, '2023-05-21 07:27:49'),
(75, 'M0075', 'Silicon Glue', 6, 0, 190, 1, 1, 1, '2023-05-22 06:31:30'),
(76, 'M0076', 'Silicon Glue Gun', 6, 0, 280, 1, 1, 1, '2023-05-22 06:33:26'),
(77, 'M0077', 'OCI glue', 6, 0, 180, 1, 1, 1, '2023-05-25 11:06:37'),
(78, 'M0078', 'Switch socket Box', 9, 0, 21.5, 1, 1, 1, '2023-05-27 12:16:53'),
(79, 'M0079', 'Sticker(Swich & Socket)', 9, 0, 0.5833, 1, 1, 1, '2023-05-27 12:18:06'),
(80, 'M0080', '12W AC/DC Packet', 9, 0, 7.3, 1, 1, 1, '2023-05-31 05:54:48'),
(81, 'M0081', 'Soldering wire 1.6', 18, 0, 2450, 1, 1, 1, '2023-05-31 06:59:08'),
(82, 'M0082', 'Vass 60W Iron', 17, 0, 150, 1, 1, 1, '2023-05-31 07:10:06'),
(83, 'M0083', 'High insulation iron-6n', 17, 0, 180, 1, 1, 1, '2023-05-31 07:12:19'),
(84, 'M0084', 'High insulation iron', 17, 0, 230, 1, 1, 1, '2023-05-31 07:13:50'),
(85, 'M0085', 'Maraj Electric Iron', 17, 0, 230, 1, 1, 1, '2023-05-31 07:14:34'),
(86, 'M0086', 'Iron Stand', 17, 0, 70, 1, 1, 1, '2023-05-31 07:15:03'),
(87, 'M0087', '40W Tube master Cartoon', 10, 0, 60, 1, 1, 1, '2023-06-03 10:33:59'),
(88, 'M0088', 'print screen', 10, 0, 500, 1, 1, 1, '2023-06-03 10:41:08'),
(90, 'M0089', 'Test Metarial', 8, 0, 10, 1, 1, 1, '2023-08-31 06:53:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_damage`
--

CREATE TABLE `tbl_material_damage` (
  `damage_id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `damage_date` date NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `added_by` int(11) NOT NULL,
  `added_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_damage_details`
--

CREATE TABLE `tbl_material_damage_details` (
  `damage_details_id` int(11) NOT NULL,
  `damage_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `damage_quantity` float NOT NULL,
  `damage_rate` float NOT NULL DEFAULT 0,
  `damage_amount` float NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_purchase`
--

CREATE TABLE `tbl_material_purchase` (
  `purchase_id` int(11) NOT NULL,
  `requisition_id` int(11) NOT NULL DEFAULT 0,
  `supplier_id` int(11) NOT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `purchase_for` int(11) NOT NULL,
  `sub_total` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `transport_cost` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `paid` float DEFAULT NULL,
  `due` float DEFAULT NULL,
  `previous_due` float NOT NULL,
  `note` varchar(2000) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_material_purchase`
--

INSERT INTO `tbl_material_purchase` (`purchase_id`, `requisition_id`, `supplier_id`, `invoice_no`, `purchase_date`, `purchase_for`, `sub_total`, `vat`, `transport_cost`, `discount`, `total`, `paid`, `due`, `previous_due`, `note`, `status`, `branch_id`) VALUES
(1, 0, 13, 'MP-0001', '2023-09-13', 1, 1130, 0, 0, 0, 1130, 1130, 0, 0, '', 'a', 1),
(2, 0, 3, 'MP-0002', '2023-09-13', 1, 1680, 0, 0, 0, 1680, 1680, 0, 0, '', 'a', 1),
(3, 2, 4, 'MP-0003', '2023-09-13', 1, 1900, 0, 0, 0, 1900, 1900, 0, 0, '', 'a', 1),
(4, 3, 3, 'MP-0004', '2023-09-13', 1, 270, 0, 0, 0, 270, 270, 0, 0, '', 'a', 1),
(5, 5, 5, 'MP-0005', '2023-09-14', 1, 5920, 0, 0, 0, 5920, 5920, 0, -189000, '', 'a', 1),
(6, 6, 2, 'MP-0006', '2023-09-16', 1, 1900, 0, 0, 0, 1900, 1900, 0, -8096990, '', 'a', 1),
(7, 1, 4, 'MP-0007', '2023-10-08', 1, 31050, 0, 0, 0, 31050, 31050, 0, 0, '', 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_purchase_details`
--

CREATE TABLE `tbl_material_purchase_details` (
  `purchase_detail_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `purchase_rate` float NOT NULL,
  `quantity` float NOT NULL,
  `total` float NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_material_purchase_details`
--

INSERT INTO `tbl_material_purchase_details` (`purchase_detail_id`, `purchase_id`, `material_id`, `purchase_rate`, `quantity`, `total`, `status`, `branch_id`) VALUES
(1, 7, 9, 15, 20, 300, 'a', 1),
(2, 7, 11, 110, 60, 6600, 'a', 1),
(3, 7, 32, 65, 20, 1300, 'a', 1),
(4, 7, 18, 23, 250, 5750, 'a', 1),
(5, 7, 14, 25, 540, 13500, 'a', 1),
(6, 7, 10, 60, 60, 3600, 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_requisition`
--

CREATE TABLE `tbl_material_requisition` (
  `requisition_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `requisition_invoice` varchar(100) DEFAULT NULL,
  `work_order` varchar(191) DEFAULT NULL,
  `requisition_date` date NOT NULL,
  `requisition_for` int(11) NOT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'p',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_material_requisition`
--

INSERT INTO `tbl_material_requisition` (`requisition_id`, `employee_id`, `requisition_invoice`, `work_order`, `requisition_date`, `requisition_for`, `note`, `status`, `branch_id`) VALUES
(1, 10, 'REQ-202300001', '230100005', '2023-10-08', 1, '', 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_requisition_details`
--

CREATE TABLE `tbl_material_requisition_details` (
  `requisition_detail_id` int(11) NOT NULL,
  `requisition_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `purchase_rate` float NOT NULL,
  `quantity` float NOT NULL,
  `total` float NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'p',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_material_requisition_details`
--

INSERT INTO `tbl_material_requisition_details` (`requisition_detail_id`, `requisition_id`, `material_id`, `purchase_rate`, `quantity`, `total`, `status`, `branch_id`) VALUES
(1, 1, 9, 15, 20, 300, 'a', 1),
(2, 1, 11, 110, 60, 6600, 'a', 1),
(3, 1, 32, 65, 20, 1300, 'a', 1),
(4, 1, 18, 23, 250, 5750, 'a', 1),
(5, 1, 14, 25, 540, 13500, 'a', 1),
(6, 1, 10, 60, 60, 3600, 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_month`
--

CREATE TABLE `tbl_month` (
  `month_id` int(11) NOT NULL,
  `month_name` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_month`
--

INSERT INTO `tbl_month` (`month_id`, `month_name`) VALUES
(1, 'may/2022'),
(2, 'July'),
(3, 'July/2022'),
(4, 'August/2022'),
(5, 'June/2022'),
(6, 'September/2022'),
(7, 'October/2022'),
(8, 'Nobember/2022'),
(9, 'December/2022'),
(10, 'January, 2023'),
(11, 'February, 2023'),
(12, 'March, 2023'),
(13, 'April, 2023');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `Product_SlNo` int(11) NOT NULL,
  `Product_Code` varchar(50) NOT NULL,
  `Product_Name` varchar(150) NOT NULL,
  `ProductCategory_ID` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `size` varchar(11) NOT NULL DEFAULT 'na',
  `vat` float NOT NULL,
  `Product_ReOrederLevel` int(11) NOT NULL,
  `Product_Purchase_Rate` decimal(18,2) NOT NULL,
  `Product_SellingPrice` decimal(18,2) NOT NULL,
  `Product_MinimumSellingPrice` decimal(18,2) NOT NULL,
  `Product_WholesaleRate` decimal(18,2) NOT NULL,
  `one_cartun_equal` varchar(20) NOT NULL,
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `Unit_ID` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `Product_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1, 'P00001', '5 Watt', 8, 0, 0, 'na', 0, 995, '60.00', '112.00', '0.00', '95.00', '', 'false', 1, 'a', 'Admin', '2022-10-14 12:42:27', 'Admin', '2023-01-18 10:44:26', 1),
(2, 'P00002', '7 Watt', 8, 0, 0, 'na', 0, 300, '76.88', '126.00', '0.00', '100.00', '', 'false', 1, 'a', 'Admin', '2022-10-14 12:47:25', 'Admin', '2023-01-18 10:44:50', 1),
(3, 'P00003', '9 Watt', 8, 0, 0, 'na', 0, 170, '97.54', '147.00', '0.00', '120.00', '', 'false', 1, 'a', 'Admin', '2022-10-14 12:49:08', 'Admin', '2023-01-18 10:45:09', 1),
(4, 'P00004', '12 Watt', 8, 0, 0, 'na', 0, 447, '115.00', '175.00', '0.00', '145.00', '', 'false', 1, 'a', 'Admin', '2022-10-14 12:50:55', 'Admin', '2023-01-18 10:45:36', 1),
(5, 'P00005', '15 Watt', 8, 0, 0, 'na', 0, 491, '125.00', '196.00', '0.00', '160.00', '', 'false', 1, 'a', 'Admin', '2022-10-14 12:52:23', 'Admin', '2023-01-18 10:45:54', 1),
(6, 'P00006', '20 Watt', 8, 0, 0, 'na', 0, 1490, '133.34', '262.50', '0.00', '230.00', '', 'false', 1, 'a', 'Admin', '2022-10-14 12:54:18', 'Admin', '2023-01-18 10:46:19', 1),
(7, 'P00007', 'Emergency Bulb', 3, 0, 0, 'na', 0, 500, '340.00', '570.00', '0.00', '513.00', '', 'false', 1, 'd', 'Admin', '2022-10-14 13:25:08', '', '', 1),
(8, 'P00008', '12  Watt AC/DC', 16, 0, 0, 'na', 0, 500, '0.00', '554.40', '0.00', '490.00', '', 'false', 1, 'a', 'Admin', '2022-10-14 13:51:55', 'Admin', '2023-03-18 17:48:58', 1),
(9, 'P00009', '40 Watt tube Light', 15, 0, 0, 'na', 0, 500, '340.00', '564.00', '0.00', '490.00', '', 'false', 1, 'a', 'Admin', '2022-10-22 21:47:42', 'Admin', '2023-01-18 10:47:06', 1),
(10, 'P00010', '60 Watt Beaket tube', 15, 0, 0, 'na', 0, 1000, '480.00', '715.00', '0.00', '650.00', '', 'false', 1, 'a', 'Admin', '2022-11-23 10:41:34', 'Admin', '2023-01-18 10:51:20', 1),
(11, 'P00011', ' 1Gang 1 Way Switch', 18, 0, 0, 'na', 0, 1000, '0.00', '106.15', '0.00', '96.50', '', 'false', 1, 'a', 'Admin', '2022-11-27 18:27:57', 'Admin', '2022-11-27 18:30:00', 1),
(12, 'P00012', '2 Gang 1 Way Switch', 18, 0, 0, 'na', 0, 1000, '0.00', '209.13', '0.00', '190.12', '', 'false', 1, 'a', 'Admin', '2022-11-27 18:33:06', '', '', 1),
(13, 'P00013', 'fan dimmer', 19, 0, 0, 'na', 0, 1000, '207.00', '522.00', '0.00', '473.85', '', 'false', 1, 'd', 'Admin', '2022-11-27 18:34:17', '', '', 1),
(14, 'P00014', '3 Gang 1 Way', 18, 0, 0, 'na', 0, 1000, '130.00', '239.85', '0.00', '239.85', '', 'false', 1, 'd', 'Admin', '2022-11-29 15:41:12', '', '', 1),
(15, 'P00016', '4 Gang 1 Way', 18, 0, 0, 'na', 0, 1000, '0.00', '325.00', '0.00', '292.50', '', 'false', 1, 'a', 'Admin', '2022-11-29 16:25:17', 'Admin', '2022-11-29 17:05:46', 1),
(16, 'P00017', '3 Gang 1 Way..', 18, 0, 0, 'na', 0, 1000, '0.00', '266.00', '0.00', '239.85', '', 'false', 1, 'a', 'Admin', '2022-11-29 16:34:53', 'Admin', '2022-11-29 17:05:04', 1),
(17, 'P00018', 'Fan Dimmer.', 19, 0, 0, 'na', 0, 500, '150.00', '526.00', '0.00', '473.85', '', 'false', 1, 'a', 'Admin', '2022-11-29 16:36:56', 'Admin', '2022-11-29 17:04:26', 1),
(18, 'P00019', '15 Amp Round', 20, 0, 0, 'na', 0, 500, '0.00', '368.00', '0.00', '330.50', '', 'false', 1, 'a', 'Admin', '2022-11-29 16:38:18', 'Admin', '2022-11-29 17:03:35', 1),
(19, 'P00020', '2 Pin Multi', 20, 0, 0, 'na', 0, 500, '0.00', '266.00', '0.00', '239.85', '', 'false', 1, 'a', 'Admin', '2022-11-29 16:40:40', 'Admin', '2022-11-29 17:02:40', 1),
(20, 'P00021', '5 Pin Multi', 20, 0, 0, 'na', 0, 500, '0.00', '403.00', '0.00', '362.70', '', 'false', 1, 'a', 'Admin', '2022-11-29 16:41:48', 'Admin', '2022-11-29 17:01:26', 1),
(21, 'P00022', 'TV Socket', 20, 0, 0, 'na', 0, 500, '107.14', '332.00', '0.00', '298.35', '', 'false', 1, 'a', 'Admin', '2022-11-29 16:43:01', 'Admin', '2022-11-29 17:00:48', 1),
(22, 'P00023', 'Bell posh', 18, 0, 0, 'na', 0, 500, '150.00', '276.00', '0.00', '248.60', '', 'false', 1, 'a', 'Admin', '2022-11-29 16:44:17', 'Admin', '2022-11-29 17:00:01', 1),
(23, 'P00024', '45 Amp DP ', 18, 0, 0, 'na', 0, 500, '0.00', '485.00', '0.00', '435.80', '', 'false', 1, 'a', 'Admin', '2022-11-29 16:46:31', 'Admin', '2022-11-29 16:58:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productcategory`
--

CREATE TABLE `tbl_productcategory` (
  `ProductCategory_SlNo` int(11) NOT NULL,
  `ProductCategory_Name` varchar(150) NOT NULL,
  `ProductCategory_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `category_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_productcategory`
--

INSERT INTO `tbl_productcategory` (`ProductCategory_SlNo`, `ProductCategory_Name`, `ProductCategory_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `category_branchid`) VALUES
(1, 'LED Backup', '12w', 'd', 'Admin', '2022-10-14 12:07:34', '', '', 1),
(2, 'Backup Light', '12w LED Backup', 'd', 'Admin', '2022-10-14 12:12:19', '', '', 1),
(3, '12 Watt AC/DC', 'Emergency Bulb', 'd', 'Admin', '2022-10-14 12:15:29', 'Admin', '2022-10-14 13:03:15', 1),
(4, 'wasedr', 'eseed', 'd', 'Admin', '2022-10-14 12:26:07', '', '', 1),
(5, '5 Watt', 'AC LED Bulb', 'd', 'Admin', '2022-10-14 12:28:37', 'Admin', '2022-10-14 12:29:21', 1),
(6, '7 Watt', 'AC LED Bulb', 'd', 'Admin', '2022-10-14 12:29:38', '', '', 1),
(7, '9 Watt', 'AC LED Bulb', 'd', 'Admin', '2022-10-14 12:30:07', '', '', 1),
(8, 'AC LED Bulb', '5/7/9/12/15/20 Watt', 'a', 'Admin', '2022-10-14 12:30:18', 'Admin', '2022-10-14 13:47:27', 1),
(9, '15 Watt', 'AC LED Bulb', 'd', 'Admin', '2022-10-14 12:30:45', '', '', 1),
(10, '20 Watt', 'AC LED Bulb', 'd', 'Admin', '2022-10-14 12:30:55', '', '', 1),
(11, 'LED Back', '12 Watt LED Backup', 'd', 'Admin', '2022-10-14 12:31:25', 'Admin', '2022-10-14 12:56:59', 1),
(12, '20 Watt LED Tube ', 'LED Tube Light', 'd', 'Admin', '2022-10-14 12:32:18', 'Admin', '2022-10-14 12:33:51', 1),
(13, '40 Watt LED Tube ', 'LED Tube Light', 'd', 'Admin', '2022-10-14 12:33:28', '', '', 1),
(14, '60 Watt LED Tube', 'LED Tube Light', 'd', 'Admin', '2022-10-14 12:34:28', '', '', 1),
(15, 'Tube Light', '20/40/60 Watt', 'a', 'Admin', '2022-10-14 13:45:34', 'Admin', '2022-10-14 13:47:15', 1),
(16, 'Emegency Bulb', '10/12 Watt AC/DC', 'a', 'Admin', '2022-10-14 13:47:02', 'Admin', '2022-11-21 12:11:19', 1),
(17, 'Machinary', '', 'a', 'Admin', '2022-10-14 15:28:18', 'Admin', '2022-10-14 15:28:36', 1),
(18, 'Switch', '1 Gang 1way\n2 Gang 1 Way\n3 Gang 1 Way\n4 Gang 1 Way\nTV \nWater Proof Bell\n', 'a', 'Admin', '2022-11-21 12:10:41', 'Admin', '2022-11-21 12:14:04', 1),
(19, 'Dimmer', 'Fan Dmmer', 'a', 'Admin', '2022-11-21 12:14:32', '', '', 1),
(20, 'Socket', '15A Round\n2 Pin \n5 Pin Multi', 'a', 'Admin', '2022-11-21 12:15:39', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productions`
--

CREATE TABLE `tbl_productions` (
  `production_id` int(11) NOT NULL,
  `production_sl` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `incharge_id` int(11) DEFAULT NULL,
  `shift` varchar(250) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `labour_cost` float NOT NULL,
  `material_cost` float NOT NULL,
  `other_cost` float NOT NULL,
  `total_cost` float NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_details`
--

CREATE TABLE `tbl_production_details` (
  `production_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `purchase_rate` float NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_products`
--

CREATE TABLE `tbl_production_products` (
  `production_products_id` int(11) NOT NULL,
  `production_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_production_products`
--

INSERT INTO `tbl_production_products` (`production_products_id`, `production_id`, `product_id`, `quantity`, `price`, `total`, `status`, `branch_id`) VALUES
(1, 1, 22, 1, '150.00', '150.00', 'a', 1),
(2, 2, 21, 2, '350.00', '700.00', 'a', 1),
(3, 3, 22, 1, '150.00', '150.00', 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasedetails`
--

CREATE TABLE `tbl_purchasedetails` (
  `PurchaseDetails_SlNo` int(11) NOT NULL,
  `PurchaseMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `PurchaseDetails_TotalQuantity` float NOT NULL,
  `PurchaseDetails_Rate` decimal(18,2) NOT NULL,
  `purchase_cost` decimal(18,2) NOT NULL,
  `PurchaseDetails_Discount` decimal(18,2) NOT NULL,
  `PurchaseDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseDetails_branchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasemaster`
--

CREATE TABLE `tbl_purchasemaster` (
  `PurchaseMaster_SlNo` int(11) NOT NULL,
  `Supplier_SlNo` int(11) NOT NULL,
  `Employee_SlNo` int(11) NOT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `PurchaseMaster_OrderDate` date NOT NULL,
  `PurchaseMaster_PurchaseFor` varchar(50) NOT NULL,
  `PurchaseMaster_Description` longtext NOT NULL,
  `PurchaseMaster_TotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DiscountAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_Tax` decimal(18,2) NOT NULL,
  `PurchaseMaster_Freight` decimal(18,2) NOT NULL,
  `PurchaseMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_PaidAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DueAmount` decimal(18,2) NOT NULL,
  `previous_due` float DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseMaster_BranchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturn`
--

CREATE TABLE `tbl_purchasereturn` (
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `Supplier_IDdNo` int(11) NOT NULL,
  `PurchaseReturn_ReturnDate` date NOT NULL,
  `PurchaseReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `PurchaseReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturn_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturndetails`
--

CREATE TABLE `tbl_purchasereturndetails` (
  `PurchaseReturnDetails_SlNo` int(11) NOT NULL,
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetails_ReturnQuantity` float NOT NULL,
  `PurchaseReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturnDetails_brachid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotaion_customer`
--

CREATE TABLE `tbl_quotaion_customer` (
  `quotation_customer_id` int(11) NOT NULL,
  `customer_name` char(50) NOT NULL,
  `contact_number` varchar(35) NOT NULL,
  `customer_address` text NOT NULL,
  `quation_customer_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_details`
--

CREATE TABLE `tbl_quotation_details` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` float NOT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_Freight` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_quotation_details`
--

INSERT INTO `tbl_quotation_details` (`SaleDetails_SlNo`, `SaleMaster_IDNo`, `Product_IDNo`, `SaleDetails_TotalQuantity`, `SaleDetails_Rate`, `SaleDetails_Discount`, `SaleDetails_Tax`, `SaleDetails_Freight`, `SaleDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleDetails_BranchId`) VALUES
(1, 1, 17, 10, '526.00', '0.00', '0.00', '0.00', '5260.00', 'a', 'Admin', '2023-10-07 12:31:24', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_master`
--

CREATE TABLE `tbl_quotation_master` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleMaster_customer_name` varchar(500) NOT NULL,
  `SaleMaster_customer_mobile` varchar(50) NOT NULL,
  `SaleMaster_customer_address` varchar(1000) NOT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext DEFAULT NULL,
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) NOT NULL,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_quotation_master`
--

INSERT INTO `tbl_quotation_master` (`SaleMaster_SlNo`, `SaleMaster_InvoiceNo`, `SaleMaster_customer_name`, `SaleMaster_customer_mobile`, `SaleMaster_customer_address`, `SaleMaster_SaleDate`, `SaleMaster_Description`, `SaleMaster_TotalSaleAmount`, `SaleMaster_TotalDiscountAmount`, `SaleMaster_TaxAmount`, `SaleMaster_Freight`, `SaleMaster_SubTotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleMaster_branchid`) VALUES
(1, 'Q-202300001', 'fdfdsfa', '+8801849390011', 'Arambag Abashik\nMirpur-7', '2023-10-07', NULL, '5260.00', '0.00', '0.00', '0.00', '5260.00', 'a', 'Admin', '2023-10-07 12:31:24', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recipe`
--

CREATE TABLE `tbl_recipe` (
  `recipe_id` int(11) NOT NULL,
  `recipe_name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` int(11) NOT NULL,
  `AddTime` datetime NOT NULL,
  `UpdateBy` int(11) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_recipe`
--

INSERT INTO `tbl_recipe` (`recipe_id`, `recipe_name`, `date`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `branch_id`) VALUES
(1, 'recipe-1', '2023-09-12', 'a', 1, '2023-09-12 10:07:01', 1, '2023-09-12 10:24:11', 1),
(2, 'rusel sorkar', '2023-09-14', 'a', 1, '2023-09-14 10:41:45', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recipe_materials`
--

CREATE TABLE `tbl_recipe_materials` (
  `recipe_material_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `material_id` int(11) NOT NULL,
  `purchase_rate` float(10,2) NOT NULL,
  `quantity` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` int(11) NOT NULL,
  `AddTime` datetime NOT NULL,
  `UpdateBy` int(11) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_recipe_materials`
--

INSERT INTO `tbl_recipe_materials` (`recipe_material_id`, `recipe_id`, `date`, `material_id`, `purchase_rate`, `quantity`, `total`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `branch_id`) VALUES
(3, 1, '2023-09-12', 12, 18.00, 2.00, 36.00, 'a', 1, '2023-09-12 10:24:11', NULL, NULL, 1),
(4, 1, '2023-09-12', 50, 77.00, 7.00, 539.00, 'a', 1, '2023-09-12 10:24:11', NULL, NULL, 1),
(5, 2, '2023-09-14', 10, 60.00, 2.00, 120.00, 'a', 1, '2023-09-14 10:41:45', NULL, NULL, 1),
(6, 2, '2023-09-14', 7, 10.00, 1.00, 10.00, 'a', 1, '2023-09-14 10:41:45', NULL, NULL, 1),
(7, 2, '2023-09-14', 8, 12.00, 2.00, 24.00, 'a', 1, '2023-09-14 10:41:45', NULL, NULL, 1),
(8, 2, '2023-09-14', 11, 110.00, 1.00, 110.00, 'a', 1, '2023-09-14 10:41:45', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recipe_product`
--

CREATE TABLE `tbl_recipe_product` (
  `recipe_product_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` int(11) NOT NULL,
  `AddTime` datetime NOT NULL,
  `UpdateBy` int(11) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_recipe_product`
--

INSERT INTO `tbl_recipe_product` (`recipe_product_id`, `date`, `recipe_id`, `product_id`, `price`, `quantity`, `total`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `branch_id`) VALUES
(2, '2023-09-12', 1, 22, 150.00, 1.00, 150.00, 'a', 1, '2023-09-12 10:24:11', NULL, NULL, 1),
(3, '2023-09-14', 2, 21, 350.00, 1.00, 350.00, 'a', 1, '2023-09-14 10:41:45', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saledetails`
--

CREATE TABLE `tbl_saledetails` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` float NOT NULL,
  `Purchase_Rate` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `Discount_amount` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(5) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_saledetails`
--

INSERT INTO `tbl_saledetails` (`SaleDetails_SlNo`, `SaleMaster_IDNo`, `Product_IDNo`, `SaleDetails_TotalQuantity`, `Purchase_Rate`, `SaleDetails_Rate`, `SaleDetails_Discount`, `Discount_amount`, `SaleDetails_Tax`, `SaleDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleDetails_BranchId`) VALUES
(1, 1, 6, 1, '133.34', '262.50', '0.00', NULL, '0.00', '262.50', 'a', 'Admin', '2023-10-05 11:51:31', NULL, NULL, 1),
(2, 2, 17, 25, '150.00', '526.00', '0.00', NULL, '0.00', '13150.00', 'pr', 'Admin', '2023-10-07 11:22:52', NULL, NULL, 1),
(3, 2, 9, 25, '340.00', '564.00', '0.00', NULL, '0.00', '14100.00', 'pr', 'Admin', '2023-10-07 11:22:52', NULL, NULL, 1),
(4, 2, 10, 25, '480.00', '715.00', '0.00', NULL, '0.00', '17875.00', 'pr', 'Admin', '2023-10-07 11:22:52', NULL, NULL, 1),
(5, 2, 20, 25, '0.00', '403.00', '0.00', NULL, '0.00', '10075.00', 'pr', 'Admin', '2023-10-07 11:22:52', NULL, NULL, 1),
(6, 2, 21, 36, '107.14', '332.00', '0.00', NULL, '0.00', '11952.00', 'pr', 'Admin', '2023-10-07 11:22:52', NULL, NULL, 1),
(7, 3, 11, 25, '0.00', '106.15', '0.00', NULL, '0.00', '2653.75', 'pr', 'Admin', '2023-10-07 11:54:05', NULL, NULL, 1),
(8, 3, 12, 25, '0.00', '209.13', '0.00', NULL, '0.00', '5228.25', 'pr', 'Admin', '2023-10-07 11:54:05', NULL, NULL, 1),
(9, 4, 15, 10, '0.00', '325.00', '0.00', NULL, '0.00', '3250.00', 'pr', 'Admin', '2023-10-08 10:51:27', NULL, NULL, 1),
(10, 4, 20, 20, '0.00', '403.00', '0.00', NULL, '0.00', '8060.00', 'pr', 'Admin', '2023-10-08 10:51:27', NULL, NULL, 1),
(11, 5, 1, 10, '60.00', '112.00', '0.00', NULL, '0.00', '1120.00', 'pr', 'Admin', '2023-10-08 10:56:46', NULL, NULL, 1),
(12, 5, 6, 10, '133.34', '262.50', '0.00', NULL, '0.00', '2625.00', 'pr', 'Admin', '2023-10-08 10:56:46', NULL, NULL, 1),
(13, 5, 18, 10, '0.00', '368.00', '0.00', NULL, '0.00', '3680.00', 'pr', 'Admin', '2023-10-08 10:56:46', NULL, NULL, 1),
(14, 6, 15, 10, '0.00', '325.00', '0.00', NULL, '0.00', '3250.00', 'pr', 'Admin', '2023-10-09 11:05:57', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturn`
--

CREATE TABLE `tbl_salereturn` (
  `SaleReturn_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleReturn_ReturnDate` date NOT NULL,
  `SaleReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `SaleReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturn_brunchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturndetails`
--

CREATE TABLE `tbl_salereturndetails` (
  `SaleReturnDetails_SlNo` int(11) NOT NULL,
  `SaleReturn_IdNo` int(11) NOT NULL,
  `SaleReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `SaleReturnDetails_ReturnQuantity` float NOT NULL,
  `SaleReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturnDetails_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salesmaster`
--

CREATE TABLE `tbl_salesmaster` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SalseCustomer_IDNo` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `PONo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext DEFAULT NULL,
  `SaleMaster_SaleType` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT 'Cash',
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) DEFAULT 0.00,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `SaleMaster_PaidAmount` decimal(18,2) NOT NULL,
  `SaleMaster_DueAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Previous_Due` double(18,2) DEFAULT NULL,
  `Status` char(5) NOT NULL DEFAULT 'a',
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `supp_mat_code` varchar(191) NOT NULL,
  `ship_date` varchar(191) NOT NULL,
  `prod_subprocess` varchar(191) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `acceptable` varchar(191) NOT NULL,
  `contract_no` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `remark` varchar(191) DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_salesmaster`
--

INSERT INTO `tbl_salesmaster` (`SaleMaster_SlNo`, `SaleMaster_InvoiceNo`, `SalseCustomer_IDNo`, `employee_id`, `PONo`, `SaleMaster_SaleDate`, `SaleMaster_Description`, `SaleMaster_SaleType`, `payment_type`, `SaleMaster_TotalSaleAmount`, `SaleMaster_TotalDiscountAmount`, `SaleMaster_TaxAmount`, `SaleMaster_Freight`, `SaleMaster_SubTotalAmount`, `SaleMaster_PaidAmount`, `SaleMaster_DueAmount`, `SaleMaster_Previous_Due`, `Status`, `is_service`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `supp_mat_code`, `ship_date`, `prod_subprocess`, `unit_price`, `amount`, `acceptable`, `contract_no`, `description`, `remark`, `SaleMaster_branchid`) VALUES
(1, '230100001', 55, NULL, '25252', '2023-10-05', '', 'retail', 'Cash', '262.50', '0.00', '0.00', '0.00', '262.50', '262.50', '0.00', 0.00, 'a', 'false', 'Admin', '2023-10-05 11:51:31', NULL, NULL, '', '', '', '0.00', '0.00', '', '', '', '', 1),
(2, '230100002', 49, NULL, '', '2023-10-07', '', 'retail', 'Cash', '67152.00', '0.00', '0.00', '0.00', '67152.00', '0.00', '67152.00', 0.00, 'pr', 'false', 'Admin', '2023-10-07 11:22:52', NULL, NULL, '', '', '', '0.00', '0.00', '', '', '', '', 1),
(3, '230100003', 54, NULL, '', '2023-10-07', '', 'retail', 'Cash', '7882.00', '0.00', '0.00', '0.00', '7882.00', '7882.00', '0.00', 0.00, 'pr', 'false', 'Admin', '2023-10-07 11:54:05', NULL, NULL, '', '', '', '0.00', '0.00', '', '', '', '', 1),
(4, '230100004', 58, NULL, '', '2023-10-08', '', 'retail', 'Cash', '11310.00', '0.00', '0.00', '0.00', '11310.00', '11310.00', '0.00', 0.00, 'pr', 'false', 'Admin', '2023-10-08 10:51:27', NULL, NULL, '', '', '', '0.00', '0.00', '', '', '', '', 1),
(5, '230100005', 53, NULL, '', '2023-10-08', '', 'retail', 'Cash', '7425.00', '0.00', '0.00', '0.00', '7425.00', '0.00', '7425.00', 0.00, 'pr', 'false', 'Admin', '2023-10-08 10:56:46', NULL, NULL, '', '', '', '0.00', '0.00', '', '', '', '', 1),
(6, '230100006', 50, NULL, '', '2023-10-09', '', 'retail', 'Cash', '3250.00', '0.00', '0.00', '0.00', '3250.00', '3250.00', '0.00', 0.00, 'pr', 'false', 'Admin', '2023-10-09 11:05:57', NULL, NULL, 'c212w25', '2023-10-09', 'Paper tag', '0.25', '21.49', '0', '604-PP-014', 'others', 'hello', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shifts`
--

CREATE TABLE `tbl_shifts` (
  `shift_id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shifts`
--

INSERT INTO `tbl_shifts` (`shift_id`, `name`) VALUES
(1, 'Day Shift'),
(2, 'Night Shift');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms`
--

CREATE TABLE `tbl_sms` (
  `row_id` int(11) NOT NULL,
  `number` varchar(30) NOT NULL,
  `sms_text` varchar(500) NOT NULL,
  `sent_by` int(11) NOT NULL,
  `sent_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_settings`
--

CREATE TABLE `tbl_sms_settings` (
  `sms_enabled` varchar(50) NOT NULL DEFAULT 'false',
  `api_key` varchar(500) DEFAULT NULL,
  `sms_type` varchar(50) NOT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `bulk_url` varchar(1000) DEFAULT NULL,
  `url_2` varchar(1000) DEFAULT NULL,
  `bulk_url_2` varchar(1000) DEFAULT NULL,
  `sender_id` varchar(200) DEFAULT NULL,
  `sender_id_2` varchar(200) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `sender_name` varchar(200) NOT NULL,
  `sender_phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sms_settings`
--

INSERT INTO `tbl_sms_settings` (`sms_enabled`, `api_key`, `sms_type`, `url`, `bulk_url`, `url_2`, `bulk_url_2`, `sender_id`, `sender_id_2`, `user_id`, `password`, `country_code`, `sender_name`, `sender_phone`) VALUES
('false', 'C2003631601c03803cde57.82758523', 'unicode', 'http://esms.linktechbd.com/smsapi', 'http://esms.linktechbd.com/smsapimany', 'http://mshastra.com/sendurl.aspx', 'http://mshastra.com/sendurlcomma.aspx', 'Link-UpTech', 'BigTech Ltd', '20102047', 'BTL@432', '+880', 'Link-Up Technology', '01911-978897');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `Supplier_SlNo` int(11) NOT NULL,
  `Supplier_Code` varchar(50) NOT NULL,
  `Supplier_Name` varchar(150) NOT NULL,
  `Supplier_Type` varchar(50) NOT NULL,
  `Supplier_Phone` varchar(50) NOT NULL,
  `Supplier_Mobile` varchar(15) NOT NULL,
  `Supplier_Email` varchar(50) NOT NULL,
  `Supplier_OfficePhone` varchar(50) NOT NULL,
  `Supplier_Address` varchar(300) NOT NULL,
  `contact_person` varchar(250) DEFAULT NULL,
  `District_SlNo` int(11) NOT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `Supplier_Web` varchar(150) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Supplier_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`Supplier_SlNo`, `Supplier_Code`, `Supplier_Name`, `Supplier_Type`, `Supplier_Phone`, `Supplier_Mobile`, `Supplier_Email`, `Supplier_OfficePhone`, `Supplier_Address`, `contact_person`, `District_SlNo`, `Country_SlNo`, `Supplier_Web`, `previous_due`, `image_name`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Supplier_brinchid`) VALUES
(1, 'S00001', 'Fusan DHK Lighting Corporation', '', '', '01324444150', 'Indrajit.clefo@gmail.com', '', '425,Khadun, Tarabo,Narayanganj', 'Indrajit Paul', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2022-10-14 15:27:14', NULL, NULL, 1),
(2, 'S00002', 'Foshan Cozum-LED lighting Ltd.', '', '', '075786228859', 'lara@cozum-led.net', '', 'Nanhai Distric, Foshan City, Guangdong Province, China.', 'Lara Mue', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2022-10-14 16:52:07', NULL, NULL, 1),
(3, 'S00003', 'Link Up Technology Ltd', '', '', '01911978897', '', '', 'Plot:16, Road:01,(Behind Shah Ali Market), Mirpur-10 , Dhaka-1216 ', '', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-01-22 18:08:19', NULL, NULL, 1),
(4, 'S00004', 'Denim trade international', '', '', '017', '', '', '', '', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-03-28 15:45:26', NULL, NULL, 1),
(5, 'S00005', 'JISAN PRINTING', '', '', '01748407320', '', '', '4/1 Ibaidullah Bhaban, 2nd lane, Zindabhar, Nayabazar, Dhaka-1100', 'rUBEL hOSSAIN aRIYAN', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-05-20 20:06:44', NULL, NULL, 1),
(6, 'S00006', 'Bismillah Packaging House', '', '', '01736310201', '', '', 'char Kali bari, china mor, shadar , Mymensingh', 'Billal Hoshen', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-05-21 12:59:23', NULL, NULL, 1),
(7, 'S00007', 'M/s Alif Hardware', 'G', '', '01765577405', '', '', '27/A shadeshi bazar mor, Mymensingh', NULL, 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-05-22 12:36:04', NULL, NULL, 1),
(8, 'S00008', 'Rupali Hardware', 'G', '', '01715765055', '', '', 'Samad Plaza 4 No, Shakhari pottri , Shadeshi Bazar , Mymensingh', NULL, 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-05-25 17:09:26', 'Admin', '2023-05-25 17:10:06', 1),
(9, 'S00009', 'MOHONA DESIGN', '', '', '01746410665', '', '', 'Mothertek, Bashabo, Dhaka', 'Mr. Mizan', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-05-27 18:20:32', NULL, NULL, 1),
(10, 'S00010', 'Shibly Enterprise', 'G', '', '01719-284391', '', '', '42/13, Rambabu road, Mymensingh', NULL, 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-05-31 13:05:14', NULL, NULL, 1),
(11, 'S00011', 'Arab Electronics', 'G', '', '01886820829', '', '', 'CDA Market , Chittagong', NULL, 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-05-31 13:19:01', 'Admin', '2023-05-31 13:20:21', 1),
(12, 'S00012', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-09-12 15:29:21', NULL, NULL, 1),
(13, 'S00013', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', NULL, 'a', 'Admin', '2023-09-13 10:59:55', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_payment`
--

CREATE TABLE `tbl_supplier_payment` (
  `SPayment_id` int(11) NOT NULL,
  `SPayment_date` date DEFAULT NULL,
  `SPayment_invoice` varchar(20) DEFAULT NULL,
  `Purchase_id` int(11) DEFAULT NULL,
  `material_purchase_id` int(11) DEFAULT NULL,
  `SPayment_customerID` varchar(20) DEFAULT NULL,
  `SPayment_TransactionType` varchar(25) DEFAULT NULL,
  `SPayment_amount` decimal(18,2) DEFAULT NULL,
  `SPayment_Paymentby` varchar(20) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `SPayment_notes` varchar(225) DEFAULT NULL,
  `SPayment_brunchid` int(11) DEFAULT NULL,
  `SPayment_status` varchar(2) DEFAULT NULL,
  `SPayment_Addby` varchar(100) DEFAULT NULL,
  `SPayment_AddDAte` date DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `SPayment_UpdateDAte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transferdetails`
--

CREATE TABLE `tbl_transferdetails` (
  `transferdetails_id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `purchase_rate` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfermaster`
--

CREATE TABLE `tbl_transfermaster` (
  `transfer_id` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `transfer_by` int(11) NOT NULL,
  `transfer_from` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL,
  `total_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `note` varchar(500) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit`
--

CREATE TABLE `tbl_unit` (
  `Unit_SlNo` int(11) NOT NULL,
  `Unit_Name` varchar(150) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_unit`
--

INSERT INTO `tbl_unit` (`Unit_SlNo`, `Unit_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Pcs', 'a', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `User_SlNo` int(11) NOT NULL,
  `User_ID` varchar(50) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `User_Name` varchar(150) NOT NULL,
  `UserEmail` varchar(200) NOT NULL,
  `userBrunch_id` int(11) NOT NULL,
  `User_Password` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `verifycode` int(11) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Brunch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`User_SlNo`, `User_ID`, `FullName`, `User_Name`, `UserEmail`, `userBrunch_id`, `User_Password`, `UserType`, `status`, `verifycode`, `image_name`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Brunch_ID`) VALUES
(1, 'U0001', 'Admin', 'admin', 'admin@host.com', 1, 'c4ca4238a0b923820dcc509a6f75849b', 'm', 'a', 1, '1.png', NULL, NULL, NULL, NULL, 1),
(2, '', 'Mohammad Nasir Uddin', 'Nasir311', 'uddinnasir744@gmail.com', 1, '7639b857d48632f063d252f164744461', 'u', 'a', 0, NULL, NULL, '2022-10-14 13:57:38', NULL, NULL, 1),
(3, '', 'Jannatul Naime', 'Naime7774', 'khan.md7774@gmail.com', 1, 'c1619d2ad66f7629c12c87fe21d32a58', 'u', 'a', 0, NULL, NULL, '2023-05-08 11:13:20', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_access`
--

CREATE TABLE `tbl_user_access` (
  `access_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access` text NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_access`
--

INSERT INTO `tbl_user_access` (`access_id`, `user_id`, `access`, `saved_by`, `saved_datetime`) VALUES
(1, 3, '[\"sales\\/product\",\"sales\\/service\",\"salesReturn\",\"salesrecord\",\"currentStock\",\"quotation\",\"cashTransaction\",\"bank_transactions\",\"customerPaymentPage\",\"supplierPayment\",\"cash_view\",\"account\",\"bank_accounts\",\"check\\/entry\",\"check\\/list\",\"check\\/reminder\\/list\",\"check\\/pending\\/list\",\"check\\/dis\\/list\",\"check\\/paid\\/list\",\"salesinvoice\",\"returnList\",\"sale_return_details\",\"customerDue\",\"customerPaymentReport\",\"customer_payment_history\",\"customerlist\",\"price_list\",\"quotation_invoice_report\",\"quotation_record\",\"TransactionReport\",\"bank_transaction_report\",\"cash_ledger\",\"bank_ledger\",\"cashStatment\",\"balance_sheet\",\"BalanceSheet\",\"profitLoss\",\"day_book\",\"purchase\",\"purchaseReturns\",\"purchaseRecord\",\"AssetsEntry\",\"salary_payment\",\"employee\",\"emplists\\/all\",\"emplists\\/active\",\"emplists\\/deactive\",\"designation\",\"depertment\",\"month\",\"salary_payment_report\",\"production\",\"productions\",\"material_purchase\",\"material_purchase_record\",\"material_category\",\"materials\",\"material_list\",\"material_damage\",\"material_stock\",\"material_ledger\",\"loan_transactions\",\"loan_view\",\"loan_transaction_report\",\"loan_ledger\",\"loan_accounts\",\"investment_transactions\",\"investment_view\",\"investment_transaction_report\",\"investment_ledger\",\"investment_accounts\",\"assets_report\",\"purchaseInvoice\",\"supplierDue\",\"supplierPaymentReport\",\"supplierList\",\"returnsList\",\"purchase_return_details\",\"reorder_list\",\"sms\",\"product\",\"productlist\",\"product_ledger\",\"damageEntry\",\"damageList\",\"product_transfer\",\"transfer_list\",\"received_list\",\"customer\",\"supplier\",\"category\",\"unit\",\"area\",\"shift\",\"companyProfile\",\"user\",\"database_backup\",\"graph\"]', 1, '2023-05-08 15:14:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_activity`
--

CREATE TABLE `tbl_user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT 'a',
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_activity`
--

INSERT INTO `tbl_user_activity` (`id`, `user_id`, `ip_address`, `login_time`, `logout_time`, `status`, `branch_id`) VALUES
(1, 1, '::1', '2023-10-08 11:33:49', NULL, 'a', 1),
(2, 1, '::1', '2023-10-09 10:21:57', NULL, 'a', 1),
(3, 1, '::1', '2023-10-09 16:15:55', NULL, 'a', 1),
(4, 1, '::1', '2023-10-12 09:39:27', '2023-10-12 09:59:35', 'a', 1),
(5, 1, '::1', '2023-10-12 09:59:36', NULL, 'a', 1),
(6, 1, '::1', '2023-10-12 14:25:58', NULL, 'a', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`Acc_SlNo`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  ADD PRIMARY KEY (`as_id`),
  ADD KEY `as_date` (`as_date`),
  ADD KEY `status` (`status`),
  ADD KEY `branchid` (`branchid`);

--
-- Indexes for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_SiNo`),
  ADD KEY `ProductCategory_SlNo` (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `brand_branchid` (`brand_branchid`);

--
-- Indexes for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  ADD PRIMARY KEY (`brunch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  ADD PRIMARY KEY (`Tr_SlNo`),
  ADD KEY `Tr_Id` (`Tr_Id`),
  ADD KEY `Tr_date` (`Tr_date`),
  ADD KEY `Tr_Type` (`Tr_Type`),
  ADD KEY `Acc_SlID` (`Acc_SlID`),
  ADD KEY `status` (`status`),
  ADD KEY `Tr_branchid` (`Tr_branchid`);

--
-- Indexes for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `SM_id` (`SM_id`),
  ADD KEY `date` (`date`),
  ADD KEY `remid_date` (`remid_date`),
  ADD KEY `check_status` (`check_status`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`color_SiNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  ADD PRIMARY KEY (`Company_SlNo`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`Company_SlNo`),
  ADD KEY `Invoice_Type` (`Invoice_Type`),
  ADD KEY `print_type` (`print_type`),
  ADD KEY `company_BrunchId` (`company_BrunchId`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`Country_SlNo`),
  ADD KEY `Status` (`Status`);

--
-- Indexes for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transfer_from_quantity` (`transfer_from_quantity`),
  ADD KEY `transfer_to_quantity` (`transfer_to_quantity`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`Customer_SlNo`),
  ADD KEY `Customer_Code` (`Customer_Code`),
  ADD KEY `Customer_Mobile` (`Customer_Mobile`),
  ADD KEY `Customer_Type` (`Customer_Type`),
  ADD KEY `Country_SlNo` (`Country_SlNo`),
  ADD KEY `area_ID` (`area_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Customer_brunchid` (`Customer_brunchid`);

--
-- Indexes for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  ADD PRIMARY KEY (`CPayment_id`),
  ADD KEY `CPayment_date` (`CPayment_date`),
  ADD KEY `CPayment_invoice` (`CPayment_invoice`),
  ADD KEY `CPayment_customerID` (`CPayment_customerID`),
  ADD KEY `CPayment_TransactionType` (`CPayment_TransactionType`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `CPayment_brunchid` (`CPayment_brunchid`),
  ADD KEY `CPayment_status` (`CPayment_status`);

--
-- Indexes for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  ADD PRIMARY KEY (`Damage_SlNo`),
  ADD KEY `Damage_InvoiceNo` (`Damage_InvoiceNo`),
  ADD KEY `Damage_Date` (`Damage_Date`),
  ADD KEY `status` (`status`),
  ADD KEY `Damage_brunchid` (`Damage_brunchid`);

--
-- Indexes for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  ADD PRIMARY KEY (`DamageDetails_SlNo`),
  ADD KEY `Damage_SlNo` (`Damage_SlNo`),
  ADD KEY `Product_SlNo` (`Product_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`Department_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`Designation_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`District_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`Employee_SlNo`),
  ADD KEY `Designation_ID` (`Designation_ID`),
  ADD KEY `Department_ID` (`Department_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Employee_brinchid` (`Employee_brinchid`);

--
-- Indexes for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_date` (`payment_date`),
  ADD KEY `month_id` (`month_id`),
  ADD KEY `status` (`status`),
  ADD KEY `paymentBranch_id` (`branch_id`),
  ADD KEY `saved_by` (`saved_by`);

--
-- Indexes for table `tbl_employee_payment_details`
--
ALTER TABLE `tbl_employee_payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `payment_id` (`payment_id`) USING BTREE,
  ADD KEY `employee_id` (`employee_id`) USING BTREE,
  ADD KEY `saved_by` (`saved_by`) USING BTREE;

--
-- Indexes for table `tbl_expense_head`
--
ALTER TABLE `tbl_expense_head`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_investment_account`
--
ALTER TABLE `tbl_investment_account`
  ADD PRIMARY KEY (`Acc_SlNo`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `Acc_Code` (`Acc_Code`) USING BTREE;

--
-- Indexes for table `tbl_investment_transactions`
--
ALTER TABLE `tbl_investment_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `status` (`status`),
  ADD KEY `saved_by` (`saved_by`) USING BTREE,
  ADD KEY `account_id` (`account_id`) USING BTREE;

--
-- Indexes for table `tbl_loan_accounts`
--
ALTER TABLE `tbl_loan_accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `save_date` (`save_date`),
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_loan_transactions`
--
ALTER TABLE `tbl_loan_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`),
  ADD KEY `saved_by` (`saved_by`) USING BTREE;

--
-- Indexes for table `tbl_materialcategory`
--
ALTER TABLE `tbl_materialcategory`
  ADD PRIMARY KEY (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `category_branchid` (`category_branchid`);

--
-- Indexes for table `tbl_materials`
--
ALTER TABLE `tbl_materials`
  ADD PRIMARY KEY (`material_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_material_damage`
--
ALTER TABLE `tbl_material_damage`
  ADD PRIMARY KEY (`damage_id`),
  ADD UNIQUE KEY `invoice` (`invoice`),
  ADD KEY `damage_date` (`damage_date`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_material_damage_details`
--
ALTER TABLE `tbl_material_damage_details`
  ADD PRIMARY KEY (`damage_details_id`),
  ADD KEY `damage_id` (`damage_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_material_purchase`
--
ALTER TABLE `tbl_material_purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `purchase_date` (`purchase_date`),
  ADD KEY `purchase_for` (`purchase_for`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_material_purchase_details`
--
ALTER TABLE `tbl_material_purchase_details`
  ADD PRIMARY KEY (`purchase_detail_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_material_requisition`
--
ALTER TABLE `tbl_material_requisition`
  ADD PRIMARY KEY (`requisition_id`);

--
-- Indexes for table `tbl_material_requisition_details`
--
ALTER TABLE `tbl_material_requisition_details`
  ADD PRIMARY KEY (`requisition_detail_id`);

--
-- Indexes for table `tbl_month`
--
ALTER TABLE `tbl_month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`Product_SlNo`),
  ADD UNIQUE KEY `Product_Code` (`Product_Code`) USING BTREE,
  ADD KEY `ProductCategory_ID` (`ProductCategory_ID`),
  ADD KEY `is_service` (`is_service`),
  ADD KEY `Unit_ID` (`Unit_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Product_branchid` (`Product_branchid`);

--
-- Indexes for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  ADD PRIMARY KEY (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `category_branchid` (`category_branchid`);

--
-- Indexes for table `tbl_productions`
--
ALTER TABLE `tbl_productions`
  ADD PRIMARY KEY (`production_id`),
  ADD UNIQUE KEY `production_sl` (`production_sl`),
  ADD KEY `date` (`date`),
  ADD KEY `incharge_id` (`incharge_id`),
  ADD KEY `shift` (`shift`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_production_details`
--
ALTER TABLE `tbl_production_details`
  ADD KEY `production_id` (`production_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_production_products`
--
ALTER TABLE `tbl_production_products`
  ADD PRIMARY KEY (`production_products_id`),
  ADD KEY `production_id` (`production_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  ADD PRIMARY KEY (`PurchaseDetails_SlNo`),
  ADD KEY `PurchaseMaster_IDNo` (`PurchaseMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseDetails_branchID` (`PurchaseDetails_branchID`);

--
-- Indexes for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  ADD PRIMARY KEY (`PurchaseMaster_SlNo`),
  ADD KEY `Supplier_SlNo` (`Supplier_SlNo`),
  ADD KEY `Employee_SlNo` (`Employee_SlNo`),
  ADD KEY `PurchaseMaster_InvoiceNo` (`PurchaseMaster_InvoiceNo`),
  ADD KEY `PurchaseMaster_OrderDate` (`PurchaseMaster_OrderDate`),
  ADD KEY `status` (`status`),
  ADD KEY `PurchaseMaster_BranchID` (`PurchaseMaster_BranchID`);

--
-- Indexes for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  ADD PRIMARY KEY (`PurchaseReturn_SlNo`),
  ADD KEY `PurchaseMaster_InvoiceNo` (`PurchaseMaster_InvoiceNo`),
  ADD KEY `Supplier_IDdNo` (`Supplier_IDdNo`),
  ADD KEY `PurchaseReturn_ReturnDate` (`PurchaseReturn_ReturnDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseReturn_brunchID` (`PurchaseReturn_brunchID`);

--
-- Indexes for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  ADD PRIMARY KEY (`PurchaseReturnDetails_SlNo`),
  ADD KEY `PurchaseReturn_SlNo` (`PurchaseReturn_SlNo`),
  ADD KEY `PurchaseReturnDetailsProduct_SlNo` (`PurchaseReturnDetailsProduct_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseReturnDetails_brachid` (`PurchaseReturnDetails_brachid`);

--
-- Indexes for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  ADD PRIMARY KEY (`quotation_customer_id`),
  ADD KEY `quation_customer_branchid` (`quation_customer_branchid`);

--
-- Indexes for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  ADD PRIMARY KEY (`SaleDetails_SlNo`),
  ADD KEY `SaleMaster_IDNo` (`SaleMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleDetails_BranchId` (`SaleDetails_BranchId`);

--
-- Indexes for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  ADD PRIMARY KEY (`SaleMaster_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SaleMaster_SaleDate` (`SaleMaster_SaleDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleMaster_branchid` (`SaleMaster_branchid`);

--
-- Indexes for table `tbl_recipe`
--
ALTER TABLE `tbl_recipe`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `tbl_recipe_materials`
--
ALTER TABLE `tbl_recipe_materials`
  ADD PRIMARY KEY (`recipe_material_id`);

--
-- Indexes for table `tbl_recipe_product`
--
ALTER TABLE `tbl_recipe_product`
  ADD PRIMARY KEY (`recipe_product_id`);

--
-- Indexes for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  ADD PRIMARY KEY (`SaleDetails_SlNo`),
  ADD KEY `SaleMaster_IDNo` (`SaleMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleDetails_BranchId` (`SaleDetails_BranchId`);

--
-- Indexes for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  ADD PRIMARY KEY (`SaleReturn_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SaleReturn_ReturnDate` (`SaleReturn_ReturnDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleReturn_brunchId` (`SaleReturn_brunchId`);

--
-- Indexes for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  ADD PRIMARY KEY (`SaleReturnDetails_SlNo`),
  ADD KEY `SaleReturn_IdNo` (`SaleReturn_IdNo`),
  ADD KEY `SaleReturnDetailsProduct_SlNo` (`SaleReturnDetailsProduct_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleReturnDetails_brunchID` (`SaleReturnDetails_brunchID`);

--
-- Indexes for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  ADD PRIMARY KEY (`SaleMaster_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SalseCustomer_IDNo` (`SalseCustomer_IDNo`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `SaleMaster_SaleDate` (`SaleMaster_SaleDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `is_service` (`is_service`),
  ADD KEY `SaleMaster_branchid` (`SaleMaster_branchid`);

--
-- Indexes for table `tbl_shifts`
--
ALTER TABLE `tbl_shifts`
  ADD PRIMARY KEY (`shift_id`);

--
-- Indexes for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`Supplier_SlNo`),
  ADD KEY `Supplier_Code` (`Supplier_Code`),
  ADD KEY `Supplier_Mobile` (`Supplier_Mobile`),
  ADD KEY `District_SlNo` (`District_SlNo`),
  ADD KEY `Country_SlNo` (`Country_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `Supplier_brinchid` (`Supplier_brinchid`);

--
-- Indexes for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  ADD PRIMARY KEY (`SPayment_id`),
  ADD KEY `SPayment_date` (`SPayment_date`),
  ADD KEY `SPayment_invoice` (`SPayment_invoice`),
  ADD KEY `SPayment_customerID` (`SPayment_customerID`),
  ADD KEY `SPayment_TransactionType` (`SPayment_TransactionType`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `SPayment_brunchid` (`SPayment_brunchid`),
  ADD KEY `SPayment_status` (`SPayment_status`);

--
-- Indexes for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  ADD PRIMARY KEY (`transferdetails_id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `transfer_date` (`transfer_date`),
  ADD KEY `transfer_from` (`transfer_from`),
  ADD KEY `transfer_to` (`transfer_to`);

--
-- Indexes for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  ADD PRIMARY KEY (`Unit_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`User_SlNo`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `User_Name` (`User_Name`),
  ADD KEY `User_Password` (`User_Password`),
  ADD KEY `UserType` (`UserType`),
  ADD KEY `status` (`status`),
  ADD KEY `Brunch_ID` (`Brunch_ID`);

--
-- Indexes for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  ADD PRIMARY KEY (`access_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_user_activity`
--
ALTER TABLE `tbl_user_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  MODIFY `as_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  MODIFY `brunch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  MODIFY `Tr_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_color`
--
ALTER TABLE `tbl_color`
  MODIFY `color_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  MODIFY `Company_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `Company_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `Country_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `Customer_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  MODIFY `CPayment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  MODIFY `Damage_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  MODIFY `DamageDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `Department_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `Designation_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `District_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `Employee_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_employee_payment_details`
--
ALTER TABLE `tbl_employee_payment_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_expense_head`
--
ALTER TABLE `tbl_expense_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_investment_account`
--
ALTER TABLE `tbl_investment_account`
  MODIFY `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_investment_transactions`
--
ALTER TABLE `tbl_investment_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_loan_accounts`
--
ALTER TABLE `tbl_loan_accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_loan_transactions`
--
ALTER TABLE `tbl_loan_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_materialcategory`
--
ALTER TABLE `tbl_materialcategory`
  MODIFY `ProductCategory_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_materials`
--
ALTER TABLE `tbl_materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `tbl_material_damage`
--
ALTER TABLE `tbl_material_damage`
  MODIFY `damage_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_material_damage_details`
--
ALTER TABLE `tbl_material_damage_details`
  MODIFY `damage_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_material_purchase`
--
ALTER TABLE `tbl_material_purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_material_purchase_details`
--
ALTER TABLE `tbl_material_purchase_details`
  MODIFY `purchase_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_material_requisition`
--
ALTER TABLE `tbl_material_requisition`
  MODIFY `requisition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_material_requisition_details`
--
ALTER TABLE `tbl_material_requisition_details`
  MODIFY `requisition_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_month`
--
ALTER TABLE `tbl_month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `Product_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  MODIFY `ProductCategory_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_productions`
--
ALTER TABLE `tbl_productions`
  MODIFY `production_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_production_products`
--
ALTER TABLE `tbl_production_products`
  MODIFY `production_products_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  MODIFY `PurchaseDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  MODIFY `PurchaseMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  MODIFY `PurchaseReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  MODIFY `PurchaseReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  MODIFY `quotation_customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_recipe`
--
ALTER TABLE `tbl_recipe`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_recipe_materials`
--
ALTER TABLE `tbl_recipe_materials`
  MODIFY `recipe_material_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_recipe_product`
--
ALTER TABLE `tbl_recipe_product`
  MODIFY `recipe_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  MODIFY `SaleReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  MODIFY `SaleReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_shifts`
--
ALTER TABLE `tbl_shifts`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `Supplier_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  MODIFY `SPayment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  MODIFY `transferdetails_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `Unit_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `User_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user_activity`
--
ALTER TABLE `tbl_user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

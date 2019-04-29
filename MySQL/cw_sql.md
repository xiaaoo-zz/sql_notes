## 4 Implementation

### 4.1 Create table Book
```sql
CREATE TABLE Book (
  bookISBN NUMBER PRIMARY KEY,
  bookTitle TEXT, -- e
  bookPrice TEXT,
  -- bookQuantity NUMBER,
  -- bookLocationID NUMBER,
  bookAuthorFirstName TEXT,
  bookAuthorSurname TEXT, -- e
  bookEdition NUMBER,
  -- bookLanguage TEXT,
  bookPublisher TEXT,
  -- bookPublicationDate DATE

  -- why do we need `book quantity`
);
```

### 4.2 create table staff

```sql
CREATE TABLE Staff (
  staffID TEXT PRIMARY KEY,
  staffPhoneNumber TEXT,
  staffPosition TEXT,
  staffFirstName TEXT,
  staffSurname TEXT,
  staffEmail TEXT, -- ++
  staffGender TEXT -- ++
  -- 感觉有必要加一个staff属于哪个branch的reference 但是这样会导致一个他可能属于physical 或online store
);
```

### 4.3 create table customer
```sql
CREATE TABLE Customer (
  customerID TEXT PRIMARY KEY,
  customerFirstName TEXT,
  customerSurname TEXT, -- e
  customerEmail TEXT,
  customerAge NUMBER,
  customerGender TEXT,
  customerCustomerLevel TEXT NOT NULL,
  customerProvince TEXT,
  customerCity TEXT,
  customerDistrict TEXT,
  customerAddressDetails TEXT,
  customerVIPLevel NUMBER,
  managerID TEXT REFERENCES Manager(ManagerID)
  -- DELETE Zip Code
  -- Customer Level (去年有一个单独弄出来了一个Table
)
```

### 4.4 create table manager
```SQL
CREATE TABLE Manager (
  managerID TEXT PRIMARY KEY,
  managerPhoneNumber TEXT,
  managerPosition TEXT,
  managerFirstName TEXT,
  managerSurname TEXT,
  managerEmail TEXT, -- ++
  managerDepartment TEXT,
  -- managerGender TEXT -- ++
  -- 感觉有必要加一个staff属于哪个branch的reference 但是这样会导致一个他可能属于physical 或online store
);
```
### 4.5 create table order
```sql
CREATE TABLE Order (
  orderID TEXT PRIMARY KEY,
  bookISBN TEXT NOT NULL Book(bookISBN),
  customerID TEXT REFERENCES Customer(customerID),
  staffID TEXT NOT NULL REFERENCES Staff(staffID),
  expressID TEXT REFERENCES Express(expressID),
  storeID TEXT REFERENCES Store(StoreID),
  orderType TEXT NOT NULL,
  orderStatus TEXT,
  orderPaymentMethod TEXT NOT NULL,
  orderDiscount NUMBER, -- ??
  orderTotalPrice NUMBER NOT NULL,
  orderDate DATE NOT NULL,
  -- 1. How to handle storeID, as a foreign key cannot reference to multiple tables
  -- 2. do we need Table `OrderDetail`?
);
```

### 4.5.1 create table order details
```sql
CREATE TABLE OrderDetails (
  orderID TEXT PRIMARY KEY, -- only one primary key is enough
  bookISNB TEXT NOT NULL Book(bookISBN),
  orderQuantity NUMBER NOT NULL,
);
```

### 4.6 create table store
```sql
CREATE TABLE Store (
  storeID TEXT PRIMARY KEY,
  storeType TEXT NOT NULL,
  managerID TEXT REFERENCES Manager(managerID),
  storeDistrict TEXT,
  storeAdressDetails TEXT
);
```

### 4.7 create table warehouse
```sql
CREATE TABLE Warehouse (
  warehouseID TEXT PRIMARY KEY,
  warehousePhoneNumber TEXT,
  warehouseAdressDetetails TEXT,
  managerID TEXT REFERENCES Manager(managerID),
);
```

### 4.8 create table express
```sql
CREATE TABLE Express (
  expresID TEXT PRIMARY KEY,
  expressCompany TEXT,
  expressProcess TEXT,
);
```

### 4.8 create table aftersale service
```sql
CREATE TABLE AftersalesService (
  aftersalesServiceID TEXT PRIMARY KEY,
  orderID TEXT REFERENCES Order(orderID),
  aftersalesServiceType TEXT
);
```

### 4.9 create table feedback
```sql
CREATE TABLE Feedback (
  feedbackID TEXT PRIMARY KEY,
  orderID TEXT REFERENCES Order(orderID),
  feedbackRating NUMBER,
  feedbackDetails TEXT
);
```

## 5 SQL queries

### 5.1 find customers with the most frequent purchases

```sql
SELECT customerName, customerAge, customerPhoneNumber,
  (SELECT COUNT(*)
    FROM Order
    WHERE Order.customerID = Customer.CustomerID) AS orders
  FROM Customer,
  GROUP BY customerName
  ORDER BY orders DESC;
```


### 5.2 find the top 5 selling book
```sql
SELECT bookISBN, bookTitle
  (SELECT COUNT(*)
    FROM Order
    WHERE Order.bookISBN = Book.bookISBN) AS sales
  FROM Book,
  GROUP BY customerName
  ORDER BY sales DESC
  LIMIT 5;
```

### 5.3 book feedback
```sql
SELECT AVG(feedbackRating)
  (SELECT bookISBN
    FROM Order
    WHERE Order.orderID = Feedback.orderID)
  FROM Feedback
```


### 5.4 sales in age distributions
```sql
-- NOT FINISHED
SELECT
  customerAge,
  IIF(customerAge < 20, "<20",
  IIF(customerAge >= 20 AND customerAge < 25, "20-24",
  IIF(customerAge >= 25 AND customerAge < 30, "25-29",
  IIF(customerAge >= 35 AND customerAge < 35, "30-34",
  IIF(customerAge >= 35 AND customerAge < 40, "35-40",
  IIF(customerAge > 40, ">40")))))) AS AgeDistribution,
  (SELECT COUNT(*)
    FROM Order
    WHERE )
  FROM Customer
  ORDER BY sales DESC;
```
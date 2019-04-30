# SQL queries

* [Online, offline, and cross-channel customers](#customer)
* [Online/ Physical bookstore managers
](#manager)
* [CRM](#CRM)
* [After-sale service managers](#Aftersales)

## Customer

没想到什么复杂的功能 best selling book？

### 1.1 create membership
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
)
```

### 1.2 create table order
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
);
```


### 1.3 insert and update feedback
```sql
CREATE TABLE OrderDetails (
  orderID TEXT PRIMARY KEY, -- only one primary key is enough
  bookISNB TEXT NOT NULL Book(bookISBN),
  orderQuantity NUMBER NOT NULL,
);
```

---

## Manager

to find the best selling books based on users' rating


---

## CRM

to find the customer with most purchases in a given period of time


---

## Aftersales



---

### 4.5.1 create table order details
```sql
CREATE TABLE OrderDetails (
  orderID TEXT PRIMARY KEY, -- only one primary key is enough
  bookISNB TEXT NOT NULL Book(bookISBN),
  orderQuantity NUMBER NOT NULL,
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

# 5 SQL queries

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
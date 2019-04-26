## 4 Implementation

### 4.1 Create table Book
```sql
CREATE TABLE Book (
  bookISBN NUMBER PRIMARY KEY,
  bookTitle TEXT,
  bookPrice TEXT,
  bookQuantity NUMBER,
  bookLocationID NUMBER,
  bookAuthorFirstName TEXT,
  bookAuthorLastName TEXT,
  bookEdition NUMBER,
  bookLanguage TEXT,
  bookPublisher TEXT,
  bookPublicationDate DATE
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
  customerSurname TEXT,
  customerEmail TEXT,
  customerAge NUMBER,
  customerGender TEXT,
  customerCustomerLevel TEXT NOT NULL,
  customerProvince TEXT,
  customerCity TEXT,
  customerDistrict TEXT,
  customerAddressDetails TEXT
  -- DELETE Zip Code
  -- Customer Level (去年有一个单独弄出来了一个Table
)
```

### 4.4 create table order
```sql
CREATE TABLE Order (
  orderID TEXT PRIMARY KEY,
  bookID TEXT NOT NULL Book(bookISBN),
  customerID TEXT REFERENCES Customer(customerID),
  staffID TEXT NOT NULL REFERENCES Staff(staffID),
  expressID TEXT REFERENCES Express(expressID),
  storeID TEXT REFERENCES Store(StoreID),
  orderPaymentMethod TEXT NOT NULL,
  orderQuantity NUMBER NOT NULL,
  orderDiscount NUMBER, -- ??
  orderTotalPrice NUMBER NOT NULL,
  orderDate DATE NOT NULL,
  -- 1. How to handle storeID, as a foreign key cannot reference to multiple tables
  -- 2. do we need Table `OrderDetail`?
);
```

## Notes

### Changes to Book Table
Table `Book Product` -> `Book`

bName -> bTitle

++ publication date
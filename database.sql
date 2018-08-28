//changes
CREATE TABLE users (
  userid int PRIMARY KEY,
  firstname varchar(45) NOT NULL,
  lastname varchar(45) DEFAULT NULL,
  email varchar(55) NOT NULL,
  password varchar(128) NOT NULL,
  enable int DEFAULT NULL,
  role varchar(45) NOT NULL
  contact varchar(20) DEFAULT NULL
)

CREATE TABLE state (
  stateid int PRIMARY KEY,
  statename varchar(45) DEFAULT NULL
  
)


CREATE TABLE city (
  cityid int PRIMARY KEY,
  cityname varchar(45) DEFAULT NULL
  
)


CREATE TABLE address (
  addressid int PRIMARY KEY,
  houseno varchar(45) NOT NULL,
  street varchar(45) NOT NULL,
  pincode int NOT NULL,
  stateid int NOT NULL,
  cityid int NOT NULL,
  userid int DEFAULT NULL,
  FOREIGN KEY (cityid) REFERENCES city (cityid) ,
  FOREIGN KEY (stateid) REFERENCES state (stateid),
  FOREIGN KEY (userid) REFERENCES users (userid)
)

CREATE TABLE parentcategory (
  parentcategoryid int PRIMARY KEY,
  parentcategoryname varchar(45) NOT NULL
  )

CREATE TABLE subcategory (
  subcategoryid int PRIMARY KEY,
  subcategoryname varchar(45) NOT NULL,
  parentcategoryid int DEFAULT NULL,
  FOREIGN KEY (parentcategoryid) REFERENCES parentcategory (parentcategoryid)

  )


CREATE TABLE brand (
  brandid int PRIMARY KEY,
  brandname varchar(45) NOT NULL
  )

CREATE TABLE product (
  productid int PRIMARY KEY,
  productname varchar(45) NOT NULL,
  price decimal(10,0) NOT NULL,
  discount decimal(10,0) DEFAULT NULL,
  description varchar(1024) DEFAULT NULL,

  subcategoryid int NOT NULL,
  brandid int NOT NULL,
  
   FOREIGN KEY (brandid) REFERENCES brand (brandid),
   FOREIGN KEY (subcategoryid) REFERENCES subcategory (subcategoryid)
  )


//changes
CREATE TABLE reviews (
  reviewid int PRIMARY KEY,
  productname varchar(45) NOT NULL,
  review varchar(1024) NULL,
  rate int NULL,
  approve boolean,
  productid int,
  userid int,
  FOREIGN KEY (userid) REFERENCES users (userid)

  )

CREATE TABLE stock (
  stockid int PRIMARY KEY,
  color varchar(45) NOT NULL,
  maxquantity varchar(20),
  productid int,
  
  FOREIGN KEY (productid) REFERENCES product (productid)

  )

CREATE TABLE shipping (
  shippingid int PRIMARY KEY,
  shippingstatus varchar(45) NOT NULL,
  shippingaddressid int,
  billingaddressid int,
  deliverydate date,
  
  FOREIGN KEY (shippingaddressid) REFERENCES address (addressid),
  FOREIGN KEY (billingaddressid) REFERENCES address (addressid)

  )

CREATE TABLE cart (
  cartid int PRIMARY KEY,
  subtotal decimal(12,2) NOT NULL,
  userid int(12) DEFAULT NULL,
  orderflag int,
 FOREIGN KEY (userid) REFERENCES users (userid)
 
)

CREATE TABLE cartstock (

  cartid int NOT NULL,
  stockid int NOT NULL,
  quantity decimal(12,2) NOT NULL,
  FOREIGN KEY (cartid) REFERENCES cart (cartid),
  FOREIGN KEY (stockid ) REFERENCES stock (stockid)
)

CREATE TABLE orders(
  orderid int PRIMARY KEY,
  cartid int NOT NULL,
  shippingid int NOT NULL,
  subtotal decimal(12,2) NOT NULL,
  status varchar(45) NOT NULL,
  orderdate date NOT NULL,
  deliverydate  varchar(45) NOT NULL,
  
 FOREIGN KEY (cartid) REFERENCES cart (cartid),
 FOREIGN KEY (shippingid) REFERENCES shipping (shippingid)

)

CREATE TABLE payment(
	transid int PRIMARY KEY,
  orderid int DEFAULT NULL,
  mode varchar(45) DEFAULT NULL,
  paymentstatus varchar(45) DEFAULT NULL,
  FOREIGN KEY (orderid) REFERENCES order (orderid)
  )


CREATE TABLE return (
  returnid int  PRIMARY KEY,
  productid int NOT NULL,
  returnstatus varchar(45) DEFAULT NULL,
  
  returndate date DEFAULT NULL,
  userid int NOT NULL,
  FOREIGN KEY (productid) REFERENCES product (productid),
  FOREIGN KEY (userid) REFERENCES users (userid)
  )

CREATE TABLE invoice (
  invoiceid int PRIMARY KEY,
  orderid int DEFAULT NULL,
  subtotal decimal(12,2) DEFAULT NULL,
  productid int NOT NULL
  orderdate date DEFAULT NULL,
  shippingid int DEFAULT NULL,
  FOREIGN KEY (orderid) REFERENCES orders (orderid),
  FOREIGN KEY (productid) REFERENCES product (productid),

  FOREIGN KEY (shippingid) REFERENCES shipping (shippingid)
  )

CREATE TABLE count(
  productid int,
  count1 int DEFAULT NULL,
  count2 int DEFAULT NULL,
  count3 int DEFAULT NULL,
  count4 int DEFAULT NULL,
  count5 int DEFAULT NULL,
  FOREIGN KEY (productid) REFERENCES product (productid),
)


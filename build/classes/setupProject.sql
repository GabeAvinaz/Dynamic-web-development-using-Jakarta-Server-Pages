CREATE TABLE COUPON 
(c_id           VARCHAR2(8),
c_code          VARCHAR2(25),
c_store_id      VARCHAR2(6)     NOT NULL,
c_title         VARCHAR2(20)    NOT NULL,
c_description   VARCHAR2(255),
c_restriction   VARCHAR2(255),
c_disc_type     VARCHAR2(15)    NOT NULL,
c_disc_amt      NUMBER(7,2),
c_start_date    DATE            NOT NULL,
c_end_date      DATE,
CONSTRAINT pk_c_id PRIMARY KEY(c_id),
CONSTRAINT chk_date  CHECK (c_end_date  >= c_start_date));

CREATE TABLE USER_INFO
(u_id           VARCHAR2(6),
u_access_lvl    CHAR(1)         NOT NULL,
u_fname         VARCHAR2(25)    NOT NULL,
u_lname         VARCHAR2(25)    NOT NULL,
u_email         VARCHAR2(35),
CONSTRAINT pk_u_id PRIMARY KEY(u_id));

CREATE TABLE STORE
(s_id           VARCHAR(6),
s_name          VARCHAR2(10)    NOT NULL,
s_user_id       VARCHAR(6)      NOT NULL,
CONSTRAINT pk_s_id PRIMARY KEY(s_id));



ALTER TABLE COUPON
ADD CONSTRAINT fk_c_s 
FOREIGN KEY (c_store_id) REFERENCES STORE(s_id);

ALTER TABLE STORE
ADD CONSTRAINT fk_s_u 
FOREIGN KEY (s_user_id) REFERENCES USER_INFO(u_id);



CREATE SEQUENCE seq_coupon
MINVALUE 1 START WITH 1
INCREMENT BY 1 CACHE 10;

CREATE SEQUENCE seq_user
MINVALUE 1 START WITH 1
INCREMENT BY 1 CACHE 10;

CREATE SEQUENCE seq_store
MINVALUE 1 START WITH 1
INCREMENT BY 1 CACHE 10;



INSERT INTO USER_INFO VALUES (seq_user.nextval, 'A', 'Gabriel', 'Avinaz', 'gavinaz@my365.bellevue.edu');
INSERT INTO USER_INFO VALUES (seq_user.nextval, 'R', 'John', 'Smith', 'Jsmith@Michaels.com');
INSERT INTO USER_INFO VALUES (seq_user.nextval, 'R', 'Sally', 'Jenkins', 'SJenki001@Target.com');
INSERT INTO USER_INFO VALUES (seq_user.nextval, 'U', 'Del', 'Molin', 'Del.Molin@Gmail.com');
INSERT INTO USER_INFO VALUES (seq_user.nextval, 'U', 'Krista', 'Stephenson', 'CraftGirl121@yahoo.com');
INSERT INTO USER_INFO VALUES (seq_user.nextval, 'U', 'Doug', 'Farmer', 'DougsDonuts@AOL.com');
INSERT INTO USER_INFO VALUES (seq_user.nextval, 'R', 'Sam', 'Perez', 'PereS@AMC.com');


INSERT INTO STORE VALUES (seq_store.nextval, 'Michaels', 000002);
INSERT INTO STORE VALUES (seq_store.nextval, 'Target', 000003);
INSERT INTO STORE VALUES (seq_store.nextval, 'AMC', 000007);

INSERT INTO COUPON (c_id, c_code, c_store_id, c_title, c_description, c_restriction, c_disc_type, c_disc_amt, c_start_date, c_end_date)
VALUES (seq_coupon.nextval, '70D20530', 000001, '40% Off Any One Item', 'Save 40% off any one regular priced item', 'Limit one coupon per product. Limit one coupon of each type per day', 'PERCENT', 0.40, SYSDATE, SYSDATE + 7);
INSERT INTO COUPON (c_id, c_code, c_store_id, c_title, c_description, c_restriction, c_disc_type, c_disc_amt, c_start_date, c_end_date)
VALUES (seq_coupon.nextval, '9BE9DEE4', 000001, '20% Off', 'All regular priced items', 'Limit one coupon per product. Limit one coupon of each type per day', 'PERCENT', 0.20, SYSDATE, SYSDATE + 7);
INSERT INTO COUPON (c_id, c_code, c_store_id, c_title, c_description, c_restriction, c_disc_type, c_disc_amt, c_start_date, c_end_date)
VALUES (seq_coupon.nextval, '19FE49CA', 000001, '$5 Off', 'Any one regular priced item', 'Limit one coupon per product. Limit one coupon of each type per day', 'FLATRATE', 5, SYSDATE, SYSDATE + 14);

INSERT INTO COUPON (c_id, c_code, c_store_id, c_title, c_description, c_restriction, c_disc_type, c_disc_amt, c_start_date, c_end_date)
VALUES (seq_coupon.nextval, '00B7392C75CFEC5E', 000002, 'BOGO', 'Buy one, get one free on all athletic footwear', 'Limit one coupon per transaction.', 'BOGO', null, SYSDATE, SYSDATE + 14);
INSERT INTO COUPON (c_id, c_code, c_store_id, c_title, c_description, c_restriction, c_disc_type, c_disc_amt, c_start_date, c_end_date)
VALUES (seq_coupon.nextval, 'EC5240DFF49D740B', 000002, 'BOGO 50% OFF', 'Buy one, get one 50% designer fragrances', 'Limit one coupon per transaction.', 'BOGOHALF', null, SYSDATE, SYSDATE + 4);
INSERT INTO COUPON (c_id, c_code, c_store_id, c_title, c_description, c_restriction, c_disc_type, c_disc_amt, c_start_date, c_end_date)
VALUES (seq_coupon.nextval, '8C55563ADE0706CF', 000002, 'FREE CHIPS AND DRINK', 'Free chips and drink with the purchase of an entree in out food court', 'Limit one per customer.', 'BOGOHALF', null, SYSDATE, SYSDATE + 14);

INSERT INTO COUPON (c_id, c_code, c_store_id, c_title, c_description, c_restriction, c_disc_type, c_disc_amt, c_start_date, c_end_date)
VALUES (seq_coupon.nextval, 'C288F0F2', 000003, '1 FREE Concession', 'Get a free small concession with the purchase of a large popcorn', 'Limit one per customer.', 'FREE', null, SYSDATE, SYSDATE + 14);
INSERT INTO COUPON (c_id, c_code, c_store_id, c_title, c_description, c_restriction, c_disc_type, c_disc_amt, c_start_date, c_end_date)
VALUES (seq_coupon.nextval, '20816625B1B6B5A7', 000003, '$7 OFF MOVIE TICKET', '', 'Limit one per customer per day. Cannot reduce price below ', 'FLATRATE', 7, SYSDATE, NULL);
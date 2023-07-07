/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2023/7/7 16:26:17                            */
/*==============================================================*/


drop table if exists account;

drop table if exists address;

drop table if exists deliverer;

drop table if exists merchandise;

drop table if exists orderDetail;

drop table if exists orders;

drop table if exists shop;

drop table if exists user;

/*==============================================================*/
/* Table: account                                               */
/*==============================================================*/
create table account
(
   accountID            int not null auto_increment,
   password             varchar(64) not null,
   nickname             varchar(64),
   accountPhone         char(11) not null,
   email                varchar(64),
   avatar               varchar(64),
   primary key (accountID)
);

/*==============================================================*/
/* Table: address                                               */
/*==============================================================*/
create table address
(
   addressID            int not null,
   accountID            int,
   address              varchar(64) not null,
   phone                char(11) not null,
   primary key (addressID)
);

/*==============================================================*/
/* Table: deliverer                                             */
/*==============================================================*/
create table deliverer
(
   delivererID          int not null,
   primary key (delivererID)
);

/*==============================================================*/
/* Table: merchandise                                           */
/*==============================================================*/
create table merchandise
(
   merchandiseID        int not null auto_increment,
   shopID               int not null,
   merchandiseName      varchar(64) not null,
   merchandisePrice     float not null,
   merchandiseImgPath   varchar(64) not null,
   merchandiseStatus    tinyint not null,
   primary key (merchandiseID)
);

/*==============================================================*/
/* Table: orderDetail                                           */
/*==============================================================*/
create table orderDetail
(
   orderID              int not null,
   merchandiseID        int not null,
   orderNum             int not null
);

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   orderID              int not null auto_increment,
   delivererID          int,
   userID               int not null,
   shopID               int not null,
   status               smallint not null,
   createTime           datetime not null,
   payTime              datetime,
   merchantAssureTime   datetime,
   merchantFinishTime   datetime,
   delivererGetTime     datetime,
   finishTime           datetime,
   primary key (orderID)
);

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   shopID               int not null auto_increment,
   merchantID           int not null,
   shopName             varchar(64),
   primary key (shopID)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userID               int not null,
   primary key (userID)
);

alter table address add constraint FK_address_accountID_ref_account_accountID foreign key (accountID)
      references account (accountID) on delete restrict on update restrict;

alter table deliverer add constraint FK_deliverer_delivererID_ref_account_accountID foreign key (delivererID)
      references account (accountID) on delete restrict on update restrict;

alter table merchandise add constraint FK_merchandise_shopID_ref_shop_shopID foreign key (shopID)
      references shop (shopID) on delete restrict on update restrict;

alter table orderDetail add constraint FK_orderDetail_orderID_ref_order_orderID foreign key (orderID)
      references orders (orderID) on delete restrict on update restrict;

alter table orderDetail add constraint FK_orderDetial_merchandiseID_ref_merchandise_merchandiseID foreign key (merchandiseID)
      references merchandise (merchandiseID) on delete restrict on update restrict;

alter table orders add constraint FK_order_delivererID_ref_deliverer_delivererID foreign key (delivererID)
      references deliverer (delivererID) on delete restrict on update restrict;

alter table orders add constraint FK_order_shopID_ref_order_shopID foreign key (shopID)
      references shop (shopID) on delete restrict on update restrict;

alter table orders add constraint FK_order_userID_ref_user_userID foreign key (userID)
      references user (userID) on delete restrict on update restrict;

alter table shop add constraint FK_Reference_10 foreign key (merchantID)
      references account (accountID) on delete restrict on update restrict;

alter table user add constraint FK_user_userID_ref_account_accountID foreign key (userID)
      references account (accountID) on delete restrict on update restrict;


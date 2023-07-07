/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2023/6/30 9:35:57                            */
/*==============================================================*/


drop table if exists account;

drop table if exists address;

drop table if exists deliverer;

drop table if exists merchandise;

drop table if exists merchant;

drop table if exists orders;

drop table if exists shop;

drop table if exists user;

/*==============================================================*/
/* Table: account                                               */
/*==============================================================*/
create table account
(
   accountID            int not null auto_increment,
   userID               int,
   merchantID           int,
   password             varchar(32) not null,
   account              varchar(32) not null,
   phone                char(11) not null,
   email                varchar(32),
   avatar               varchar(64) not null,
   type                 smallint,
   primary key (accountID)
);

/*==============================================================*/
/* Table: address                                               */
/*==============================================================*/
create table address
(
   communicationID      int not null auto_increment,
   shopID               int,
   accountID            int,
   address              varchar(64) not null,
   primary key (communicationID)
);

alter table address comment '地址信息';

/*==============================================================*/
/* Table: deliverer                                             */
/*==============================================================*/
create table deliverer
(
   delivererID          int not null auto_increment,
   delivererNickname    varchar(64) not null,
   delivererStatus      smallint not null,
   primary key (delivererID)
);

/*==============================================================*/
/* Table: merchandise                                           */
/*==============================================================*/
create table merchandise
(
   merchandiseID        int not null auto_increment,
   shopID               int,
   orderID              int,
   merchandiseName      varchar(64) not null,
   price                int not null,
   path                 longtext not null,
   merchandiseStatus    tinyint not null,
   primary key (merchandiseID)
);

/*==============================================================*/
/* Table: merchant                                              */
/*==============================================================*/
create table merchant
(
   merchantID           int not null auto_increment,
   accountID            int,
   merchantNickname     varchar(64) not null,
   primary key (merchantID)
);

alter table merchant comment 'Merchant表示商家';

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   orderID              int not null auto_increment,
   userID               int,
   shopID               int,
   delivererID          int,
   status               smallint not null,
   createTime           datetime not null,
   payTime              datetime,
   finishTime           datetime,
   merchantAssureTime   datetime,
   merchantFinishTime   datetime,
   delivererGetTime     datetime,
   delivererFinishTime  datetime,
   primary key (orderID)
);

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   shopID               int not null auto_increment,
   merchantID           int,
   communicationID      int,
   shopName             varchar(32),
   primary key (shopID)
);

alter table shop comment '一个商家可能有多个商铺
';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userID               int not null auto_increment,
   accountID            int,
   userNickname         varchar(64) not null,
   primary key (userID)
);

alter table account add constraint FK_merchant_has_account2 foreign key (merchantID)
      references merchant (merchantID) on delete restrict on update restrict;

alter table account add constraint FK_user_has_account2 foreign key (userID)
      references user (userID) on delete restrict on update restrict;

alter table address add constraint FK_account_has_addr foreign key (accountID)
      references account (accountID) on delete restrict on update restrict;

alter table address add constraint FK_shop_has_addr2 foreign key (shopID)
      references shop (shopID) on delete restrict on update restrict;

alter table merchandise add constraint FK_order_has_merchandise foreign key (orderID)
      references orders (orderID) on delete restrict on update restrict;

alter table merchandise add constraint FK_shop_has_merchandise foreign key (shopID)
      references shop (shopID) on delete restrict on update restrict;

alter table merchant add constraint FK_merchant_has_account foreign key (accountID)
      references account (accountID) on delete restrict on update restrict;

alter table orders add constraint FK_deliverer_deliver_order foreign key (delivererID)
      references deliverer (delivererID) on delete restrict on update restrict;

alter table orders add constraint FK_merchant_has_order foreign key (shopID)
      references shop (shopID) on delete restrict on update restrict;

alter table orders add constraint FK_user_create_order foreign key (userID)
      references user (userID) on delete restrict on update restrict;

alter table shop add constraint FK_open foreign key (merchantID)
      references merchant (merchantID) on delete restrict on update restrict;

alter table shop add constraint FK_shop_has_addr foreign key (communicationID)
      references address (communicationID) on delete restrict on update restrict;

alter table user add constraint FK_user_has_account foreign key (accountID)
      references account (accountID) on delete restrict on update restrict;


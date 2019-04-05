create table User_(
	user_id int not null auto_increment,
	name_ varchar(20) default "",
    gender varchar(10) default "unknown",
	address varchar(20) default "",
	phone decimal(10),

	primary key (user_id)
	);

create table Category(
	category_id int not null auto_increment,
    name_ varchar(20) default "",
    
    primary key (category_id)
	);
    
create table Product(
	product_id int not null auto_increment,
	name_ varchar(20) default "",
	category_id int,
	price decimal(10),
	
	foreign key (category_id) references Category(category_id),
    primary key (product_id)
	);
    
create table Order_(
	order_id int not null auto_increment,
    user_id int,
    product_id int,
    quantity decimal(5) default 1,
    shipping_status boolean default false,
    timestamp_ date,
    
	foreign key (user_id) references User_(user_id),
    foreign key (product_id) references Product(product_id),
    primary key (order_id)
	);

create table Rating(
	user_id int,
    product_id int,
    rate decimal(1),
    timestamp_ date,

	foreign key (user_id) references User_(user_id),
    foreign key (product_id) references Product(product_id),
    primary key (user_id, product_id)
	);


    
    
create database nvidia_gpu_market_analysis;

create table gpu_info(
	gpu_id int primary key,
	model_name varchar(50),
	release_date date,
	release_year int,
	launch_price_usd numeric(10,2),
	memory_gb int,
	memory_type varchar(30),
	architecture varchar(30),
	cuda_cores int,
	rt_cores int,
	tensor_cores int,
	base_clock_mhz int,
	boost_clock_mhz int,
	tdp_w int
	 foreign key (release_year)
       references market_summary(year)
);


create table market_summary(
	year int,	
	nvidia_market_share_pct numeric,
	nvidia_revenue_billion_usd	numeric(10,2),
	data_center_revenue_billion_usd	numeric(10,2)

);

create table industry_events(
	year int primary key,
	event varchar(100),
	related_to varchar(30),
	foreign key (year)
       references market_summary(year)
);

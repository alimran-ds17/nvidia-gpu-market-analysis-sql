-- ===========================================================
-- NVIDIA GPU Market Analysis (2018–2025)
-- SQL Business Analysis Queries
-- ===========================================================

-------------------------------------------------------------
-- Analysis 1 – GPU Release Trend
--How many GPUs did NVIDIA release each year?
-------------------------------------------------------------
select release_year, count(gpu_id)
from gpu_info
group by release_year
order by release_year;


-------------------------------------------------------------
--Analysis 2 – Average Launch Price
--Did GPU launch prices increase over time?
-------------------------------------------------------------
select release_year,
round(avg(launch_price_usd),2) as avg_launch_price_usd
from gpu_info
group by release_year
order by release_year;


-------------------------------------------------------------
--Analysis 3 – Highest-Priced GPUs
--Which NVIDIA GPUs had the highest launch prices?
-------------------------------------------------------------
select model_name, launch_price_usd
from gpu_info
where launch_price_usd = (

		select max(launch_price_usd)
		from gpu_info
);


-------------------------------------------------------------
--Analysis 4 – VRAM Evolution
--How did GPU VRAM capacity evolve from 2018 to 2025?
-------------------------------------------------------------
select release_year, max(memory_gb) as highest_vram_gb
from gpu_info
group by release_year
order by release_year;


-------------------------------------------------------------
--Analysis 5 – CUDA Core Evolution
--How did CUDA core counts evolve over time?
-------------------------------------------------------------
select release_year,
max(cuda_cores) as highest_cuda_core
from gpu_info
group by release_year
order by release_year;


-------------------------------------------------------------
--Analysis 6 – Memory Type Evolution
--How did GPU memory technology evolve?
-------------------------------------------------------------
select release_year, memory_type
from gpu_info
group by release_year, memory_type
order by release_year;


-------------------------------------------------------------
--Analysis 7 – Architecture Evolution
--How did NVIDIA GPU architectures evolve?
-------------------------------------------------------------
select release_year, architecture
from gpu_info
group by release_year, architecture
order by release_year;



-------------------------------------------------------------
--Analysis 8 – Data Center Revenue Growth
--How did AI expansion impact NVIDIA's Data Center revenue?
-------------------------------------------------------------
select year, data_center_revenue_billion_usd
from market_summary
order by year;



-------------------------------------------------------------
--Analysis 9 – Revenue Growth
--How did NVIDIA's annual revenue change over time?
-------------------------------------------------------------
select year, nvidia_revenue_billion_usd
from market_summary
order by year;



-------------------------------------------------------------
--Analysis 10 – Market Share Growth
--How did NVIDIA's GPU market share change over the years?
-------------------------------------------------------------
select year, nvidia_market_share_pct
from market_summary
order by year;



-------------------------------------------------------------
--Analysis 11 – Price vs VRAM
--Which GPU offers the best value based on price per GB of VRAM?
-------------------------------------------------------------
select model_name, launch_price_usd, memory_gb,
	round(launch_price_usd/memory_gb,2) as price_per_gb 
from gpu_info
order by price_per_gb
limit 1;



-------------------------------------------------------------
--Analysis 12 – Price vs CUDA Cores
--Which GPU offers the best value based on price per CUDA core?
-------------------------------------------------------------
select model_name, launch_price_usd, cuda_cores,
	round(launch_price_usd/cuda_cores,2) as price_per_cuda 
from gpu_info
order by price_per_cuda
limit 1;



-------------------------------------------------------------
--Analysis 13 – Power Efficiency
--Which GPU architecture is the most power efficient?
-------------------------------------------------------------
select model_name, release_year, launch_price_usd, tdp_w
from gpu_info
order by tdp_w
limit 1



-------------------------------------------------------------
/*Analysis 14 – AI Boom Comparison
How did GPU specifications and NVIDIA's business change before
and after the AI boom?

Comparison Periods:

Before AI Boom (2018–2022)
After AI Boom (2023–2025) */
-------------------------------------------------------------
select g.release_year, 
	round(avg(g.launch_price_usd),2) as average_gpu_price,
	round(avg(g.memory_gb),2) as average_vram,
	round(avg(g.cuda_cores),2) as average_cuda_cores,
	m.nvidia_revenue_billion_usd as nvidia_revenue
from gpu_info g
join market_summary m
on g.release_year = m.year
group by g.release_year, m.nvidia_revenue_billion_usd
order by g.release_year;



-------------------------------------------------------------
/*Analysis 15 – Top 10 GPUs

Question:
Rank the Top 10 GPUs based on:

CUDA Cores
VRAM
Launch Price*/
-------------------------------------------------------------
select model_name, cuda_cores,
	memory_gb, launch_price_usd,
	round((memory_gb * cuda_cores)/launch_price_usd,2) as rank_score
from gpu_info
order by rank_score desc
limit 10;



-------------------------------------------------------------
--Analysis 16 – Best GPU of Each Year
--Which GPU was the flagship model released each year?
-------------------------------------------------------------
select release_year, model_name,
		memory_gb, cuda_cores, launch_price_usd
	from (
		select release_year, model_name,
				memory_gb, cuda_cores, launch_price_usd,
				row_number() over(partition by release_year
				order by cuda_cores desc, memory_gb desc
			) as row_num
	from gpu_info
	) 
where row_num = 1
order by release_year;



-------------------------------------------------------------
--Analysis 17 – Revenue vs GPU Releases
--Did releasing more GPUs lead to higher NVIDIA revenue?
-------------------------------------------------------------
select g.release_year, count(g.gpu_id),
		m.nvidia_revenue_billion_usd
from gpu_info g
join market_summary m
on g.release_year = m.year
group by g.release_year, m.nvidia_revenue_billion_usd
order by g.release_year;



-------------------------------------------------------------
--Analysis 18 – AI Events Impact
--How did major AI industry events influence NVIDIA's GPU market?
-------------------------------------------------------------
select g.release_year as year, e.event,
	round(avg(g.launch_price_usd),2) as average_gpu_price,
	m.nvidia_revenue_billion_usd
from industry_events e

join gpu_info g
on e.year = g.release_year
join market_summary m
on e.year = m.year

group by g.release_year, e.event,
m.nvidia_revenue_billion_usd

order by g.release_year;

select *
from PortfolioProject.dbo.NashvilleHousing
order by [UniqueID ]

-- count the null row
select *
from PortfolioProject..NashvilleHousing
where TotalValue is null

select sum( case when TotalValue is null then 1 else 0 end) as [Number of Null]
from PortfolioProject..NashvilleHousing

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Prices
select [UniqueID ],SalePrice, LandValue, BuildingValue ,TotalValue
from PortfolioProject..NashvilleHousing
where TotalValue is not null
and BuildingValue <> 0

------------------------------------------------------------------------------------------------------------------------------------------------------
-- count of selling at a low price(lower than total Value)
select count(case when TotalValue > SalePrice then 1 end) as [Sale Low], count(case when TotalValue < SalePrice then 1 end) as [Sale High]
from PortfolioProject..NashvilleHousing
where TotalValue is not null
and BuildingValue <> 0

------------------------------------------------------------------------------------------------------------------------------------------------------
--  sale price per m2
select SalePrice, (Acreage*4048.86) as [Area(m2)], LandValue, BuildingValue, (SalePrice/(Acreage*4048.86)) as [Price per m2]
from PortfolioProject..NashvilleHousing
where Acreage is not null
order by SalePrice desc
------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tables for tableau visualisation later
with selllow([UniqueID ], SalePrice, TotalValue, YearBuilt, YearSold, LandUse, Bedrooms, FullBath, HalfBath)
as(
select [UniqueID ], SalePrice, TotalValue, YearBuilt, YearSold, LandUse, Bedrooms, FullBath, HalfBath
from PortfolioProject..NashvilleHousing
where TotalValue is not null
and BuildingValue <> 0
and SalePrice < TotalValue
)
select *, (YearSold-YearBuilt) as [Building age]
from selllow

------------------------------------------------------------------------------------------------------------------------------------------------------
-- relationship between sale price and age
--alter table PortfolioProject..NashvilleHousing
--drop column YearSold

alter table PortfolioProject..NashvilleHousing
add YearSold nvarchar(255);

update PortfolioProject..NashvilleHousing
set YearSold = SUBSTRING(cast(SaleDateConverted as nvarchar), 1, CHARINDEX('-', SaleDateConverted)-1)

select *
from PortfolioProject.dbo.NashvilleHousing
order by [UniqueID ]

select [UniqueID ], SalePrice, YearSold, YearBuilt, (YearSold-YearBuilt) as [Building age]
from PortfolioProject..NashvilleHousing
where YearBuilt is not null

-- change NULL in HalfBath column to 0 if its Bedrooms is not NULL

update PortfolioProject..NashvilleHousing 
set HalfBath = 0
where HalfBath is null
and Bedrooms is not null

select [UniqueID ], LandUse, SalePrice, Bedrooms, FullBath, HalfBath
from PortfolioProject..NashvilleHousing
where Bedrooms is not null

select [UniqueID ], SalePrice, PropertySplitCity, OwnerSplitCity
from PortfolioProject..NashvilleHousing

select  OwnerSplitCity, count(OwnerSplitCity) as [Owner City Count]
from PortfolioProject..NashvilleHousing
where OwnerSplitAddress is not null
group by OwnerSplitCity
order by 2 desc



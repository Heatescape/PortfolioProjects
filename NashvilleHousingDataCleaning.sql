-- data cleaning portfolio

select *
from PortfolioProject.dbo.NashvilleHousing
order by PropertyAddress
------------------------------------------------------------------------------------------------------------------------
-- standardise date format

alter table NashvilleHousing
add SaleDateConverted Date;
update NashvilleHousing
set SaleDateConverted = cast(SaleDate as date)
-- check the result
select *
from PortfolioProject.dbo.NashvilleHousing
order by UniqueID
------------------------------------------------------------------------------------------------------------------------
-- populate property address data
select *
from PortfolioProject.dbo.NashvilleHousing
where ParcelID is null
order by ParcelID

-- ParcelID and PropertyAddress should be in one-to-one correspondence, some of the PropertyAddress is null but their ParcelID exsits.
-- Hence we can join the table with itself to check the properties without address and replace them with other coloum that has the same ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject.dbo.NashvilleHousing a
join PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

-- update the data
Update a
set PropertyAddress = isnull(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject.dbo.NashvilleHousing a
join PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

select *
from PortfolioProject.dbo.NashvilleHousing
where PropertyAddress is null

-- done
------------------------------------------------------------------------------------------------------------------------
-- Breaking out Address into Individual coloums (Address, city, state)

select PropertyAddress
from PortfolioProject.dbo.NashvilleHousing

select PortfolioProject.dbo.NashvilleHousing,
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+2, Len(PropertyAddress)) as Address 
from PortfolioProject.dbo.NashvilleHousing

alter table PortfolioProject.dbo.NashvilleHousing
add PropertySplitAddress nvarchar(255);

update PortfolioProject.dbo.NashvilleHousing
set PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)

alter table PortfolioProject.dbo.NashvilleHousing
add PropertySplitCity nvarchar(255);

update PortfolioProject.dbo.NashvilleHousing
set PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+2, Len(PropertyAddress))

select PropertyAddress, PropertySplitAddress, PropertySplitCity
from PortfolioProject.dbo.NashvilleHousing
------------------------------------------------------------------------------------------------------------------------
-- split the OwnerAddress column

select OwnerAddress
from PortfolioProject.dbo.NashvilleHousing

select
PARSENAME(Replace(OwnerAddress,',','.'),3),
PARSENAME(Replace(OwnerAddress,',','.'),2),
PARSENAME(Replace(OwnerAddress,',','.'),1)
from PortfolioProject.dbo.NashvilleHousing


alter table PortfolioProject.dbo.NashvilleHousing
add OwnerSplitAddress nvarchar(255);

update PortfolioProject.dbo.NashvilleHousing
set OwnerSplitAddress = PARSENAME(Replace(OwnerAddress,',','.'),3)

alter table PortfolioProject.dbo.NashvilleHousing
add OwnerSplitCity nvarchar(255);

update PortfolioProject.dbo.NashvilleHousing
set OwnerSplitCity = PARSENAME(Replace(OwnerAddress,',','.'),2)

alter table PortfolioProject.dbo.NashvilleHousing
add OwnerSplitState nvarchar(255);

update PortfolioProject.dbo.NashvilleHousing
set OwnerSplitState = PARSENAME(Replace(OwnerAddress,',','.'),1)

-- check the result
select OwnerAddress, OwnerSplitAddress, OwnerSplitCity, OwnerSplitState
from PortfolioProject.dbo.NashvilleHousing
------------------------------------------------------------------------------------------------------------------------
-- change Y and N to Yes and No in "sold as vacant" field
select distinct SoldAsVacant, count(SoldAsVacant)
from PortfolioProject.dbo.NashvilleHousing
group by SoldAsVacant
order by 2

select SoldAsVacant,
CASe when SoldAsVacant = 'Y' Then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
	 else SoldAsVacant
	 end
from PortfolioProject.dbo.NashvilleHousing

update PortfolioProject.dbo.NashvilleHousing
set SoldAsVacant = CASe when SoldAsVacant = 'Y' Then 'Yes'
						when SoldAsVacant = 'N' then 'No'
						else SoldAsVacant
						end
-- check the result
select distinct SoldAsVacant, count(SoldAsVacant)
from PortfolioProject.dbo.NashvilleHousing
group by SoldAsVacant
order by 2
------------------------------------------------------------------------------------------------------------------------
-- remove duplicates


with RowNumCTE as(
select*,
	Row_number() over (
	partition by ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 order by UniqueID) as Row1
from PortfolioProject.dbo.NashvilleHousing
-- order by ParcelID
)
select*
From RowNumCTE
where Row1 > 1

------------------------------------------------------------------------------------------------------------------------
-- delect unused columns
select *
from PortfolioProject.dbo.NashvilleHousing

alter table PortfolioProject.dbo.NashvilleHousing
drop column OwnerAddress, TaxDistrict, PropertyAddress

alter table PortfolioProject.dbo.NashvilleHousing
drop column SaleDate

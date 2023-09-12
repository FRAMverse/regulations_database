/* Draft DDL for the regulations database
   Ty Garber 4/26/2023
   A diagram can be found here: https://dbdiagram.io/d/62b49dbf69be0b672c2daaff
 */

-- set timezone
set timezone = 'UTC';
show timezone;
-- look up tables
create table fishery_management_year_lut(
    fishery_management_year_id uuid primary key default gen_random_uuid(),
    fishery_management_year text not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table catch_area_lut(
    catch_area_id uuid primary key default gen_random_uuid(),
    parent_catch_area_id uuid references catch_area_lut(catch_area_id) ,
    catch_area_code varchar(4) not null ,
    catch_area_description text not null ,
    geographic_boundary geometry,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table regulation_type_lut(
    regulation_type_id uuid primary key default gen_random_uuid(),
    regulation_type_code varchar(4) not null,
    regulation_type_description text not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table species_lut(
    species_id uuid primary key default gen_random_uuid(),
    species_name varchar(30) not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table regulation_age_lut(
    regulation_age_id uuid primary key default gen_random_uuid(),
    regulation_age_description text not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table regulation_authority_lut(
    regulation_authority_id uuid primary key default gen_random_uuid(),
    regulation_authority_code varchar(5) not null,
    regulation_authority_name varchar(60) not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

--alter table regulation_authority_lut alter column regulation_authority_name type varchar(60);


create table gear_type_lut(
    gear_type_id uuid primary key default gen_random_uuid(),
    gear_type_code varchar(5) not null,
    gear_type_description text not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table fishery_regulation_type_lut(
    fishery_regulation_type_id uuid primary key default gen_random_uuid(),
    fishery_regulation_type_code varchar(5) not null,
    fishery_regulation_type_description varchar(30) not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table species_group_type_lut(
    species_group_type_id uuid primary key default gen_random_uuid(),
    species_group_type_description varchar(30) not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table fishery_type_lut(
    fishery_type_id uuid primary key default gen_random_uuid(),
    fishery_type_code varchar(4) not null,
    fishery_type_description text not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table bag_limit_angler_resident_status_lut(
    bag_limit_angler_resident_status_id uuid primary key default gen_random_uuid(),
    bag_limit_angler_resident_status_description text not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
     );


create table bag_limit_type_lut(
    bag_limit_type_id uuid primary key default gen_random_uuid(),
    big_limit_type_description varchar(30) not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

-- regulation storage tables

create table species_group(
    species_group_id uuid primary key default gen_random_uuid(),
    species_id uuid not null references species_lut(species_id), -- be carefull joining this table!
    bag_limit_id uuid not null references bag_limit(bag_limit_id),
    species_group_type_id uuid references species_group_type_lut(species_group_type_id)
);

create table fishery(
    fishery_id uuid primary key default gen_random_uuid(),
    fishery_type_id uuid not null references fishery_type_lut(fishery_type_id),
    fishery_management_year_id uuid not null references fishery_management_year_lut(fishery_management_year_id),
    catch_area_id uuid not null references catch_area_lut(catch_area_id),
    fishery_description text not null,
    regulation_authority_id uuid not null references regulation_authority_lut(regulation_authority_id),
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table fishery_regulation(
    fishery_regulation_id uuid primary key default gen_random_uuid(),
    fishery_id uuid not null references fishery(fishery_id),
    fishery_regulation_type_id uuid not null references fishery_regulation_type_lut(fishery_regulation_type_id),
    start_datetime timestamptz not null,
    end_datetime timestamptz,
    gear_type_id uuid references gear_type_lut(gear_type_id),
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
);

create table bag_limit(
    bag_limit_id uuid primary key default gen_random_uuid(),
    parent_bag_limit_id uuid references bag_limit(bag_limit_id), -- is this self-relation really needed?
    fishery_regulation_id uuid not null references fishery_regulation(fishery_regulation_id),
    regulation_age_id uuid not null references regulation_age_lut(regulation_age_id),
    regulation_type_id uuid not null references regulation_type_lut(regulation_type_id),
    bag_limit_type_id uuid not null references bag_limit_type_lut(bag_limit_type_id),
    maximum_size_limit_centimeters real,
    minimum_size_limit_centimeters real,
    bag_limit_total integer not null,
    created_by varchar(10) not null,
    created_datetime timestamptz not null,
    modified_by varchar(10),
    modified_datetime timestamptz
                      
);

/*
 These are a set of queries that will populate some of the look up tables
 in the database.
 Ty Garber 4/28/2023
 */

-- insert initial values / small set of values for testing
insert into gear_type_lut (gear_type_code, gear_type_description, created_by, created_datetime)
values
    ('SP', 'Sport/Recreational Fishing Gear', 'garber', now()),
    ('PS', 'Commercial Purse Seine Gear', 'garber', now()),
    ('GN', 'Commerical Gillnet Gear', 'garber', now()),
    ('SN', 'Commerical Set Net Gear', 'garber', now());


insert into bag_limit_angler_resident_status_lut(bag_limit_angler_resident_status_description, created_by, created_datetime)
values
    ('Resident', 'garber', now()),
    ('Non-Resident', 'garber', now()),
    ('Not applicable', 'garber', now());

insert into species_lut (species_name, created_by, created_datetime)
values
    ('Chinook salmon', 'garber', now()),
    ('Coho salmon', 'garber', now()),
    ('Pink salmon', 'garber', now()),
    ('Chum salmon', 'garber', now()),
    ('Sockeye salmon', 'garber', now()),
    ('Bull trout', 'garber', now()),
    ('Steelhead', 'garber', now());

insert into species_group_type_lut(species_group_type_description, created_by, created_datetime)
values ('Salmon', 'garbetjg', now()); -- these groupings are probably different for each agency
-- maybe a column to link to each agency so they can defined

insert into fishery_type_lut (fishery_type_code, fishery_type_description, created_by, created_datetime)
values
    ('CM', 'Commercial fishing', 'garber', now()),
    ('SP', 'Sport or recreational fishing', 'garber', now());

insert into regulation_age_lut
    (regulation_age_description, created_by, created_datetime)
values
    ('Adults', 'garber', now()),
    ('Juveniles', 'garber', now()),
    ('All Ages', 'garber', now());

insert into regulation_type_lut (regulation_type_code, regulation_type_description, created_by, created_datetime)
values
    ('MSF', 'Mark-Selective Fishery', 'garber', now()),
    ('NS', 'Non-Selective Fishery', 'garber', now()),
    ('NR', 'Non-Retention Fishery', 'garber', now()),
    ('CNR', 'Catch and Release Fishery', 'garber', now()),
    ('MIX', 'Mixed Mark-Selective and Non-Selective', 'garber', now()) -- this is probably better represented with another table
    -- leaving sort of ambiguous for now, if needed will figure out a good way to query it out with another table
    ;

insert into regulation_authority_lut
    (regulation_authority_code, regulation_authority_name, created_by, created_datetime)
-- Maybe another table to group these Non-Indigenous/Indigenous?
values
    ('WDFW', 'Washington Department of Fish and Wildlife', 'garber', now()),
    ('ODFW', 'Oregon Department of Fish and Wildlife', 'garber', now()),
    ('ADFG', 'Alaska Department of Fish and Game', 'garber', now()),
    ('DFO', 'Fisheries and Oceans Canada', 'garber', now()),
    ('MIT', 'Muckleshoot Indian Tribe', 'garber', now()),
    ('QIN', 'Quinault Indian Tribe', 'garber', now());

insert into bag_limit_type_lut(big_limit_type_description, created_by, created_datetime)
values ('Annual', 'garber', now()),
        ('Daily', 'garber', now()),
        ('Mixed', 'garber', now()), -- need to better define Mixed/Combined, maybe another column more descriptive
        ('Shared species', 'garber', now()),
        ('First fish encountered', 'garber', now());

insert into fishery_regulation_type_lut
    (fishery_regulation_type_code, fishery_regulation_type_description, created_by, created_datetime)
values ('PB', 'Published', 'garber', now()), -- Dates the fishery was scheduled and presented to constituents
       ('RL', 'Realized', 'garber', now()), -- Dates the fishery actually occured
       ('AG', 'Agree-To', 'garber', now()); -- Agreed-to dates between regulatory authorities

insert into fishery_management_year_lut(fishery_management_year, created_by, created_datetime)
values
    ('2021', 'garber', now()),
    ('2021-2022', 'garber', now()),
    ('2022', 'garber', now()),
    ('2022-2023', 'garber', now()),
    ('2023', 'garber', now());


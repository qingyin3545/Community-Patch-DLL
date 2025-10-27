--enable create item or set new a improvement 

--get the items generate mod 0 = disable, 1 = only improvement, 2 = only feature, 3 = enable all
alter table Improvements add CreatedItemMod integer default 0;
--set quantity > 0 to Generating fixed quantity and set quantity < 0 to Generating random quantity
alter table Improvements add CreatedResourceQuantity integer default 0;
--enable to set a new Improvement or clear itself when built
alter table Improvements add SetNewImprovement text references Improvements(Type);
alter table Improvements add SetNewFeature text references Features(Type);

--add a column to set Generation Class for CreatedItemMod, 0 = disable to Create
--alter table Resources add ResourcesGenerationClass integer default 0;

create table Improvements_Create_Collection (
    ImprovementType text references Improvements(Type),
    TerrainType text references Terrains(Type),
    TerrainOnly boolean default 0,
    FeatureType text references Features(Type),
    FeatureOnly boolean default 0,
    ResourceType text references Resources(Type)
);
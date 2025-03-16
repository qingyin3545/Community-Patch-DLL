ALTER TABLE Projects ADD COLUMN 'Maintenance' INTEGER DEFAULT 0;
ALTER TABLE Projects ADD COLUMN 'CityMaxNum' INTEGER DEFAULT 0;
ALTER TABLE Projects ADD COLUMN 'FreePromotion' TEXT DEFAULT NULL REFERENCES UnitPromotions(Type);
ALTER TABLE Projects ADD COLUMN 'NoBroadcast' BOOLEAN DEFAULT 0;
ALTER TABLE Projects ADD COLUMN 'PolicyBranchPrereq' TEXT DEFAULT NULL REFERENCES PolicyBranchTypes(Type);

CREATE TABLE IF NOT EXISTS Project_PolicyNeeded (
    `ProjectType` TEXT DEFAULT '' references Projects(Type),
    `PolicyType` TEXT DEFAULT '' references Policies(Type)
);

CREATE TABLE IF NOT EXISTS Project_YieldChanges (
    ProjectType TEXT DEFAULT '' references Projects(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);

CREATE TABLE IF NOT EXISTS Project_YieldModifiers (
    ProjectType TEXT DEFAULT '' references Projects(Type),
    YieldType text references Yields(Type),
    Yield integer default 0
);
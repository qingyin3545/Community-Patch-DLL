alter table Improvements add EnableXP boolean default 0;

alter table Improvements add EnableUpgrade boolean default 0;

alter table Improvements add UpgradeXP integer default -1;
alter table Improvements add UpgradeImprovementType text references Improvements(Type);

alter table Improvements add EnableDowngrade boolean default 0;
alter table Improvements add DowngradeImprovementType text references Improvements(Type);

alter table Improvements add HideXPInfo boolean default 0;
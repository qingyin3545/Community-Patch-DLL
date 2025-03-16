CREATE TABLE IF NOT EXISTS Build_ResourceRemove (
    BuildType TEXT DEFAULT NULL  REFERENCES Builds(Type),
    ResourceType TEXT DEFAULT NULL REFERENCES Resources(Type)
);
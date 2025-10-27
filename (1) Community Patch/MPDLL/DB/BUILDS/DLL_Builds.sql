create table Build_ResourceRemove (
    BuildType text references Builds(Type),
    ResourceType text references Resources(Type)
);
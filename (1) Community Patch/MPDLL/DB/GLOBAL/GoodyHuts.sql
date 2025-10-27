alter table GoodyHuts add MinGameTurns integer default 0;

-- Keep the original data unchanged
update GoodyHuts set MinGameTurns = 20 
where Type = 'GOODY_WARRIOR' or Type = 'GOODY_PANTHEON_FAITH' or Type = 'GOODY_PROPHET_FAITH' 
   or Type = 'GOODY_SETTLER' or Type = 'GOODY_SCOUT' or Type = 'GOODY_WORKER';
update GoodyHuts set MinGameTurns = 20 where Type = 'GOODY_EXPERIENCE';
ALTER TABLE GoodyHuts ADD COLUMN 'MinGameTurns' INTEGER DEFAULT 0;

-- Keep the original data unchanged
UPDATE GoodyHuts SET MinGameTurns = 20 
WHERE Type = 'GOODY_WARRIOR' OR Type = 'GOODY_PANTHEON_FAITH' OR Type = 'GOODY_PROPHET_FAITH' 
   OR Type = 'GOODY_SETTLER' OR Type = 'GOODY_SCOUT' OR Type = 'GOODY_WORKER';
UPDATE GoodyHuts SET MinGameTurns = 20 WHERE Type = 'GOODY_EXPERIENCE';
alter table Technologies add column RazeSpeedModifier integer not null default 0;
alter table Technologies add column FreePromotionRemoved integer default -1;
alter table Technologies add column RemoveCurrentPromotion boolean default 0;
alter table Technologies add column RemoveOceanImpassableCivilian boolean default 0;

ALTER TABLE Technologies ADD COLUMN 'CitySplashDamage' BOOLEAN DEFAULT 0;
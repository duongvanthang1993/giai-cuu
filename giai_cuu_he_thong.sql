create database if not exists smartfactory_db;
use smartfactory_db;

create table SensorLogs(
log_id bigint auto_increment primary key,
sensor_id int not null,
recorded_at datetime not null,
temperature decimal(5,2),
humidity decimal(5,2),
status varchar(20)
);

create index idx_fat_covering on SensorLogs(sensor_id,recorded_at,temperature,humidity,status);

select temperature,humidity, status
from SensorLogs
where sensor_id =105 and recorded_at >='2026-06-20';

show table status like 'SensorLogs';

alter table SensorLogs drop index idx_fat_covering;
create index idx_lean_search on SensorLogs(sensor_id, recorded_at);
show table status like 'SensorLogs';
SELECT bid.client_number, count(case when event_value.outcome='win' then 1 else null end) as 'Побед',
count(case when event_value.outcome='lose' then 1 else null end) as 'Поражений' from bid, event_value 
where bid.play_id=event_value.play_id
and 
bid.coefficient=event_value.value
GROUP BY bid.client_number;

select teamvs as game, count(*) as games_count
  from
  (select if(home_team > away_team, concat(home_team, '-', away_team) , concat(away_team, '-', home_team) ) as teamvs from event_entity) as u
  group by game;
  

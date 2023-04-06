# Write your MySQL query statement below

-- cancellation rate = # of canceled (by unbanned users) / total number of requests (w unbanned users) on that day


-- Solution 1
select t.request_at as Day, ROUND(SUM(status != 'completed')/count(*),2) as "Cancellation Rate"
from trips t 
join users u on t.client_id = u.users_id AND u.banned = "No" and t.request_at between "2013-10-01" and "2013-10-03"
join users j on t.driver_id = j.users_id AND j.banned = "No"
group by t.request_at 
order by t.request_at 

-- Should be more efficient if we reduce the table size before joining
-- Solution 2
select t.request_at as Day, ROUND(SUM(status != 'completed')/count(*),2) as "Cancellation Rate"
from trips t 
join users u on t.client_id = u.users_id AND u.banned = "No" and t.request_at between "2013-10-01" and "2013-10-03"
join users j on t.driver_id = j.users_id AND j.banned = "No"
group by t.request_at 
order by t.request_at
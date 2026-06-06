SELECT topic,count(resolved)
FROM task1_forage.call_center
WHERE resolved='Y'
GROUP BY topic;           /* count resolved call by each topic */


SELECT 
    Topic, 
    SEC_TO_TIME(AVG(TIME_TO_SEC(AvgTalkDuration))) AS AvgTalkDuration 
FROM 
    task1_forage.call_center
GROUP BY 
    Topic;                /* avg talk duration by each topic */


SELECT topic,round(avg(`satisfaction rating`),2)
FROM task1_forage.call_center
GROUP BY topic;              

SELECT sec_to_time(round(avg(TIME_TO_SEC(`speed of answer in seconds`)),2)) as speedtime
FROM task1_forage.call_center    ;     /* avg speed of answer */


SELECT 
    MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) AS CallMonth, 
    COUNT(*) AS TotalAnsweredCalls
FROM task1_forage.call_center
WHERE `Answered (Y/N)` = 'Y'
GROUP BY MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) ;       /* total answered call by month */

    
SELECT Agent, 
    COUNT(CASE WHEN `Answered (Y/N)` = 'Y' THEN 1 END) AS TotalAnsweredCalls,
    COUNT(CASE WHEN Resolved = 'Y' THEN 1 END) AS TotalResolvedCalls,
    round(AVG(`Satisfaction rating`),2)as `satisfaction rating`
FROM task1_forage.call_center
GROUP BY Agent;                                 /* agent data answered,resolved,avg rating */






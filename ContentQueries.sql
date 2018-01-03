#Count of the top movies watched

SELECT COUNT(*),a_contentname
    from awsma.event
    where event_type in ('MovieViewStart','ContentViewStart')
    and a_platform in ('Android','ANDROID')
    and a_subscriberid is not null
    and arrival_timestamp AT TIME ZONE 'UTC' BETWEEN SYSDATE - INTERVAL '180 DAY' AND SYSDATE
    and a_browsinglanguage='tamil'
GROUP BY a_contentname
ORDER BY COUNT DESC

#Count of the top scenes watched

SELECT COUNT(*),a_contentname
    from awsma.event
    where event_type in ('SceneViewStart')
    and a_platform in ('Android','ANDROID')
    and a_subscriberid is not null
    and arrival_timestamp AT TIME ZONE 'UTC' BETWEEN SYSDATE - INTERVAL '180 DAY' AND SYSDATE
    and a_browsinglanguage='tamil'
GROUP BY a_contentname
ORDER BY COUNT DESC

#Count of the top songs watched

SELECT COUNT(*),a_contentname
    from awsma.event
    where event_type in ('SongViewStart')
    and a_platform in ('Android','ANDROID')
    and a_subscriberid is not null
    and arrival_timestamp AT TIME ZONE 'UTC' BETWEEN SYSDATE - INTERVAL '180 DAY' AND SYSDATE
    and a_browsinglanguage='tamil'
GROUP BY a_contentname
ORDER BY COUNT DESC


#Count of the top movies downloaded

SELECT COUNT(*),a_contentname
    from awsma.event
    where event_type in ('DownloadContentStart')
    and a_platform in ('Android','ANDROID')
    and a_subscriberid is not null
    and arrival_timestamp AT TIME ZONE 'UTC' BETWEEN SYSDATE - INTERVAL '180 DAY' AND SYSDATE
    and a_browsinglanguage='tamil'
GROUP BY a_contentname
ORDER BY COUNT DESC

#Clickthroughrate: Within the same session we have to check if a user saw a poseter and playedback the movie
# MovieClicked event will give content name of the movie and session id. For a given movie we have to 
# count the number of times a movie was seen and clicked to playback 

SELECT COUNT(*),a_contentname
    from awsma.event
    where event_type in ('MovieClicked')
    and a_platform in ('Android','ANDROID')
    and a_subscriberid is not null
    and arrival_timestamp AT TIME ZONE 'UTC' BETWEEN SYSDATE - INTERVAL '180 DAY' AND SYSDATE
    and a_browsinglanguage='tamil'
GROUP BY a_contentname
ORDER BY COUNT DESC

_______________

SELECT COUNT(*),a_contentname
    from awsma.event
    where event_type in ('MovieViewStart'|'ContentViewStart')
    and a_platform in ('Android','ANDROID')
    and a_subscriberid is not null
    and arrival_timestamp AT TIME ZONE 'UTC' BETWEEN SYSDATE - INTERVAL '180 DAY' AND SYSDATE
    and a_browsinglanguage='tamil'
GROUP BY a_contentname
ORDER BY COUNT DESC
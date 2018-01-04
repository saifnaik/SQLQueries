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

# Logic for click through rate: 
#Step 1: Get the movie clicked data along with session id
#Step 2: Get the movie watched data along with session id 
#Step 3: For each movie in the movie watched data using the session id fetch from the movie from movie clicked with same session id. 
#Step 4: Compare and see if movie clicked == movie watched in the same session. 
#Step 5: For only TRUE in step 4 copy to new data frame and make a pivot table to count occurences - these are movies clicked that are watched
in the same SESSION
#Step 6: Get count of all movie clicked from Step 1
#Step 7: Divide the count for each movie (movie-watched/movie-clicked) - this will give you the true click through rate. 


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


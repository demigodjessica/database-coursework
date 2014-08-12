-- Jessica Ju 
-- ID#
-- 11/17/2013 
-- Project 1 for EECS 116 

-- Problem 1
-- Find each topic find the total number of blurts that were analyzed as being related 
-- to the topic. Print topic id, topic description, and the count 

select topic.id, topic.description, count(*) from blurt_analysis join topic
on blurt_analysis.topicid = topic.id 
group by topic.id;

-- Problem 2 
-- For each celebrity find the total number of people who follow them 

select user.name, celeb.count as Followers from user join (
select celebrity.*, count(*) 
as count from celebrity join follow 
on celebrity.email = follow.followee
group by celebrity.email) as celeb 
on celeb.email = user.email;

-- Problem 3
-- For each celebrity find the number of blurts 
-- Desc order of blurts

select user.name, celeb_blurts.Blurts from user join
(select celebrity.email, count(*) as Blurts from celebrity join blurt
on celebrity.email = blurt.email
group by blurt.email) as celeb_blurts
on user.email = celeb_blurts.email
order by celeb_blurts.Blurts desc;

-- Problem 4
-- Print the names of celebrities who are following anybody 

select user.name from user join
(select celebrity.email from celebrity left join 
(select distinct celebrity.email from celebrity join follow 
on celebrity.email = follow.follower) as celebrity_follow
on celebrity.email = celebrity_follow.email
where celebrity_follow.email IS NULL) as celeb_no_follow
on user.email = celeb_no_follow.email; 

-- Problem 5
-- Email of brand ambassador and the number of users who are following the brand ambassador for each vendor. 
-- Vendor name, email, follower count 

select vendor_emails.name as Name, count(*) as follower_count, follow.followee as Email from follow join 
(select * from vendor join vendor_ambassador on vendor.id = vendor_ambassador.vendorid) as vendor_emails
on follow.followee = vendor_emails.email
group by follow.followee 
order by vendor_emails.name;

-- Problem 6 

(select vendor.name, count(*) as advertisementgap 
from (blurt_analysis join vendor_topics join vendor
on vendor_topics.topicid = blurt_analysis.topicid
and vendor.id = vendor_topics.vendorid) 
where (email, vendorid) not in (
select email, vendorid from user_ad join advertisement
on user_ad.adid = advertisement.id)
group by vendorid)
order by advertisementgap desc;

-- Problem 7 
-- Find all the pairs (A, B) such that both A and B have blurted 
-- on a common topic but A is not following B. 
-- Print names of (A, B) in that order 

select U1.name, U2.name
from blurt_analysis A join blurt_analysis B join user U1 join user U2
where A.topicid = B.topicid
and A.email <> B.email
and A.email = U1.email
and B.email = U2.email
and (A.email,B.email) not in 
(
select *
from follow
)
group by A.email;


-- Problem 8 
-- Users A, B, C 
-- A follows B, B follows C, but A dos not follow C 
-- Find these triplets [email, email, email] 

select distinct 
f2.follower as A, 
f1.follower as B,
f1.followee as C
from follow f1 join follow f2 
where f1.follower = f2.followee 
and (f2.follower, f1.followee) not in ( 
select follower, followee from follow);

-- Problem 9 
-- For each topic, find the states where the average sentiment associated w/ the 
-- blurts related is negative. 

select id as topicid, description as name, location as state, blurt_count, avg_sentiment 
from topic natural join 
(select topicid as id, location, avg(sentiment) as avg_sentiment, count(*) as blurt_count
from blurt natural join blurt_analysis 
group by location, topicid 
having avg(sentiment) < 0) as t 
order by topicid, state;


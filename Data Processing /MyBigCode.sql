select * from `workspace`.`default`.`bright_tv_user_profiles` limit 1000;
---Retrieve the total number users by Age ---
SELECT 
    age,
    COUNT(*) AS total_users
FROM workspace.default.bright_tv_user_profiles
GROUP BY age
ORDER BY age;
--- Retrive the total number of users by Gender ---
SELECT 
    gender,
    COUNT(*) AS total_users
FROM workspace.default.bright_tv_user_profiles
GROUP BY gender
ORDER BY total_users DESC;

---Retrieve the total number of users by Age but categorise by gender---
SELECT 
    CASE
        WHEN age BETWEEN 18 AND 34 THEN 'youth'
        WHEN age BETWEEN 35 AND 49 THEN 'adult'
        WHEN age BETWEEN 50 AND 64 THEN 'middle age'
        WHEN age >= 65 THEN 'senior citizen'
        ELSE 'unknown'
    END AS age_category,

    CASE
        WHEN gender IS NULL OR trim(gender) = '' THEN 'null'
        WHEN lower(trim(gender)) IN ('m', 'male') THEN 'male'
        WHEN lower(trim(gender)) IN ('f', 'female') THEN 'female'
        ELSE 'not specified'
    END AS gender_clean,

    COUNT(*) AS total_users

FROM workspace.default.bright_tv_user_profiles
WHERE age IS NOT NULL

GROUP BY 
    CASE
        WHEN age BETWEEN 18 AND 34 THEN 'youth'
        WHEN age BETWEEN 35 AND 49 THEN 'adult'
        WHEN age BETWEEN 50 AND 64 THEN 'middle age'
        WHEN age >= 65 THEN 'senior citizen'
        ELSE 'unknown'
    END,
    CASE
        WHEN gender IS NULL OR trim(gender) = '' THEN 'null'
        WHEN lower(trim(gender)) IN ('m', 'male') THEN 'male'
        WHEN lower(trim(gender)) IN ('f', 'female') THEN 'female'
        ELSE 'not specified'
    END

ORDER BY total_users DESC;
---Users by Age Category ---
SELECT 
    CASE
        WHEN age BETWEEN 18 AND 34 THEN 'youth'
        WHEN age BETWEEN 35 AND 49 THEN 'adult'
        WHEN age BETWEEN 50 AND 64 THEN 'middle age'
        WHEN age >= 65 THEN 'senior citizen'
        ELSE 'unknown'
    END AS age_category,
    COUNT(*) AS total_users
FROM workspace.default.bright_tv_user_profiles
WHERE age IS NOT NULL
GROUP BY 
    CASE
        WHEN age BETWEEN 18 AND 34 THEN 'youth'
        WHEN age BETWEEN 35 AND 49 THEN 'adult'
        WHEN age BETWEEN 50 AND 64 THEN 'middle age'
        WHEN age >= 65 THEN 'senior citizen'
        ELSE 'unknown'
    END
ORDER BY total_users DESC;
--- Retrieve the total number of users by Age and  Gender ---
SELECT 
    CASE
        WHEN age BETWEEN 18 AND 34 THEN 'youth'
        WHEN age BETWEEN 35 AND 49 THEN 'adult'
        WHEN age BETWEEN 50 AND 64 THEN 'middle age'
        WHEN age >= 65 THEN 'senior citizen'
        ELSE 'unknown'
    END AS age_category,
    gender,
    COUNT(*) AS total_users
FROM workspace.default.bright_tv_user_profiles
WHERE age IS NOT NULL
GROUP BY 
    CASE
        WHEN age BETWEEN 18 AND 34 THEN 'youth'
        WHEN age BETWEEN 35 AND 49 THEN 'adult'
        WHEN age BETWEEN 50 AND 64 THEN 'middle age'
        WHEN age >= 65 THEN 'senior citizen'
        ELSE 'unknown'
    END,
    gender
ORDER BY total_users DESC;
--- Retrieve Total Number of Users per Province ---
SELECT 
    province,
    COUNT(*) AS total_users
FROM workspace.default.bright_tv_user_profiles
GROUP BY province
ORDER BY province;
---Retrieve the Name of Null Province AS Unknown ---
SELECT 
    CASE
        WHEN province IS NULL OR trim(province) = '' THEN 'unknown'
        ELSE province
    END AS province_clean,
    COUNT(*) AS total_users
FROM workspace.default.bright_tv_user_profiles
GROUP BY 
    CASE
        WHEN province IS NULL OR trim(province) = '' THEN 'unknown'
        ELSE province
    END
ORDER BY total_users DESC;
---Writing Provinve in a Standard Format ---
SELECT 
    CASE
        WHEN province IS NULL OR trim(province) = '' THEN 'Unknown'

        WHEN lower(trim(province)) IN ('gauteng', 'gp') THEN 'Gauteng'
        WHEN lower(trim(province)) IN ('kwazulu natal', 'kzn') THEN 'KwaZulu-Natal'
        WHEN lower(trim(province)) IN ('western cape', 'wc') THEN 'Western Cape'
        WHEN lower(trim(province)) IN ('eastern cape', 'ec') THEN 'Eastern Cape'
        WHEN lower(trim(province)) IN ('limpopo', 'lp') THEN 'Limpopo'
        WHEN lower(trim(province)) IN ('mpumalanga', 'mp') THEN 'Mpumalanga'
        WHEN lower(trim(province)) IN ('north west', 'nw') THEN 'North West'
        WHEN lower(trim(province)) IN ('free state', 'fs') THEN 'Free State'
        WHEN lower(trim(province)) IN ('northern cape', 'nc') THEN 'Northern Cape'

        ELSE initcap(trim(province))
    END AS province_clean,

    COUNT(*) AS total_users

FROM workspace.default.bright_tv_user_profiles

GROUP BY 
    CASE
        WHEN province IS NULL OR trim(province) = '' THEN 'Unknown'

        WHEN lower(trim(province)) IN ('gauteng', 'gp') THEN 'Gauteng'
        WHEN lower(trim(province)) IN ('kwazulu natal', 'kzn') THEN 'KwaZulu-Natal'
        WHEN lower(trim(province)) IN ('western cape', 'wc') THEN 'Western Cape'
        WHEN lower(trim(province)) IN ('eastern cape', 'ec') THEN 'Eastern Cape'
        WHEN lower(trim(province)) IN ('limpopo', 'lp') THEN 'Limpopo'
        WHEN lower(trim(province)) IN ('mpumalanga', 'mp') THEN 'Mpumalanga'
        WHEN lower(trim(province)) IN ('north west', 'nw') THEN 'North West'
        WHEN lower(trim(province)) IN ('free state', 'fs') THEN 'Free State'
        WHEN lower(trim(province)) IN ('northern cape', 'nc') THEN 'Northern Cape'

        ELSE initcap(trim(province))
    END

ORDER BY total_users DESC;
---Most Users By Province ---
SELECT 
    province,
    COUNT(*) AS total_users
FROM workspace.default.bright_tv_user_profiles
WHERE province IS NOT NULL
GROUP BY province
ORDER BY total_users DESC
LIMIT 1;
--- Least users by Province ---
SELECT 
    province,
    COUNT(*) AS total_users
FROM workspace.default.bright_tv_user_profiles
WHERE province IS NOT NULL
GROUP BY province
ORDER BY total_users ASC
LIMIT 1;
select * from `workspace`.`default`.`bright_tv_viewerships`;
--Changing UTC TO CAT (SA TIME)---
SELECT 
    RecordDate2,
    DATEADD(HOUR, 2, RecordDate2) AS sa_time
FROM workspace.default.bright_tv_viewerships;
--Extracting Number of users by time (hourly)--
SELECT 
    RecordDate2,
    DATEADD(HOUR, 2, RecordDate2) AS sa_time,
    HOUR(DATEADD(HOUR, 2, RecordDate2)) AS hour
FROM workspace.default.bright_tv_viewerships;
--Finding out on the Most Watched Channel--
SELECT 
    Channel2,
    COUNT(*) AS total_views
FROM workspace.default.bright_tv_viewerships
GROUP BY Channel2
ORDER BY total_views DESC;
--Hourly Viewership---
SELECT 
    HOUR(DATEADD(HOUR, 2, RecordDate2)) AS hour,
    COUNT(*) AS total_views
FROM workspace.default.bright_tv_viewerships
GROUP BY HOUR(DATEADD(HOUR, 2, RecordDate2))
ORDER BY hour;
-- Peak hour-----
SELECT 
    Channel2,
    HOUR(DATEADD(HOUR, 2, RecordDate2)) AS hour,
    COUNT(*) AS total_views
FROM workspace.default.bright_tv_viewerships
GROUP BY 
    Channel2,
    HOUR(DATEADD(HOUR, 2, RecordDate2))
ORDER BY total_views DESC;
---Time Name Format---
SELECT 
    Channel2 AS channel,
    DATEADD(HOUR, 2, RecordDate2) AS sa_time,
    HOUR(DATEADD(HOUR, 2, RecordDate2)) AS hour,
    
    CASE 
        WHEN HOUR(DATEADD(HOUR, 2, RecordDate2)) BETWEEN 0 AND 5 THEN 'Midnight'
        WHEN HOUR(DATEADD(HOUR, 2, RecordDate2)) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(DATEADD(HOUR, 2, RecordDate2)) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN HOUR(DATEADD(HOUR, 2, RecordDate2)) BETWEEN 18 AND 23 THEN 'Evening'
    END AS time_bucket
FROM workspace.default.bright_tv_viewerships;
--- Renaming the Month, Day, Year, Hour and time Format --- 
SELECT 
    Channel2 AS channel,
    DATEADD(HOUR, 2, RecordDate2) AS sa_time,

    YEAR(DATEADD(HOUR, 2, RecordDate2)) AS year,
    MONTH(DATEADD(HOUR, 2, RecordDate2)) AS month,
    DAY(DATEADD(HOUR, 2, RecordDate2)) AS day,

    DATE_FORMAT(DATEADD(HOUR, 2, RecordDate2), 'HH:mm:ss') AS time_hms

FROM workspace.default.bright_tv_viewerships;
--- Total Views in a Month, Month Name and Month Number ---
SELECT 
    MONTH(DATEADD(HOUR, 2, RecordDate2)) AS month_number,
    DATE_FORMAT(DATEADD(HOUR, 2, RecordDate2), 'MMMM') AS month_name,
    COUNT(*) AS total_views
FROM workspace.default.bright_tv_viewerships
GROUP BY 
    MONTH(DATEADD(HOUR, 2, RecordDate2)),
    DATE_FORMAT(DATEADD(HOUR, 2, RecordDate2), 'MMMM')
ORDER BY month_number;
--- Active Users by Time of Day ---
SELECT 
    CASE
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 0 AND 5 THEN 'Midnight'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 17 AND 19 THEN 'Day'
        ELSE 'Evening'
    END AS time_of_day,
    
    COUNT(*) AS total_views

FROM workspace.default.bright_tv_viewerships

GROUP BY 
    CASE
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 0 AND 5 THEN 'Midnight'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 17 AND 19 THEN 'Day'
        ELSE 'Evening'
    END

ORDER BY total_views DESC;

---Channel and Time of the Day ---
SELECT 
    channel2,

    CASE
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 0 AND 5 THEN 'Midnight'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 17 AND 19 THEN 'Day'
        ELSE 'Evening'
    END AS time_of_day,

    COUNT(*) AS total_views

FROM workspace.default.bright_tv_viewerships

GROUP BY 
    channel2,
    CASE
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 0 AND 5 THEN 'Midnight'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN hour(dateadd(hour, 2, recorddate2)) BETWEEN 17 AND 19 THEN 'Day'
        ELSE 'Evening'
    END

ORDER BY total_views DESC;
--- Joining User_Profile Table  and Viewership Table ---
SELECT 
    up.userid,

    -- clean gender
    CASE
        WHEN up.gender IS NULL OR trim(up.gender) = '' THEN 'Unknown'
        WHEN lower(trim(up.gender)) IN ('m', 'male') THEN 'Male'
        WHEN lower(trim(up.gender)) IN ('f', 'female') THEN 'Female'
        ELSE 'Not Specified'
    END AS gender,

    -- age category
    CASE
        WHEN up.age BETWEEN 18 AND 34 THEN 'Youth'
        WHEN up.age BETWEEN 35 AND 49 THEN 'Adult'
        WHEN up.age BETWEEN 50 AND 64 THEN 'Middle Age'
        WHEN up.age >= 65 THEN 'Senior Citizen'
        ELSE 'Unknown'
    END AS age_category,

    -- province cleaned
    CASE
        WHEN up.province IS NULL OR trim(up.province) = '' THEN 'Unknown'
        ELSE initcap(trim(up.province))
    END AS province,

    -- viewership
    v.channel2 AS channel,
    dateadd(hour, 2, v.recorddate2) AS sa_time,
    hour(dateadd(hour, 2, v.recorddate2)) AS hour,
    v.`Duration 2` AS duration

FROM workspace.default.bright_tv_user_profiles up

JOIN workspace.default.bright_tv_viewerships v
    ON up.userid = v.userid0;
    --- Channel and Gender Difference ---
SELECT 
    CASE
        WHEN up.gender IS NULL OR trim(up.gender) = '' THEN 'Unknown'
        WHEN lower(trim(up.gender)) IN ('m','male') THEN 'Male'
        WHEN lower(trim(up.gender)) IN ('f','female') THEN 'Female'
        ELSE 'Not Specified'
    END AS gender,
    v.channel2,
    COUNT(*) AS total_views
FROM workspace.default.bright_tv_viewerships v
JOIN workspace.default.bright_tv_user_profiles up
    ON v.userid0 = up.userid
GROUP BY 
    CASE
        WHEN up.gender IS NULL OR trim(up.gender) = '' THEN 'Unknown'
        WHEN lower(trim(up.gender)) IN ('m','male') THEN 'Male'
        WHEN lower(trim(up.gender)) IN ('f','female') THEN 'Female'
        ELSE 'Not Specified'
    END,
    v.channel2
ORDER BY total_views DESC;
---Top watched Provinces ---
SELECT 
    CASE
        WHEN up.province IS NULL OR trim(up.province) = '' THEN 'Unknown'
        ELSE initcap(trim(up.province))
    END AS province,

    COUNT(*) AS total_views

FROM workspace.default.bright_tv_viewerships v

JOIN workspace.default.bright_tv_user_profiles up
    ON v.userid0 = up.userid

GROUP BY 
    CASE
        WHEN up.province IS NULL OR trim(up.province) = '' THEN 'Unknown'
        ELSE initcap(trim(up.province))
    END

ORDER BY total_views DESC;

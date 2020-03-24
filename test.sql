SELECT challenge_."id",
       challenge_."token",
       challenge_."authentication_id",
       challenge_authentication_device_."name"      AS authentication_device_name,
       challenge_authentication_device_."user_id"   AS authentication_device_user_id,
       challenge_authentication_device_user_."name" AS authentication_device_user_name,
       challenge_authentication_."description"      AS authentication_description,
       challenge_authentication_."device_id"        AS authentication_device_id
FROM "challenge" challenge_
         INNER JOIN "authentication" challenge_authentication_
                    ON challenge_."authentication_id" = challenge_authentication_."id"
         INNER JOIN "device" challenge_authentication_device_
                    ON challenge_authentication_."device_id" = challenge_authentication_device_."id"
         INNER JOIN "device" challenge_authentication_device_
                    ON challenge_authentication_."device_id" = challenge_authentication_device_."id"
         INNER JOIN "user" challenge_authentication_device_user_
                    ON challenge_authentication_device_."user_id" = challenge_authentication_device_user_."id"
WHERE (challenge_."id" = ?)
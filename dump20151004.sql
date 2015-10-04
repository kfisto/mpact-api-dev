PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20140706192223');
INSERT INTO "schema_migrations" VALUES('20140706192958');
INSERT INTO "schema_migrations" VALUES('20140706194243');
INSERT INTO "schema_migrations" VALUES('20140803225935');
INSERT INTO "schema_migrations" VALUES('20140806120953');
INSERT INTO "schema_migrations" VALUES('20140913134554');
INSERT INTO "schema_migrations" VALUES('20141019000045');
INSERT INTO "schema_migrations" VALUES('20141019002705');
INSERT INTO "schema_migrations" VALUES('20141019002900');
INSERT INTO "schema_migrations" VALUES('20151001175409');
INSERT INTO "schema_migrations" VALUES('20151001191503');
INSERT INTO "schema_migrations" VALUES('20151002025311');
INSERT INTO "schema_migrations" VALUES('20151002134200');
INSERT INTO "schema_migrations" VALUES('20151004200658');
CREATE TABLE guides (id INTEGER PRIMARY KEY, key varchar(255), image varchar(255), title varchar(255), textLabel varchar(255));
INSERT INTO "guides" VALUES(1,'gmc','','GMC ''15 Guide','GMC ''15 Guide');
INSERT INTO "guides" VALUES(2,'lmc','','LMC ''14 Guide','LMC ''14 Guide');
INSERT INTO "guides" VALUES(3,'refuge','refuge','','Prayer Guide');
INSERT INTO "guides" VALUES(4,'test','','test','test');
CREATE TABLE "notes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "text" text, "created_at" datetime, "updated_at" datetime, "entry_id" integer, "author" varchar(255));
INSERT INTO "notes" VALUES(1,'This is a test note.','2014-10-19 18:36:14.746327','2014-10-19 18:36:14.746327',2,'103010050175');
INSERT INTO "notes" VALUES(2,'Here''s a test note!','2014-10-21 13:56:24.458830','2014-10-21 13:56:24.458830',46,'744703D6-4AEA-4235-9271-A347F8373797');
INSERT INTO "notes" VALUES(3,'This is a test note!','2014-10-22 00:06:07.908232','2014-10-22 00:06:07.908232',46,'FC1F6D51-DCD1-4408-B5A6-F11ED8C52F50');
CREATE TABLE "requests" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "entry_id" varchar(255), "request" varchar(255));
INSERT INTO "requests" VALUES(40,'44','a');
INSERT INTO "requests" VALUES(41,'44','b');
INSERT INTO "requests" VALUES(42,'44','c');
CREATE TABLE "ops" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar(255), "category" integer, "what" varchar(255), "when" varchar(255), "where" varchar(255));
INSERT INTO "ops" VALUES(1,'Sports camps and Muslim Community Outreach',0,'','July 2016','Toronto, Canada');
INSERT INTO "ops" VALUES(2,'Conduct Well-Check and VBS with children from Scenery Park and Amanda Forest',0,'','April 2016','East London, South Africa');
INSERT INTO "ops" VALUES(3,'Merge Ministry working with Orphan Ministry',0,'','July 23-30, 2016','Haiti');
INSERT INTO "ops" VALUES(4,'Teach or assist ESL Bible stories in different Chinese communities',0,'','July 2016','China');
INSERT INTO "ops" VALUES(5,'',1,'Yesterday''s Teens','April 25-30, 2016','');
INSERT INTO "ops" VALUES(6,'',1,'Mirror Image','June 3-11, 2016','');
INSERT INTO "ops" VALUES(7,'',1,'Key Change','June 20-22','');
INSERT INTO "ops" VALUES(8,'',1,'Kentucky Missions','June 25-July 2','');
INSERT INTO "ops" VALUES(9,'',1,'Merge Mission Trip','June 2016','');
INSERT INTO "ops" VALUES(10,'Serving agency of our church and is open Monday, Wednesday, and Friday from 9:00-12:00. The Helping Center serves by providing food, clothing, and financial assistance to those in need. Ways to get involved include donating lightly used clothing and housewares items, volunteering and assisting with clients, volunteering on Wednesday or Sunday evenings by sorting clothing and preparing food bags, and praying for Sallie Ruth and the Helping Center ministry.',2,'Helping Center','MWF 9 a.m. - 12 p.m.',NULL);
INSERT INTO "ops" VALUES(11,'Homeless Ministry on Sunday mornings. Men and women can come to the church and get a shower, hot breakfast, and participate in worship. Needs include travel size toiletries, towels, washcloths, men’s and women’s clothing. Volunteers are needed to help with serving breakfast, greeting, cleaning and serving in the shower area, and loving on our friends.  Volunteers are needed Sunday mornings beginning at 7:15.',2,'Refuge','Sundays, 7:15 a.m.',NULL);
INSERT INTO "ops" VALUES(12,'Spartanburg InterFaith Hospitality Network is a homeless Ministry to families in the upstate that partners with our church once a quarter . We house SPIHN residents at our church for one week.  Ways to get involved include providing a meal one evening, helping wash laundry after the week is over, spending the night at our facility while they are on our campus or providing breakfast items as needed.',2,'SPIHN','Quarterly',NULL);
INSERT INTO "ops" VALUES(13,'The Good News Club meets at the school on Thursday afternoons from 3:00-5:00 to teach Bible stories to first through third graders who are in the program. Ways to get involved include volunteering on Thursday afternoons, providing candy that can be used as goodies for the children, praying for the team and children that come each week.',2,'Good News Club at EP Todd Elementary','Thursdays, 3:00 - 5:00 p.m.',NULL);
INSERT INTO "ops" VALUES(14,'The SonShine Club ministers to special needs children and adults and their caregivers. They meet here at FBS on Saturday mornings. Ways to get involved include volunteering on Saturday mornings, donating gift items that can be used to go in the caregiver bags which are given once a month.',2,'SonShine Club','Saturday mornings',NULL);
INSERT INTO "ops" VALUES(15,'The Hope Center for Children ministers to special needs children and adults and their caregivers. They meet here at FBS on Saturday mornings. Ways to get involved include volunteering on Saturday mornings, donating gift items that can be used to go in the caregiver bags which are given once a month.',2,'Hope Center for Children','Various',NULL);
INSERT INTO "ops" VALUES(16,'Celebrate Recovery helps people that are struggling with various addictions and hang-ups. They meet every Friday evening at the Hangar for a time of worship, Bible study, and small group accountability. Ways to volunteer include helping provide a meal, praying for those that come, serving on Friday evening.',2,'Celebrate Recovery','Friday nights',NULL);
INSERT INTO "ops" VALUES(17,'The Soup Kitchen feeds the hungry in our community. Ways to get involved include volunteering to help serve the meal and donating food that can be given out or served. We currently have a group that serves on the first Sunday of every Month. If your class would like to volunteer on a Sunday, please contact the MPact office. This ministry also has openings throughout the week and on Saturdays for life groups to come and serve.',2,'Soup Kitchen','Various',NULL);
INSERT INTO "ops" VALUES(18,'St. Luke’s Free Medical Clinic provides healthcare to those that don’t have medical coverage. Ways to get involved include providing a meal for the doctors and nurses that donate their time at the night clinics, volunteering to serve especially if you are a nurse or doctor.',2,'St. Luke''s Free Medical Clinic','Various',NULL);
INSERT INTO "ops" VALUES(19,'Carolina Pregnancy Center — a ministry that offers support, compassion, and information to those facing an unexpected pregnancy.  Volunteers are needed to meet and encourage clients, help with various duties around the office. Donation needs vary from time to time.',2,'Carolina Pregnancy Center','Various',NULL);
INSERT INTO "ops" VALUES(20,'Afterschool program at Housing Authority apartments from 3:30-5:00. Volunteers are needed as we teach Bible stories, provide snacks, play games, and help with homework.',2,'Apartment Outreach','2nd & 4th Tues/Wed/Thurs',NULL);
INSERT INTO "ops" VALUES(21,'Volunteers currently help with childcare while moms do Zumba with Marilyn Lankford. We also have various needs that come up with construction/food/ and clothing needs.  Classes can also do a block party outreach in a Hispanic neighborhood on a Saturday afternoon.',2,'Hispanic Ministry','2nd & 4th Tuesday nights',NULL);
INSERT INTO "ops" VALUES(22,'Volunteers are needed in helping with facility needs, cleaning and sorting donations, serving lunch or dinner to the residents, etc.  Life Groups can also come and help with chapel times in the evening.',2,'Miracle Hill','Various',NULL);
INSERT INTO "ops" VALUES(23,'English Crossing works with internationals through teaching English and developing relationships.  We have begun serving at their new site at New Life Christian Fellowship on Whitney Rd.  Volunteers are needed to teach ESOL, serve snacks and greet, lead children in Bible clubs while their parents are in class.',2,'English Crossing','Various',NULL);
INSERT INTO "ops" VALUES(24,'Switch works toward shining the light on human and sex trafficking.  Volunteers are needed for outreach times to ladies in the dance clubs, gathering gifts to give, basic tasks around their office, etc.  ALL volunteers must go through the SWITCH training before volunteering.',2,'Switch','Various',NULL);
INSERT INTO "ops" VALUES(25,'This is a great way to serve refugees who are coming to Spartanburg. We are forming Good Neighbor Teams who will welcome a refugee (and their family) to town by helping them find the Walmart and other places and to get settled here in Spartanburg. This is a great opportunity to share Christ with those who may not have a relationship with Jesus! Supply kits are also needed.',2,'World Relief','Various',NULL);
CREATE TABLE "entries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "guideKey" varchar(255), "name" varchar(255), "image" varchar(255), "entrytype" integer, "location" varchar(255), "bio" varchar(255));
INSERT INTO "entries" VALUES(1,'gmc','Jeff & Josie','jeffjosie',0,NULL,NULL);
INSERT INTO "entries" VALUES(2,'gmc','Scott & Jo Ellen','clubb',0,NULL,NULL);
INSERT INTO "entries" VALUES(3,'gmc','Hans & Brandy','hans',0,NULL,NULL);
INSERT INTO "entries" VALUES(5,'gmc','Paul & Stephanie','paul',0,NULL,NULL);
INSERT INTO "entries" VALUES(7,'gmc','Patrick & Kelley','patrickkelly',0,NULL,NULL);
INSERT INTO "entries" VALUES(8,'gmc','Page & Ashley','page',0,NULL,NULL);
INSERT INTO "entries" VALUES(11,'gmc','Hoppy','hoppy',0,NULL,NULL);
INSERT INTO "entries" VALUES(12,'gmc','Rob & Becca  ','shaw',0,NULL,NULL);
INSERT INTO "entries" VALUES(13,'gmc','Ron & Kelly  ','none',0,NULL,NULL);
INSERT INTO "entries" VALUES(14,'gmc','Carl & Sheree','none',0,NULL,NULL);
INSERT INTO "entries" VALUES(16,'gmc','Donny & Dana ','donny',0,NULL,NULL);
INSERT INTO "entries" VALUES(18,'gmc','Duane & Jeanie','duane',0,NULL,NULL);
INSERT INTO "entries" VALUES(19,'gmc','Greg & Abby  ','gregabby',0,NULL,NULL);
INSERT INTO "entries" VALUES(20,'gmc','Todd & Jenn  ','toddjen',0,NULL,NULL);
INSERT INTO "entries" VALUES(21,'gmc','Jonathan & Liz ','bundrick',0,NULL,'');
INSERT INTO "entries" VALUES(22,'gmc','Katie','',0,NULL,NULL);
INSERT INTO "entries" VALUES(28,'refuge','Sunday','',0,NULL,NULL);
INSERT INTO "entries" VALUES(29,'refuge','Monday','',0,NULL,NULL);
INSERT INTO "entries" VALUES(30,'refuge','Tuesday','',0,NULL,NULL);
INSERT INTO "entries" VALUES(31,'refuge','Wednesday','',0,NULL,NULL);
INSERT INTO "entries" VALUES(32,'refuge','Thursday','',0,NULL,NULL);
INSERT INTO "entries" VALUES(33,'refuge','Friday','',0,NULL,NULL);
INSERT INTO "entries" VALUES(34,'refuge','Saturday','',0,NULL,NULL);
INSERT INTO "entries" VALUES(36,'gmc','Ryan & Lyndsay','',0,NULL,NULL);
INSERT INTO "entries" VALUES(38,'gmc','Ben & Jessica','benjessica',0,NULL,NULL);
INSERT INTO "entries" VALUES(40,'gmc','Makayla','makayla',0,NULL,NULL);
INSERT INTO "entries" VALUES(41,'gmc','Lee & Beth','collins',0,NULL,NULL);
INSERT INTO "entries" VALUES(42,'gmc','Bill & Christine','billchristine',0,NULL,NULL);
INSERT INTO "entries" VALUES(43,'gmc','Jeff & Lisa',NULL,0,NULL,NULL);
INSERT INTO "entries" VALUES(44,'gmc','Intl. Mission Board','imb',1,NULL,'The IMB''s mission is to make disciples of all peoples in fulfillment of the Great Commission found in Matthew 28:18-20.
Over 6,000 people groups - 1.7 billion people - still live with little or no access to the Gospel.
IMB is an entity of the Southern Baptist Convention, the nation''s largest evangelical denomination, claiming more than 40,000 churches with nearly 16 million members.

Mission & Vision
Our mission is evangelizing, discipling and planting reproducing churches among all peoples in fulfillment of the Great Commission. Our vision is a multitude from every language, people, tribe and nation knowing and worshipping our Lord Jesus Christ.

Core Values
• We commit to obedience to the Lordship of Jesus Christ and to God’s inerrant Word.
• We believe Jesus Christ is God’s only provision for salvation and all people without personal faith in Him are lost and will spend eternity in hell.
• We seek to provide all people an opportunity to hear, understand and respond to the gospel in their own cultural context.
• We evangelize through proclamation, discipling, equipping and ministry that results in indigenous reproducing Baptist churches.
• We serve churches to facilitate their involvement in the Great Commission and the sending of missionaries to bring all peoples to faith in Jesus Christ.
• We partner with Baptists and other Christians around the world in accordance with IMB guidelines.
• We understand and fulfill God’s mission through God’s Word, prayer and the leadership of the Holy Spirit.');
INSERT INTO "entries" VALUES(45,'gmc','Alan',NULL,0,NULL,NULL);
INSERT INTO "entries" VALUES(46,'gmc','Andrew & Joanna','',0,NULL,NULL);
INSERT INTO "entries" VALUES(47,'gmc','Chris & Becka','',0,NULL,NULL);
INSERT INTO "entries" VALUES(48,'gmc','Butch & Shana','',0,NULL,NULL);
INSERT INTO "entries" VALUES(49,'gmc','Calvin & Devra','',0,NULL,NULL);
INSERT INTO "entries" VALUES(50,'gmc','Elizabeth','liz',0,NULL,NULL);
INSERT INTO "entries" VALUES(51,'gmc','Gary & Lily','stone',0,NULL,NULL);
INSERT INTO "entries" VALUES(52,'gmc','Greg','',0,NULL,NULL);
INSERT INTO "entries" VALUES(53,'gmc','Jason','',0,NULL,NULL);
INSERT INTO "entries" VALUES(54,'gmc','Karen','',0,NULL,NULL);
INSERT INTO "entries" VALUES(55,'gmc','Marie','marie',0,NULL,NULL);
INSERT INTO "entries" VALUES(56,'gmc','Matt & Caroline','mattcaroline',0,NULL,'');
INSERT INTO "entries" VALUES(57,'gmc','Preston','',0,NULL,NULL);
INSERT INTO "entries" VALUES(58,'gmc','Ron & Kelly','',0,NULL,NULL);
INSERT INTO "entries" VALUES(59,'gmc','Ryan & Lyndsay','',0,NULL,NULL);
INSERT INTO "entries" VALUES(60,'gmc','Sarah','sarah',0,NULL,NULL);
INSERT INTO "entries" VALUES(61,'gmc','Woody & Christine','wooldridge',0,NULL,NULL);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('notes',5);
INSERT INTO "sqlite_sequence" VALUES('requests',42);
INSERT INTO "sqlite_sequence" VALUES('ops',25);
INSERT INTO "sqlite_sequence" VALUES('entries',61);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
COMMIT;

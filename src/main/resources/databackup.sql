/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.1.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: valkyria
-- ------------------------------------------------------
-- Server version	12.1.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `artist_images`
--

DROP TABLE IF EXISTS `artist_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `artist_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_images`
--

LOCK TABLES `artist_images` WRITE;
/*!40000 ALTER TABLE `artist_images` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `artist_images` VALUES
(1,'08879063-dc9f-42aa-bb1f-c48ccdc4a6a5',1),
(2,'ae82aee5-7bc7-4a13-b250-6c2f37a62e12',2),
(3,'75693dab-e7c2-4892-8ddc-5925d1ba741c',3),
(4,'4213b8e6-7227-46ba-8b91-1db91c29bb0b',4),
(5,'2b37fd16-439b-43f5-b8be-5876010ef980',5),
(6,'3e07fa67-a574-493b-ba78-35d004e52943',6),
(7,'809949dd-1946-4d43-a94e-53d1d752ebbd',7),
(8,'050c7d4f-2057-42ad-a041-113604d14a25',9),
(9,'bb3284fc-6863-415f-be76-d485335269a6',8),
(10,'b60c3313-bbbb-42bd-b1ec-4e78843cfc2f',10),
(11,'738cf030-e1c0-4ad1-a0ea-a355eedfaa39',11),
(12,'64eb760d-5715-4be6-bc5e-9330aaf66229',12),
(13,'0ff9c647-774a-435b-9f87-3e5d882955a9',13),
(14,'352e5e55-53ee-47fa-810c-70a6fa0ac340',14),
(15,'1c748de7-f998-4601-8683-714ab3be19d8',15),
(16,'ca7573d7-7359-419b-947d-c5a410c75a40',16),
(17,'0d24dc09-c764-4412-9ecf-c8f846eda05c',17),
(18,'6bbc9be6-783d-4f17-8be3-b669ae6d86be',18),
(19,'e5e6730d-3ad8-4257-9044-03763a4550b1',19),
(20,'7061e559-2339-4319-b367-792d01e2110f',20),
(21,'93757731-ec6f-41d5-9b32-e47079168bfc',21),
(22,'de18ff10-f6d5-46cb-8277-698d8eb1fa38',22),
(23,'906354e9-dd50-4679-ab5c-32c7e8e89aed',27),
(25,'3925bf50-370a-4f22-93c4-e263b9bdd000',23),
(26,'5bf4bbb5-88f2-4c8a-905a-dae972a9cec6',24),
(27,'f1b619cf-0e7b-4837-bb76-4c15a857a437',25),
(28,'2bf57511-4f81-4777-b95f-af034dbcdc6f',26);
/*!40000 ALTER TABLE `artist_images` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `official_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `tiktok_url` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `tidal_url` varchar(255) DEFAULT NULL,
  `spotify_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `artists` VALUES
(1,'Gojira','+33 1 42 67 00 00','contact@gojira-music.com','Progressive Death Metal','France','Taking their name from the original Japanese pronunciation of Godzilla, French heavy metal quartet Gojira have gone from the utmost obscurity in the first half of their career to widespread global recognition in the second. Combining elements of thrash, death, math, groove, progressive, and post-metal with philosophical and environment-themed lyrics, the band found mainstream favor in 2012 with the release of their fifth long-player, L\'Enfant Sauvage, and doubled-down on that success with 2016\'s Grammy-nominated Magma and 2021\'s hard-hitting and versatile Fortitude. In 2024, Gojira became the first heavy metal act to perform at an Olympic opening ceremony. ','cdcbb431-ad1b-473a-be99-1b9e23e4b426','https://www.gojira-music.com/','https://www.instagram.com/gojiraofficial','https://www.tiktok.com/@gojiraband','https://www.youtube.com/gojira','https://tidal.com/artist/3883303','https://open.spotify.com/embed/track/2pZsQqXFgcY03vRyZxSQhU?utm_source=generator'),
(2,'Loathe','+44 20 7946 0000','info@loathe.uk','Metalcore','UK','Loathe (sometimes stylized as LOATHE) are an English nu metalcore band from Liverpool. The band\'s music makes use of elements of metalcore and nu metal, while also incorporating more experimental aspects from genres like shoegaze, progressive metal and industrial music. Formed in 2014, the group consists of lead vocalist Kadeem France, guitarist and second vocalist Erik Bickerstaffe, drummer Sean Radcliffe and bassist Feisal El-Khazragi. Loathe have been nominated for Heavy Music Awards best UK breakthrough band and Metal Hammer Golden Gods Awards best new band in 2018. In a 2020 poll by Revolver magazine, they were voted the third most likely contemporary band to break through into the mainstream.','c4dae7d0-a787-4992-bfac-32918c423e87','https://loatheasone.co.uk/','https://www.instagram.com/loatheasone','','https://www.youtube.com/watch?v=pRzlroDyvXo','https://tidal.com/artist/3712384','https://open.spotify.com/embed/track/4OmlsAT8r4q9vPFBvfYgyZ?utm_source=generator'),
(3,'Rammstein','+49 30 2091 0000','management@rammstein.de','Industrial Metal','Germany','Over the course of three decades, Rammstein have shaped heavy music with their unique blend of industrial sound, provocative aesthetics, and spectacular live shows. Formed in Berlin in 1994, the line-up has remained unchanged: Till Lindemann, Richard Z. Kruspe, Paul Landers, Oliver Riedel, Christoph Schneider, and Flake Lorenz. Eight studio albums, including two German No.1 singles (“Pussy”, “Deutschland\") and their most recent release “Zeit\" (2022), have earned them multiple gold and platinum awards worldwide as well as Grammy nominations. Known for uncompromising creativity, iconic videos, and incendiary stage productions, Rammstein continue to defy convention and sell out stadiums across the globe – writing one of the most influential and unique chapters in rock history.','192743ce-c57e-4dea-b762-fc14437ac7bc','https://www.rammstein.de/en/','https://www.instagram.com/rammsteinofficial/','https://www.tiktok.com/@rammstein','https://www.youtube.com/channel/UCYp3rk70ACGXQ4gFAiMr1SQ','https://tidal.com/artist/24972','https://open.spotify.com/embed/track/3gVhsZtseYtY1fMuyYq06F?utm_source=generator'),
(4,'Faetooth','+1 213 555 0198','faetoothband@gmail.com','Doom Metal','USA','Spawning from Los Angeles, Faetooth forges fairy-doom: an eclectic amalgamation of doom metal, sludge, and shoegaze. From spellbinding melodies to guttural shrieks, Faetooth’s music conjures a looming atmosphere offering you a glimpse into their mystifying realm.','4ee92796-7185-4bc6-826c-ef80e151f9c6','','https://www.instagram.com/faetooth/','https://www.tiktok.com/@faetooth','https://www.youtube.com/@Faetooth','https://tidal.com/artist/17871929','https://open.spotify.com/embed/track/7hwngx8lZypzVtHeKAxi4F?utm_source=generator'),
(5,'Deftones','+1 916 555 0123','contact@deftones.com','Alternative Metal','USA','Deftones have always defined boundless creativity in the music space. Across nine studio albums, they have carved out an unmistakable sonic identity — ferocious yet dreamlike, while making space for constant refinement and surprise. Now, decades on from the groove-forward sound of their era-defining debut, Adrenaline, and following a long line of masterpieces including 2000’s White Pony, 2010’s Diamond Eyes and 2020’s Ohms — an album that earned them their second and third Grammy nominations — they return with one of the most focused statements of their career: private music. Joining the band’s creative core of Chino Moreno, Stephen Carpenter, Abe Cunningham and Frank Delgado (as well as touring bassist Fred Sablan, who appears on the album) is producer Nick Raskulinecz, who previously worked on Diamond Eyes and 2012’s riveting Koi No Yokan. The result is a lean, masterfully paced 11-song set that plays like a new Deftones benchmark.','eee6a9ac-f592-46db-abbc-4bcdab5b8cf8','https://www.deftones.com/','https://www.instagram.com/deftones/','https://www.tiktok.com/@deftones','https://www.youtube.com/@deftones','https://tidal.com/artist/15349','https://open.spotify.com/embed/track/51c94ac31swyDQj9B3Lzs3?utm_source=generator'),
(6,'Behemoth','+48 22 654 00 00','behemoth.mgmt@new-east.pl','Blackened Death Metal','Poland','Resting on their laurels was never in consideration as far as Behemoth were concerned. The Shit Ov God is emblematic of that. Here\'s a band that, 34 years in, is releasing its most inflammatory and extreme record to date. 8 songs that go into the fathoms of humanity, divinity and what defiance means in an age where individuality is prized but everyone is clinging to their saviours. Musically, politically, or otherwise. The title of the album is in line with those sensibilities. Intentionally polarizing, founder and frontman Nergal, says of the title \" We chose this provocative title deliberately, rejecting subtlety in favor of a direct and polarizing statement. It\'s a defiant plunge into the depths, daring to seek the absolute even in the gutter.\"','64165fa2-f282-4f86-bdfe-86fcc4c37567','https://www.behemoth.pl/','https://www.instagram.com/behemothofficial/','https://www.tiktok.com/@behemothofficial','https://www.youtube.com/user/Behemothofficial','https://tidal.com/artist/24058','https://open.spotify.com/embed/track/2FsDybzWgntIa8M3Y7AenT?utm_source=generator'),
(7,'Fit For An Autopsy','+1 201 555 0144','ffaa@metal-management.com','Deathcore','USA','The crushing music of Fit For An Autopsy is for any fan of extreme metal, its sound and fury is absolutely unflinching in purpose. The band expertly blends excessive, force-fueled death metal with atmospheric groove and impassioned personal diatribes. The Nothing That Is, Fit For An Autopsy’s seventh and latest album (third for Nuclear Blast), bears no sign whatsoever of commercial concession or rehashed past glories. Instead, the ten-song album finds the band exploring moodier textures and deeper emotions that add new power and dynamics to their already brutal and complex music, while also completely tuning out the ambient noise of passing musical trends and the expectations of the outside world.','e1fe03de-567a-4d7e-9190-1d76baff91e6','https://fitforanautopsy.co/','https://www.instagram.com/fitforanautopsy/','https://www.tiktok.com/@fitforanautopsyofficial','https://www.youtube.com/@FitForAnAutopsy','https://tidal.com/artist/3985809','https://open.spotify.com/embed/track/79yvAWlqVukArNOxtyyKCI?utm_source=generator'),
(8,'Lorna Shore','+1 732 555 0166','lornashore@touring.com','Deathcore','USA','Call them heroes or hell-bringers, it doesn’t matter to Lorna Shore. On their fifth album—I Feel The Everblack Festering Within Me—the New Jersey quintet puts every metal subgenre on notice, forcing listeners to wonder what took the genre so long to evolve. Andrew O’Connor’s orchestral arrangements provide an epic, cinematic backdrop for the band’s stentorian power. Adam De Micco shifts seamlessly from light-speed black metal to \'70s-style guitar phrasing, while Will Ramos proves himself the heir to Mike Patton’s vocal madness. Driven by the propulsive terror of Yager and Archey, the album transcends deathcore, leaning into grandiose prog-rock territory through sheer extremity. By torching the rulebook to divine their own truth, Lorna Shore has created a physical onslaught that demands other genres step up their game.','b10e2abb-4812-48bb-a27d-98141e6fcd5c','https://lornashoreband.com/','https://www.instagram.com/lornashore','https://www.tiktok.com/@lornashoreofficial','https://www.youtube.com/@LornaShore','https://tidal.com/artist/5269283','https://open.spotify.com/embed/track/0O26gtfjuscAOnQobjNPPL?utm_source=generator'),
(9,'Opeth','+46 8 123 456 00','management@opeth.com','Progressive Metal','Sweden','More than three decades into their career, Opeth have trained their admirers to expect the unexpected. But even by their own standards, the Swedish progressive titans have conjured something extraordinary this time around. The band’s 14th studio exploration, The Last Will & Testament, is the darkest and heaviest record they have made in decades, it is also the most fearlessly progressive. A concept album recounting the reading of one recently deceased man’s will to an audience of his surviving family members, it brims with haunting melodrama, shocking revelations and some of the wildest and most unpredictable music that songwriter/frontman Mikael Åkerfeldt has ever written. Proud adherents to a progressive ethos, Opeth have never repeated themselves, and The Last Will & Testament is every bit as revelatory and adventurous as its 13 predecessors. But one thing is undeniable: Mikael Akerfeldt’s peerless death metal growls are back, for the first time since Watershed in 2008. After three decades of dazzling the world, Opeth have made their most daring creative leap yet. The Last Will & Testament is a progressive and dramatic triumph, and yet more proof that expecting the unexpected is the only way forward for fans of Sweden’s finest.','23df5770-e321-4eec-b0f8-2e00a57cff51','https://opeth.com/','https://www.instagram.com/officialopeth','https://www.tiktok.com/@opethofficial','https://www.youtube.com/@opeth','https://tidal.com/artist/37348','https://open.spotify.com/embed/track/0ppdt8zRZOHIKh4ZDB0Zp9?utm_source=generator'),
(10,'Jinjer','+380 44 234 5678','jinjer.booking@gmail.com','Progressive Metal','Ukraine','A versatile, progressive groove metal unit based out of Ukraine, Jinjer have found success both in their Eastern European homeland and abroad with their punitive blend of post-hardcore and death/progressive/nu-metal. Drawing from a wide array of influences, including R&B, soul, hip-hop, and the full spectrum of heavy metal, the band formed in 2009 and features a lineup consisting of Tatiana Shmailyuk (vocals), Roman Ibramkhalilov (guitar), Eugene Abdiukhanov (bass), and Vladislav Ulasevich (drums). Jinjer issued a pair of EPs, 2009\'s OIMACTTA and 2012\'s Inhale, Do Not Breathe, before breaking big at home with the release of a full-length version of the latter album in 2013. The group\'s sophomore long-player, 2014\'s Cloud Factory, caught the attention of heavy metal institution Napalm, which signed Jinjer and released their third full-length effort, King of Everything, in 2016. In early 2019, the band returned with the Micro EP, again on Napalm. By the end of the year, its natural counterpoint, Macro, arrived.','227b7839-4435-4cc2-b8a0-746f8c175b81','https://jinjer-metal.com/','https://www.instagram.com/jinjer_official/','https://www.tiktok.com/@jinjer_official','https://www.youtube.com/watch?v=SQNtGoM3FVU','https://tidal.com/artist/4930355','https://open.spotify.com/embed/track/5t8NXa2fugcTPsTfhVILmS?utm_source=generator'),
(11,'Metallica','+1 415 555 0101','hq@metallica.com','Thrash Metal','USA','Metallica formed in 1981 by drummer Lars Ulrich and guitarist and vocalist James Hetfield and has become one of the most influential and commercially successful rock bands in history, having sold 120 million albums worldwide and generating more than 15 billion streams while playing to millions of fans on literally all seven continents. They have scored several multi-platinum albums, including 1991’s Metallica (commonly referred to as The Black Album), with sales of nearly 18 million copies in the United States alone, making it the best-selling album in the history of Soundscan. Metallica has also garnered numerous awards and accolades, including nine Grammy Awards, two American Music Awards, and multiple MTV Video Music Awards, and were inducted into the Rock and Roll Hall of Fame and Museum in 2009. In December 2013, Metallica made history when they performed a rare concert in Antarctica, becoming the first act to ever play all seven continents all within a year, and earning themselves a spot in the Guinness Book of World Records. Metallica’s twelfth studio album was released on April 14, 2023 on Metallica’s own Blackened Recordings record label, and the band is currently on the M72 Tour—a 2-year, continent spanning tour with two nights in each market and no repeat sets.','ba0bdf91-4dd2-4074-898d-2ab104edde7a','https://www.metallica.com/','https://www.instagram.com/metallica/','https://www.tiktok.com/@metallica','https://www.youtube.com/@metallica','https://tidal.com/artist/8405','https://open.spotify.com/embed/track/2MuWTIM3b0YEAskbeeFE1i?utm_source=generator'),
(12,'Mastodon','+1 404 555 0188','info@mastodonrocks.com','Sludge Metal','USA','Mastodon is an American heavy metal band from Atlanta, Georgia. Formed in 2000, the band\'s lineup of Troy Sanders (bass/vocals), Brent Hinds (lead guitar/vocals), Bill Kelliher (rhythm guitar/backing vocals), and Brann Dailor (drums/vocals) remained unchanged for 24 years, until Hinds\'s departure in March 2025. Mastodon has released eight studio albums, as well as a number of other releases. Atlanta\'s Mastodon are one of the most original and influential American metal bands to appear in the 21st century. Their wide-angle progressive approach encompasses stoner and sludge metal, punishing hardcore and metalcore, neo-psych, death metal, and more. The group\'s playing style incorporates technically complex guitar riffs, lyric hooks, long, melodic instrumental passages, and intricate, jazz-influenced drumming with syncopated time signatures. In 2016, the staff of Loudwire named them the 20th-best metal band of all time.','8e55696d-62b5-4782-9832-e695b0572c33','https://www.mastodonrocks.com/','https://www.instagram.com/mastodonrocks/','https://www.tiktok.com/@mastodonrocks','https://www.youtube.com/channel/UCR7Ls5FuT6UKTcsMkcwgCUA','https://tidal.com/artist/15346','https://open.spotify.com/embed/track/3jagGO7eHHuaD53ibehkux?utm_source=generator'),
(13,'Evanescence','+1 501 555 0155','mgmt@evanescence.com','Alternative Metal','USA','Evanescence is an American rock band founded in 1994 by singer and keyboardist Amy Lee and guitarist Ben Moody in Little Rock, Arkansas. After releasing independent EPs and a demo CD as a duo in the late 1990s, Evanescence released their debut studio album, Fallen, on Wind-up Records in 2003. Propelled by the success of hit singles like \"Bring Me to Life\" and \"My Immortal\", Fallen sold more than four million copies in the US by January 2004, garnering Evanescence two Grammy Awards out of six nominations. They released their first live album and concert DVD, Anywhere but Home, in 2004, which sold over one million copies worldwide.  Evanescence will release the 20th anniversary edition of their multi-platinum debut album Fallen on November 17th. The anniversary will see remastered tracks from the original album, previously unheard demos, and alternate versions of some of their most iconic songs. In Amy’s words, “20 years later, this album has never meant more. Fallen has been the soundtrack to first loves, epic heartbreak, self-realization, wedding days, last goodbyes, friendships, and countless other moments in so many lives…not to mention my own. I am forever humbled and grateful to be a part of it.”','21265009-0652-41a0-9d20-f84d2c1cf013','https://www.evanescence.com/','https://www.instagram.com/evanescenceofficial/','https://www.tiktok.com/@evanescence','https://www.youtube.com/channel/UCJeH7gl6PbDVV4DTldIOPOA','https://tidal.com/artist/4853','https://open.spotify.com/embed/track/0COqiPhxzoWICwFCS4eZcp?utm_source=generator'),
(14,'Tool','+1 310 555 0199','toolband@management.com','Progressive Metal','USA','Tool established themselves as one of America\'s most enduring and unpredictable acts with an ever-evolving brand of muscular but mind-altering sonics, a wry sense of humor, and a mystical aesthetic that attracted a cult-like following of devoted fans with just a handful of albums spread across decades. Their greatest breakthrough was to meld dark underground metal with the ambition of art rock, crafting multi-sectioned, layered songs as if they were classical composers. While embracing the artsy, they also paid musical homage to the relentlessly bleak visions of grindcore, death metal, and thrash. Even with their post-punk influences, they executed their music with the sound and feel of prog rock, alternating between long, detailed instrumental interludes and lyrical rants in their songs. Debuting in the early \'90s with Undertow, they were initially lumped in with the nu-metal contemporaries of the time, which made them a hit on rock radio with their sophomore effort, 1996\'s Ænima. However, they soon broke away from those associations, evolving beyond the confines of traditional song structures and song lengths, crafting epics that often clocked in past the ten-minute mark on LP head-trips Lateralus (2001) and 10,000 Days (2006). After a lengthy 13-year hiatus, they returned to the fold in 2019 with their fifth opus, the chart-topping, Grammy-nominated Fear Inoculum. In 2022, they celebrated their 30th anniversary with \"Opiate²,\" a re-recorded version of their debut single. ','da8b101e-f822-4520-9b5e-3ce37b4422b8','https://www.toolband.com','https://www.instagram.com/toolmusic/','https://www.tiktok.com/@tool','https://www.youtube.com/channel/UC1wUo-29zS7m_Jp-U_xYcFQ','https://tidal.com/artist/3850668','https://open.spotify.com/embed/track/55mJleti2WfWEFNFcBduhc?utm_source=generator'),
(15,'Whitechapel','+1 865 555 0177','whitechapel@metalblade.com','Deathcore','USA','Whitechapel is an American deathcore band from Knoxville, Tennessee. The band is named after the Whitechapel district in east London, England, where Jack the Ripper committed a series of murders. The group comprises vocalist Phil Bozeman, guitarists Ben Savage, Alex Wade, and Zach Householder, bassist Gabe Crisp and drummer Brandon Zackey. Their core lineup, with the exception of the drummer, has remained consistent since Householder replaced original guitarist Brandon Cagle in 2007. Founded in 2006 by Bozeman and Savage, the band has released nine studio albums and twenty-two music videos, and is currently signed to Metal Blade Records. Whitechapel\'s 2010 album A New Era of Corruption, sold around 10,600 copies in the United States in its first week of release and debuted at position No. 43 on the Billboard 200 chart. The band\'s self-titled fourth album was released in 2012 and debuted at No. 47 on the Billboard 200, selling roughly 9,200 copies in its first week. In 2014 the band released their fifth full-length album, Our Endless War to generally positive reviews. The album sold roughly 16,000 copies in its first week and debuted at No. 10 on the Billboard 200. They released their sixth full-length album Mark of the Blade in 2016 to greater critical acclaim, selling roughly 8,000 copies in the first week of its release. In 2019, Whitechapel released their seventh album, The Valley, which debuted at No. 143 on the Billboard 200 also to critical acclaim. Their newest album, Hymns in Dissonance, was released on March 7, 2025. ','b2add995-822b-4596-b61a-a59092deea87','https://whitechapelband.com/','https://www.instagram.com/whitechapelband/','https://www.tiktok.com/@whitechapelmusic','https://www.youtube.com/@WhitechapelTV','https://tidal.com/artist/3767580','https://open.spotify.com/embed/track/4CuCHhr5zHzEwcflWD2jUT?utm_source=generator'),
(16,'VOLA','+45 31 12 34 56','contact@volaband.com','Progressive Metal','Denmark','Vola (stylized as VOLA) are a Danish progressive metal band formed in Copenhagen in 2006. Having gone through a number of lineup changes earlier in their career, the band currently consists of three Danes, guitarist/vocalist Asger Mygind, keyboardist Martin Werner and bassist Nicolai Mogensen; and one Swede, drummer Adam Janzi. The Danish-Swedish quartet continues to defy conventions, combining electronic elements with a progressive and pop-infused metal sound. Their fourth album, \'Friend Of A Phantom\', was released on November 1st, 2024. ','9338a1be-06f0-4d59-9e70-311cca2f4d93','https://www.volaband.com/','https://www.instagram.com/volaband/','https://www.tiktok.com/@volaband','https://www.youtube.com/@volaband','https://tidal.com/artist/6476261','https://open.spotify.com/embed/track/6WTioFyIEiYB5Ge0SJO8Rd?utm_source=generator'),
(17,'Deafheaven','+1 415 555 0122','info@deafheaven.com','Blackgaze','USA','Deafheaven is an American blackgaze band formed in 2010. Originally based in San Francisco, the group began as a two-piece with singer George Clarke and guitarist Kerry McCoy, who recorded and self-released a demo album together. Following its release, Deafheaven recruited three new members and began to tour. Before the end of 2010, the band signed to Deathwish Inc. and later released their debut album Roads to Judah, in April 2011. They popularized a unique style blending black metal, shoegaze, and post-rock, among other influences, later called blackgaze by reviewers. Deafheaven\'s second album, Sunbather, was released in 2013 to wide critical acclaim, becoming one of the best reviewed albums of the year in the US. In 2015 the band followed up with New Bermuda and in 2018 with Ordinary Corrupt Human Love. Their 2021 album, Infinite Granite, drastically reduced the presence of screamed vocals. In 2025, they released Lonely People with Power, which featured a heavier and more aggressive sound.','7f7650a0-db4e-4c02-92dc-964e70cf2135','https://deafheaven.com/','https://www.instagram.com/deafheavenband/','https://www.tiktok.com/@deafheavenband','https://www.youtube.com/channel/UC97UMkZzchbn0uO-KFyq8ww','https://tidal.com/artist/3938220','https://open.spotify.com/embed/track/5vWfIEWXevuwFSVqgrItHC?utm_source=generator'),
(18,'Judas Priest','+44 20 7946 0555','mgmt@judaspriest.com','Heavy Metal','UK','Judas Priest are one of the most influential and long-lasting heavy metal groups of all time. Emerging at the dawn of the New Wave of British Heavy Metal, Priest combined straightforward rock & roll muscle with a more theatrically minded performance presence. This sound was made more unique by the dynamic banshee wail of Rob Halford and the vicious dual-lead guitar attack of Glenn Tipton and K.K. Downing. While issuing metal anthems like \"Breaking the Law,” “Living After Midnight,” and “You\'ve Got Another Thing Coming,\" Judas Priest set the pace for the genre from 1975 until 1985 with iconic albums like British Steel (1980), Screaming for Vengeance (1982), and Defenders of the Faith (1984), and helped lay the groundwork for speed and death metal. The group struggled after Halford\'s departure in the early \'90s but were restored to prominence in the 2000s upon his return, issuing a string of acclaimed efforts -- Angel of Retribution (2005), Nostradamus (2010), Redeemer of Souls (2014), and the U.S. and U.K. Top Five-charting Firepower (2018) -- that skillfully married melody, pageantry, and force. Judas Priest were inducted into the Rock & Roll Hall of Fame in 2022, two years before the arrival of Invincible Shield, their 19th studio LP. ','9951fc3b-545f-43a5-abd6-c655092712e4','https://judaspriest.com/home/','https://instagram.com/judaspriest','https://www.tiktok.com/@judaspriest','https://www.youtube.com/@judaspriest','https://tidal.com/artist/701','https://open.spotify.com/embed/track/0L7zm6afBEtrNKo6C6Gj08?utm_source=generator'),
(19,'Pantera','+1 817 555 0199','info@pantera.com','Groove Metal','USA','One of the preeminent metal bands of the \'90s, Texan powerhouse Pantera put to rest any and all remnants of the \'80s metal scene, almost single-handedly demolishing any notion that hair metal, speed metal, power metal, et al., were anything but passé. Loathe to admit it, the Texas band had in fact been one of those \'80s metal bands, releasing fairly unsuccessful (and later disowned) glam-inspired music throughout much of the decade. The about-face came in 1986 with the addition of vocalist Phil Anselmo, who joined the classic, core lineup of bassist Rex Brown, drummer Vinnie Paul, and guitarist Dimebag Darrell. After the release of 1988\'s Power Metal, the band pushed their sound to a new extreme with their major-label debut, Cowboys from Hell (1990). Pantera\'s mainstream breakthrough came next with Vulgar Display of Power (1992), their second major-label album, which thrust the band to the forefront of the metal scene, alongside such veteran bands as metallica, Megadeth, Slayer, and Anthrax, as well as fellow up-and-comers Sepultura and White Zombie. By the time Pantera unleashed Far Beyond Driven (1994), after two long years of touring, they were the most popular metal band in the land: the new album debuted atop the Billboard Top 200 as its lead single, \"I\'m Broken,\" was getting massive airplay. ','8eb7dbc8-3d44-4898-a9c0-90e9668da859','https://pantera.com/','https://www.instagram.com/panteraofficial','https://www.tiktok.com/@pantera','https://www.youtube.com/channel/UChTDORxN3YPmasEurM6kRoA','https://tidal.com/artist/6373','https://open.spotify.com/embed/track/7fcfNW0XxTWlwVlftzfDOR?utm_source=generator'),
(20,'Danheim','+45 70 10 20 30','contact@danheimmusic.com','Neofolk','Denmark','Danheim is a Nordic folk/Viking inspired project from the Copenhagen-based Danish producer Reidar Schæfer Olsen, a man with 10 years of experience in electronic and ambient music – focusing on Nordic Folk and Viking age inspired music with a certain Nordic authenticity or mood. Danheim’s music is often composed of ideas and stories based on the darker side of the Viking period, inspired or consisting of Nordic Mythology, old Danish folklore, and a vivid imagination. Danheim hit 1 billion streams across streaming platforms in 2022, has 585.000 subscribers on YouTube, with music featured in multiple seasons of the popular TV show Vikings. Singer-songwriter Reidar Schæfer Olsen, (born in 1985, Brøndby, Denmark), transitioned to focus on music in the early 2000s and has been composing music almost continuously ever since, alongside doing radio shows and starting the indie label Fimbul Records. With a passion for songwriting running through his veins from an early age, Reidar Olsen’s Viking-inspired music and dark melodies have broadened the Nordic folk genre and inspired millions of listeners around the world, bringing them back in time with a blend of his imagination and creativity.','7b4d8989-fc9d-4cd1-9f18-4a2de19462be','https://danheimmusic.com/','','','https://www.youtube.com/@Danheim','https://tidal.com/artist/8412655','https://open.spotify.com/embed/track/1L6qOVwLb1QIdcb9dtFPJ2?utm_source=generator'),
(21,'Wardruna','+47 55 12 34 56','info@wardruna.com','Nordic Folk','Norway','From the deep woods now emerges Birna, Wardruna’s sixth studio album. Through his never resting dialogue with nature, main composer Einar Selvik has been searching for the voice of the bear, our lost sister of the forest. Resulting in this upcoming release, scheduled for January 24, 2025 through Sony Music and By Norse. Birna – the she-bear in Old Norse – is a work of art dedicated to the warden of the forest, nature’s caretaker, and her battles here on earth. Slowly driven out of her habitat by modern day societies, she has entered a stage of permanent hibernation. As a result, the forest is gradually dying, longing for its pulse and heart – its shepherd. Birna calls for her return.“Where the previous album Kvitravn was a step conceptually from the past to the present, Birna even more so seeks to address the here and now and the way forward,” states composer Einar Selvik. From the Runaljod trilogy (2009, 2013, 2016), exploring old Norse myths, traditions, and language through the 24 proto-Norse runes, the sound of Wardruna evolved and blended into the stripped down, acoustic compositions on Skald (2018). Kvitravn (White-Raven) (2021) explores Northern sorcery, spirit-animals, animism, and the act of creation – the ever-interchanging prolific relationship between the skaldic poet and nature itself. The record charted in 13 countries, including #1 in Canada and Austria, and #2 in Germany. ','3e174263-6f80-4f67-b1e2-036213c0ed97','https://wardruna.com/','https://www.instagram.com/wardruna/','','https://www.youtube.com/channel/UCoK2X3nnuG7ug-Kk75r5rJQ','https://tidal.com/artist/3565132','https://open.spotify.com/embed/track/0OXEH9T6QSQCrmnjdtpf4P?utm_source=generator'),
(22,'Allt','+46 8 505 123 00','alltband@gmail.com','Progressive Metalcore','Sweden','Formed in 2020, Allt is a progressive metalcore band from Karlskoga, Sweden. Known for their audiovisual storytelling and innovative approach to metalcore, Allt has released their highly anticipated debut album, \"From The New World.\" in October 2024. The name Allt, which means \"everything\" in Swedish, reflects the band\'s philosophy towards music: never to be confined within genre boundaries and continually delivering conceptually rich compositions inspired by the world around us and the stories and myths told through the ages. Following the release of \"From The New World\", Allt supported Imminence, presenting their new album live for the first time, followed by their first-ever headline tour around Europe, selling out 13 of 18 shows in March 2025. Energized by this success, Allt made their way to North American shores for the first time in May 2025, opening for Invent Animate & Silent Planet, culminating in a slot at the prestigious Welcome To Rockville festival. ','a3b7d2fd-43fc-47b3-80c1-aa64d2a0006b','https://shop.alltband.com/','https://www.instagram.com/alltband/','https://www.tiktok.com/@alltband','https://www.youtube.com/@allt','https://tidal.com/artist/21078379','https://open.spotify.com/embed/track/49LZHvYu1hUWIlR5Di3LWJ?utm_source=generator'),
(23,'Soen','+46 70 123 45 67','management@soenmusic.com','Progressive Metal','Sweden','Initially formed in 2004, it was in May 2010 that the formation of Soen was officially announced. Founding member drummer Martin Lopez describes Soen’s music as “melodic, heavy and intricate”.   The group’s first song, ‘Fraccions‘, was released in October 2010 and their debut album, Cognitive, was released on 15 February 2012 receiving positive critical reception.   Since Lopez and Joel Ekelöf formed the group, Soen have never shied away from exploration and analysis of self or society, both as musicians and expressionists.   SOEN are: Joel Ekelöf – Vocals Martin Lopez – Drums, Percussion Cody Ford – Guitar Lars Åhlund – Keys, Guitar Stefan Stenberg – Bass','0f037677-4b9a-4fd4-b87a-86454d3b913b','https://www.soenmusic.com/','https://www.instagram.com/soenmusic/','','https://www.youtube.com/@SoenOfficial','https://tidal.com/artist/4373811','https://open.spotify.com/embed/track/6lThiyFluc0jY2O8SYg3II?utm_source=generator'),
(24,'Igorrr','+33 1 40 20 50 50','igorrr.contact@gmail.com','Avant-garde Metal','France','Igorrr is the project of French composer and producer Gautier Serre, renowned for pushing extreme music far beyond traditional genre boundaries. Blending breakcore, black and death metal, baroque classical music, electronic chaos, and surreal experimentation, Igorrr’s sound is intentionally jarring yet meticulously composed. The result is music that feels both violently unhinged and strangely elegant, shifting without warning from blast beats and distorted screams to harpsichords, operatic vocals, and absurd melodic twists. Early releases like Poisson Soluble and Nostril established the project’s chaotic identity, fusing frenetic electronic rhythms with extreme metal and warped classical motifs. Hallelujah expanded the scope with richer production, baroque choirs, and a stronger sense of contrast between beauty and brutality. With Savage Sinusoid, Igorrr leaned further into metal, incorporating black metal vocals and heavier structures while retaining its surreal edge. Spirituality and Distortion pushed the project to its most ambitious scale, exploring global influences, ritualistic themes, and expansive atmospheres. Each Igorrr album feels like a carefully controlled descent into madness—unpredictable, theatrical, and unmistakably unique.','010ac405-9293-4e22-aca3-b1c9dfbe454c','https://igorrr.com/','https://instagram.com/igorrr_music','https://www.tiktok.com/@igorrr_official','https://www.youtube.com/@IgorrrOfficial','https://tidal.com/artist/3949100','https://open.spotify.com/embed/track/6DUvpC2bFViefEhZ65NGgk?utm_source=generator'),
(25,'Devin Townsend','+1 604 555 0192','info@hevydevy.com','Progressive Metal','Canada','Devin Townsend’s career is one of many distinct eras. He’s been the leader of Strapping Young Lad, the lynchpin of the Devin Townsend Project and the co-architect of country duo Casualties of Cool, all while maintaining his prolific and lauded solo project. Now, the polymath’s newest era starts with PowerNerd: a succinct but still progressive record that pulls from its mastermind’s childhood love of vintage rock. From the moment the title track ignites the record with a roar of “PowerNerd!”, Devin’s 28th studio project is a gallop of melody, noise and emotion. The opener and “Knuckledragger” are all-out, high-speed rampages, their impact intensified by their central figure’s signature ‘wall of sound’ production style. However, that aggression is far from the only thing to come from Powernerd’s 11 episodic tracks. “Dreams of Light”, by comparison, is an evocative and dynamic four-minute ballad. “Younger Lover” calms down from an explosive opening to lush verses of synths and singing, whereas “Falling Apart” and “Jainism” add texture after texture on top of dulcet, acoustic introductions. With each song also having an irresistible hook at its heart, Devin has undeniably crafted a soulful instant classic of a rock record.',NULL,'https://hevydevy.com/','https://www.instagram.com/dvntownsend/','https://www.tiktok.com/@dvntownsend','https://www.youtube.com/@dvntownsend','https://tidal.com/artist/3658981','https://open.spotify.com/embed/track/3hXtTHo8l8XEPwufhz3rTk?utm_source=generator'),
(26,'Linkin Park','+1 310 555 0110','contact@linkinpark.com','Nu Metal','USA','LINKIN PARK is the magnetic hub of an emotional and cultural community—staggering in scope, intimate in connection, and wholly unique. Blending sonic and visual inspiration under the name Xero, later Hybrid Theory, before finally settling on LINKIN PARK, Mike Shinoda, Chester Bennington, Brad Delson, Joseph Hahn, Rob Bourdon, and Dave “Phoenix” Farrell had no idea they were about to become the biggest rock band of their generation. In 2000, they released their first full-length, Hybrid Theory. Certified Diamond, it became “the bestselling debut of the 21st century.” Seven seminal albums followed: Meteora, Collision Course, Minutes To Midnight, A Thousand Suns, LIVING THINGS, The Hunting Party, and One More Light. LINKIN PARK has received multiple GRAMMY Awards, sold over 100 million albums worldwide, and notched five #1 Billboard debuts. After the tragic loss of Bennington in 2017, the band came to a devastating halt; their future obscured by grief and unanswered questions. Friendships led the way. Mike, Brad, Phoenix, and Joe began making music together again. They met Emily Armstrong and Colin Brittain, jam sessions organically morphed into recording, and LP quietly crafted a collection of songs channeling the open-hearted spontaneity of starting over: FROM ZERO. Earning some of the highest critical praise of their career, FROM ZERO peaked at #1 in 14 countries, igniting the triumphant FROM ZERO WORLD TOUR and LINKIN PARK’s continuing artistic evolution.','41455c61-9787-4672-b850-1af5736c7ea3','https://linkinpark.com/','','https://www.tiktok.com/@linkinpark','https://www.youtube.com/channel/UCZU9T1ceaOgwfLRq7OKFU4Q','https://tidal.com/artist/14123','https://open.spotify.com/embed/track/60a0Rd6pjrkxjPbaKzXjfq?utm_source=generator'),
(27,'Imperial Triumphant','+1 718 555 0144','it@gileadmedia.net','Avant-garde Black Metal','USA','Imperial Triumphant are one of the most distinctive forces in modern extreme metal, fusing avant-garde black metal, dissonant death metal, and free-jazz chaos into a vision of New York City as a monument to excess and decay. Formed in the late 2000s, the band uses the city’s architecture, capitalism, and moral rot as both aesthetic and philosophy, translating urban dread into towering, technical brutality. Their sound is dense and suffocating—jagged riffs, unorthodox song structures, sudden tempo shifts, and improvisational brass passages collide in music that feels both ritualistic and grotesquely opulent. Their early releases, Abominamentvm and Abyssal Gods, established a murky black-metal foundation steeped in atmosphere and dissonance. Vile Luxury marked a turning point, introducing overt jazz influences and an art-deco visual identity that framed NYC as a decadent empire in decline. This concept was fully realized on Alphaville, a sprawling, chaotic album that sharpened their technicality while expanding the band’s sonic palette. With Spirit of Ecstasy, Imperial Triumphant pushed even further, incorporating swing rhythms, collaborations with jazz musicians, and moments of surreal grandeur without sacrificing heaviness. Each album acts as a chapter in a larger narrative—an escalating portrait of civilization collapsing under its own gilded weight.','189e78ed-5a0c-4325-9d55-6634f98c2344','https://www.imperial-triumphant.com/','https://www.instagram.com/imperialtriumphant/','https://www.tiktok.com/@imperialtriumphant','https://www.youtube.com/channel/UCGAewAu26qdx3IwJn8S_uww','https://tidal.com/artist/6046541','https://open.spotify.com/embed/track/2jV8ASwqzFdy1Xmdjmvt1R?utm_source=generator'),
(28,'Slipknot','+1 515 555 0166','mgmt@slipknot1.com','Nu Metal','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(29,'Alice in Chains','+1 206 555 0188','info@aliceinchains.com','Grunge','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(30,'Sepultura','+55 11 3060 0000','contact@sepultura.com.br','Groove Metal','Brazil',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(31,'Periphery','+1 301 555 0122','periphery.mgmt@gmail.com','Progressive Metal','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(32,'Spiritbox','+1 250 555 0133','spiritbox@palechord.com','Progressive Metalcore','Canada',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(33,'Amira Elfeky','+1 213 555 0177','amira.elfeky@mgmt.com','Nu-gaze','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(34,'HEALTH','+1 323 555 0144','health@youwillloveeachother.com','Industrial Rock','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(35,'Bad Omens','+1 804 555 0155','badomens@sumerianrecords.com','Alternative Metal','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(36,'Jutes','+1 416 555 0199','jutes.mgmt@gmail.com','Alt Rock','Canada',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(37,'In Mourning','+46 23 123 45 00','info@inmourning.net','Progressive Melodic Death Metal','Sweden',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(38,'Alcest','+33 4 91 12 34 56','alcest.band@gmail.com','Blackgaze','France',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(39,'Acid Bath','+1 504 555 0122','acidbath@rotten.com','Sludge Metal','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(40,'Meshuggah','+46 90 123 45 67','meshuggah@management.se','Extreme Progressive Metal','Sweden',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(41,'Derby Motoretas Burrito Kachimba','+34 954 12 34 56','kinkidelia@derbymotoretas.com','Psychedelic Rock','Spain',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(42,'Limp Bizkit','+1 904 555 0100','bizkit.mgmt@gmail.com','Nu Metal','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(43,'Slaughter to Prevail','+7 495 123 45 67','alex.terrible@stp.com','Deathcore','Russia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(44,'Leprous','+47 35 55 66 77','management@leprous.net','Progressive Rock','Norway',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(45,'Poppy','+1 617 555 0188','poppy@sumerianrecords.com','Avant-pop / Metal','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(46,'Lamb of God','+1 804 555 0111','log@epicrecords.com','Groove Metal','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(47,'Knocked Loose','+1 502 555 0122','knockedloose@purenoise.net','Hardcore Punk','USA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(48,'Bambie Thug','+353 1 800 1234','bambie@ouijapop.com','Ouija-pop','Ireland',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(49,'Ghost','+46 58 123 45 67','tobias.forge@lomavista.com','Occult Rock','Sweden',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(50,'Batushka','+48 85 123 45 67','batushkaband@gmail.com','Black Metal','Poland',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(51,'Bring Me The Horizon','+44 114 555 0199','bmth@rawpower-mgmt.com','Alternative Metal','UK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(52,'Three Days Grace','+1 416 555 0177','info@threedaysgrace.com','Alternative Rock','Canada',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(53,'Iron Maiden','+44 20 8946 0000','phantom@ironmaiden.com','Heavy Metal','UK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `camping_types`
--

DROP TABLE IF EXISTS `camping_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `camping_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_total` int(11) NOT NULL,
  `stock_available` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camping_types`
--

LOCK TABLES `camping_types` WRITE;
/*!40000 ALTER TABLE `camping_types` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `camping_types` VALUES
(1,'Sombra de Yggdrasil (Camping Sombra)',30.00,500,500),
(2,'Morada de Freya (Glamping de Lujo)',150.00,50,50),
(3,'Drakkar sobre Ruedas (Zona Caravanas)',80.00,100,100);
/*!40000 ALTER TABLE `camping_types` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `campings`
--

DROP TABLE IF EXISTS `campings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `campings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `document_type` enum('DNI','NIE','PASSPORT') NOT NULL,
  `document_number` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','USED','CANCELLED') DEFAULT 'ACTIVE',
  `camping_type_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qr_code` (`qr_code`),
  KEY `camping_type_id` (`camping_type_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `1` FOREIGN KEY (`camping_type_id`) REFERENCES `camping_types` (`id`),
  CONSTRAINT `2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campings`
--

LOCK TABLES `campings` WRITE;
/*!40000 ALTER TABLE `campings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `campings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NULL DEFAULT current_timestamp(),
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('PENDING','PAID','CANCELLED') DEFAULT 'PENDING',
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `performances`
--

DROP TABLE IF EXISTS `performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `performances` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `artist_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `artist_id` (`artist_id`),
  KEY `stage_id` (`stage_id`),
  CONSTRAINT `1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `2` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performances`
--

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `performances` VALUES
(1,'2025-08-13 19:00:00','2025-08-13 20:00:00',52,1),
(2,'2025-08-13 20:30:00','2025-08-13 21:45:00',13,1),
(3,'2025-08-13 22:30:00','2025-08-14 00:30:00',11,1),
(4,'2025-08-14 01:15:00','2025-08-14 02:30:00',42,1),
(5,'2025-08-13 19:30:00','2025-08-13 20:30:00',44,4),
(6,'2025-08-13 21:00:00','2025-08-13 22:15:00',23,4),
(7,'2025-08-13 23:00:00','2025-08-14 00:30:00',14,4),
(8,'2025-08-14 01:00:00','2025-08-14 02:15:00',24,4),
(9,'2025-08-13 20:00:00','2025-08-13 21:00:00',43,2),
(10,'2025-08-13 21:30:00','2025-08-13 22:45:00',8,2),
(11,'2025-08-13 23:30:00','2025-08-14 01:00:00',6,2),
(12,'2025-08-14 01:30:00','2025-08-14 02:45:00',50,2),
(13,'2025-08-14 19:00:00','2025-08-14 20:00:00',19,1),
(14,'2025-08-14 20:30:00','2025-08-14 21:45:00',18,1),
(15,'2025-08-14 22:30:00','2025-08-15 00:30:00',53,1),
(16,'2025-08-15 01:15:00','2025-08-15 02:30:00',30,1),
(17,'2025-08-14 19:30:00','2025-08-14 20:30:00',12,4),
(18,'2025-08-14 21:00:00','2025-08-14 22:15:00',1,4),
(19,'2025-08-14 23:00:00','2025-08-15 00:30:00',9,4),
(20,'2025-08-15 01:00:00','2025-08-15 02:15:00',40,4),
(21,'2025-08-14 20:00:00','2025-08-14 21:00:00',7,2),
(22,'2025-08-14 21:30:00','2025-08-14 22:45:00',15,2),
(23,'2025-08-14 23:30:00','2025-08-15 01:00:00',46,2),
(24,'2025-08-15 01:30:00','2025-08-15 02:45:00',47,2),
(25,'2025-08-15 19:00:00','2025-08-15 20:00:00',51,1),
(26,'2025-08-15 20:30:00','2025-08-15 21:45:00',49,1),
(27,'2025-08-15 22:30:00','2025-08-16 00:30:00',3,1),
(28,'2025-08-16 01:15:00','2025-08-16 02:30:00',35,1),
(29,'2025-08-15 19:30:00','2025-08-15 20:30:00',32,4),
(30,'2025-08-15 21:00:00','2025-08-15 22:15:00',10,4),
(31,'2025-08-15 23:00:00','2025-08-16 00:30:00',5,4),
(32,'2025-08-16 01:00:00','2025-08-16 02:15:00',34,4),
(33,'2025-08-15 19:00:00','2025-08-15 20:00:00',41,3),
(34,'2025-08-15 20:30:00','2025-08-15 21:30:00',20,3),
(35,'2025-08-15 22:00:00','2025-08-15 23:30:00',21,3),
(36,'2025-08-16 00:00:00','2025-08-16 01:15:00',4,3),
(37,'2025-08-16 19:00:00','2025-08-16 20:15:00',29,1),
(38,'2025-08-16 21:00:00','2025-08-16 22:30:00',28,1),
(39,'2025-08-16 23:30:00','2025-08-17 01:30:00',26,1),
(40,'2025-08-16 19:30:00','2025-08-16 20:30:00',31,4),
(41,'2025-08-16 21:00:00','2025-08-16 22:15:00',16,4),
(42,'2025-08-16 23:00:00','2025-08-17 00:30:00',25,4),
(43,'2025-08-16 20:00:00','2025-08-16 21:00:00',48,2),
(44,'2025-08-16 21:30:00','2025-08-16 22:30:00',45,2),
(45,'2025-08-16 23:00:00','2025-08-17 00:15:00',2,2),
(46,'2025-08-17 01:00:00','2025-08-17 02:15:00',27,2),
(47,'2025-08-16 17:00:00','2025-08-16 18:00:00',36,3),
(48,'2025-08-16 18:00:00','2025-08-16 19:00:00',33,3),
(49,'2025-08-16 19:00:00','2025-08-16 20:00:00',22,3),
(50,'2025-08-16 20:30:00','2025-08-16 21:30:00',37,3),
(51,'2025-08-16 22:00:00','2025-08-16 23:15:00',38,3),
(52,'2025-08-16 23:45:00','2025-08-17 01:00:00',17,3),
(53,'2025-08-17 01:30:00','2025-08-17 02:30:00',39,3);
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `roles` VALUES
(1,'ADMIN'),
(2,'MANAGER'),
(3,'USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sponsor_stage`
--

DROP TABLE IF EXISTS `sponsor_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor_stage` (
  `sponsor_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sponsor_id`,`stage_id`),
  KEY `stage_id` (`stage_id`),
  CONSTRAINT `1` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`id`),
  CONSTRAINT `2` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor_stage`
--

LOCK TABLES `sponsor_stage` WRITE;
/*!40000 ALTER TABLE `sponsor_stage` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sponsor_stage` VALUES
(1,1),
(4,1),
(2,2),
(6,2),
(8,3),
(3,4);
/*!40000 ALTER TABLE `sponsor_stage` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contribution` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sponsors` VALUES
(1,'Cruzcampo','+34 954 979 000','sponsorship@heinekenespana.es',60000.00,NULL),
(2,'Thomann Music','+49 9546 9223','export@thomann.de',25000.00,NULL),
(3,'EMP Mailorder','+34 911 875 528','marketing@emp-online.es',20000.00,NULL),
(4,'Monster Energy','+1 800 426 737','info@monsterenergy.com',45000.00,NULL),
(5,'Jägermeister','+49 5331 810','espana@jaegermeister.de',30000.00,NULL),
(6,'Marshall Amplification','+44 1908 375411','sponsorship@marshall.com',15000.00,NULL),
(7,'Jack Daniels','+1 888 551 5225','events@jackdaniels.com',28000.00,NULL),
(8,'Estrella Galicia','+34 981 901 906','patrocinios@estrellagalicia.es',35000.00,NULL),
(9,'Vans España','+34 932 203 100','marketing@vans.es',18000.00,NULL),
(10,'Fnac España','+34 902 100 632','comunicacion@fnac.es',12000.00,NULL);
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `stages`
--

DROP TABLE IF EXISTS `stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `capacity` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stages`
--

LOCK TABLES `stages` WRITE;
/*!40000 ALTER TABLE `stages` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `stages` VALUES
(1,'Asgard del Sur',15000),
(2,'Fenrir del Al-Ándalus',8000),
(3,'Drakkar de Guadalquivir',5000),
(4,'Valhalla de Triana',10000);
/*!40000 ALTER TABLE `stages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ticket_types`
--

DROP TABLE IF EXISTS `ticket_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_total` int(11) NOT NULL,
  `stock_available` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_types`
--

LOCK TABLES `ticket_types` WRITE;
/*!40000 ALTER TABLE `ticket_types` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ticket_types` VALUES
(1,'Senda del Guerrero (Abono General)',95.00,5000,5000),
(2,'Banquete en el Valhalla (Experiencia VIP)',250.00,200,200),
(3,'Miércoles - Entrada de Día',45.00,1000,1000),
(4,'Jueves - Entrada de Día',45.00,1000,1000),
(5,'Viernes - Entrada de Día',55.00,1000,1000),
(6,'Sábado - Entrada de Día',60.00,1000,1000);
/*!40000 ALTER TABLE `ticket_types` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `document_type` enum('DNI','NIE','PASSPORT') NOT NULL,
  `document_number` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','USED','CANCELLED') DEFAULT 'ACTIVE',
  `ticket_type_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qr_code` (`qr_code`),
  KEY `ticket_type_id` (`ticket_type_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `1` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_types` (`id`),
  CONSTRAINT `2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `user_role` VALUES
(1,1),
(2,2),
(3,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `phone` varchar(30) NOT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,'garik@email.com','$2a$12$8LssFTKG6GY.pl7Xd.K8DOHFHWwUUm1wOzQ5L4LT9uoIB2XbXYw9a',1,'Garik','Asatryan','1996-12-30','666666666','2026-01-10 16:36:38'),
(2,'paula@email.com','$2a$12$jKTxYa0fSqWzb2UrhHxR8uDn5/ArJrh4VQ1zNxJHCU7.LsZmEUE/.',1,'Paula','Martín','1995-08-24','777777777','2026-01-10 16:36:38'),
(3,'nacho@email.com','$2a$12$hE8vq6Ng0aKvV60dpP8gRecFR5fT5G7mTjP61ZnnjIOAa2n0mbDjC',1,'Nacho','Muñoz','1996-01-27','676767676','2026-01-10 16:36:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `verification_tokens`
--

DROP TABLE IF EXISTS `verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_tokens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `expiry_date` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `fk_token_user` (`user_id`),
  CONSTRAINT `fk_token_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_tokens`
--

LOCK TABLES `verification_tokens` WRITE;
/*!40000 ALTER TABLE `verification_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-01-10 18:23:01

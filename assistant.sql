/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : assistant

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 08/03/2022 00:10:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '$2a$10$4fyd55zuLSi/pw4LaoFHxe9H.MEZzQ/Elz/jnNGi9/fcsVz2JQb6i', NULL);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nodeId` int NULL DEFAULT NULL,
  PRIMARY KEY (`department`) USING BTREE,
  INDEX `nodeId`(`nodeId`) USING BTREE,
  CONSTRAINT `nodeId` FOREIGN KEY (`nodeId`) REFERENCES `mapnode` (`nodeId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '科室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('department01', 1);
INSERT INTO `department` VALUES ('department02', 1);
INSERT INTO `department` VALUES ('department03', 1);

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `phone` int NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `doc-department`(`department`) USING BTREE,
  CONSTRAINT `doc-department` FOREIGN KEY (`department`) REFERENCES `department` (`department`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('doctor1', '$2a$10$.l.cYE4GvdvhQEwQ6aK6EeO7ldwE3TIKTbtGzt.kWBqalduvoyk/6', 'doctor1', 'department03', 'm', 1, 1);
INSERT INTO `doctor` VALUES ('doctor10', '$2a$10$k.5w/HhbUOB0SEEVWbJZKuL96H4mv54/L6/FO2zA8R2KPUwM..kre', 'doctor10', 'department03', 'm', 10, 10);
INSERT INTO `doctor` VALUES ('doctor11', '$2a$10$inJ6EvezvxE6Z2HDIHopset5mpPAErqi/Gy87RzzXFQf7Cp9NyfOq', 'doctor11', 'department02', 'm', 11, 11);
INSERT INTO `doctor` VALUES ('doctor12', '$2a$10$xfnYtwd77rGomCxSF.KiqOCuAUdkCAXsCOjFuWfCGu535qDqjKiM.', 'doctor12', 'department02', 'm', 12, 12);
INSERT INTO `doctor` VALUES ('doctor13', '$2a$10$za0gHSAy9tk58XDnpmOwueTGfOZbgzgGIXaNg5VONOfY8XRPlKF36', 'doctor13', 'department01', 'm', 13, 13);
INSERT INTO `doctor` VALUES ('doctor14', '$2a$10$bYadXo.x1X5HPPEBCGSQzeXJAj8SFapShS3VGBCJ32T71FO0hI806', 'doctor14', 'department02', 'm', 14, 14);
INSERT INTO `doctor` VALUES ('doctor15', '$2a$10$I1tmcldabZxUFf0qPsczIuwAbjoubypRfiQLd29IIclRkV0kkr81.', 'doctor15', 'department03', 'm', 15, 15);
INSERT INTO `doctor` VALUES ('doctor16', '$2a$10$QyZfni8WxP7M0ik2pY.Jzu20CF8YM6X3FnMGp2kAdDNgNWOWRpGX.', 'doctor16', 'department03', 'm', 16, 16);
INSERT INTO `doctor` VALUES ('doctor17', '$2a$10$/F0Zs38yFT62inwQ6.3VSOk/rUeG3XAxSf1UkCCFkln.wnXR.LP8a', 'doctor17', 'department01', 'm', 17, 17);
INSERT INTO `doctor` VALUES ('doctor18', '$2a$10$3wj/HOi29Av0YHXOG6MGqecfI1kiFFnvzE1B97PtLwxNm7BlexPnG', 'doctor18', 'department02', 'm', 18, 18);
INSERT INTO `doctor` VALUES ('doctor19', '$2a$10$Gg0/wXPMH5paIAistIhze.BB3SpWfuMyS/yfXxlNVJcfto27qdX7m', 'doctor19', 'department01', 'm', 19, 19);
INSERT INTO `doctor` VALUES ('doctor2', '$2a$10$qbabPymXjV9.ejbJJXgRSuZ5nfGgqqe64jY0ER6jJCbv/zxblQIE6', 'doctor2', 'department01', 'm', 2, 2);
INSERT INTO `doctor` VALUES ('doctor20', '$2a$10$PU17R0R5zEZjed.wENLrxOu3fLbkjIkHj35/3uKHP3/DrubWVaWja', 'doctor20', 'department03', 'm', 20, 20);
INSERT INTO `doctor` VALUES ('doctor21', '$2a$10$rAsZ4Yu.DNlhRunu/1uDYeHHzbQyb4XJddQ2l4p0veSadxRaSX/ZW', 'doctor21', 'department03', 'm', 21, 21);
INSERT INTO `doctor` VALUES ('doctor22', '$2a$10$nRBCi.JPUNS.Di7GJ3xcYOPDxDJHimY7d.WXz4KNNZvY2a/rTBOQe', 'doctor22', 'department03', 'm', 22, 22);
INSERT INTO `doctor` VALUES ('doctor23', '$2a$10$8stFNMNNUFDuGo5nLIGDuuE4mJd3XeAYPHAHl/etf5gjJedsoVE3S', 'doctor23', 'department02', 'm', 23, 23);
INSERT INTO `doctor` VALUES ('doctor24', '$2a$10$EF0kyt1Cy7cbd.W9qDJmT.J.uO8xeMPBKp6zY2eRLNH5Ycpll/VvS', 'doctor24', 'department02', 'm', 24, 24);
INSERT INTO `doctor` VALUES ('doctor25', '$2a$10$UrRMkGXdEy1e2UhAFmy/.OYObBtrZKti163qwdr65.cCdmQ986sNO', 'doctor25', 'department01', 'm', 25, 25);
INSERT INTO `doctor` VALUES ('doctor26', '$2a$10$LakSvvik6kp650HCavxX2u9JUN5L.tXWNeuemD.0/ZNnK.XxANp5m', 'doctor26', 'department01', 'm', 26, 26);
INSERT INTO `doctor` VALUES ('doctor27', '$2a$10$89PEcSLxMX3YvqzbLsLJeOpqGFuRbmJdyxiXQGkjown36hnQzieAq', 'doctor27', 'department03', 'm', 27, 27);
INSERT INTO `doctor` VALUES ('doctor28', '$2a$10$lWIJnL4tXxYECu/XzM7OwObeB13EaNr29auFgul8xxOTSxffxWIJy', 'doctor28', 'department03', 'm', 28, 28);
INSERT INTO `doctor` VALUES ('doctor29', '$2a$10$hjMFjUqn7HKzIpEd38.c2O2W7MmRE9X73/jOyFXW32lmSR6G06tdW', 'doctor29', 'department03', 'm', 29, 29);
INSERT INTO `doctor` VALUES ('doctor3', '$2a$10$Zt7ac8ad1BIIaZ6mUbvpi.ZVbbCVuC97o6N6ahkj55SlhgE8pHa6q', 'doctor3', 'department02', 'm', 3, 3);
INSERT INTO `doctor` VALUES ('doctor30', '$2a$10$IRcLO/XxPGRtOve6tDCb2OOdbG0lPTASUhFBp/awiLUyS1CXg8Y6q', 'doctor30', 'department01', 'm', 30, 30);
INSERT INTO `doctor` VALUES ('doctor31', '$2a$10$Mclk.zsxSaEttJztZn.zneMul.hPdHsp7vmU3UfxcTPwOQFose8DC', 'doctor31', 'department02', 'm', 31, 31);
INSERT INTO `doctor` VALUES ('doctor32', '$2a$10$eCufhM5NVVgkpRpdBw0RJuom.tMKSPcw6jyyVIdUIbk75XIhEZL.6', 'doctor32', 'department03', 'm', 32, 32);
INSERT INTO `doctor` VALUES ('doctor33', '$2a$10$gkgimBldGwBZcVGi0zLke.YD6BR7rCUvPWbJH/VpvG7gnY/.xbsbK', 'doctor33', 'department03', 'm', 33, 33);
INSERT INTO `doctor` VALUES ('doctor34', '$2a$10$.ax8XC.wqM7C0iUwfNNg8ef0u9AMu/PjVmyey7dKDOzNnJVsaHPvi', 'doctor34', 'department01', 'm', 34, 34);
INSERT INTO `doctor` VALUES ('doctor35', '$2a$10$eiNZcMNOFwdzX1fIto/.g.YtDuJaBzdoy7yGqxoZGdm/SPhjNt.Gu', 'doctor35', 'department03', 'm', 35, 35);
INSERT INTO `doctor` VALUES ('doctor36', '$2a$10$0qxuK4bLHxv33oSsemklOOyj353Hr7SAOUWIoQA6al6dBJTGHmaU.', 'doctor36', 'department01', 'm', 36, 36);
INSERT INTO `doctor` VALUES ('doctor37', '$2a$10$XuD5woNuFoL1f9NgtpIEDexV4smgPvtkoemgE9QfGgL8nYUwubT6q', 'doctor37', 'department01', 'm', 37, 37);
INSERT INTO `doctor` VALUES ('doctor38', '$2a$10$HQcltqX5dqpPwg4Y/22MYOKR20WSFuaXSI/Kkiu/iw9a2NzyzR9k.', 'doctor38', 'department01', 'm', 38, 38);
INSERT INTO `doctor` VALUES ('doctor39', '$2a$10$g0ODb9WkFzoNIk6JY5yn/uHKkG9JVOLuYEjTNj6HrrfolnH6eYYXC', 'doctor39', 'department01', 'm', 39, 39);
INSERT INTO `doctor` VALUES ('doctor4', '$2a$10$xb6jeEkP3eN.dUtDh1rY9uA90/WfSgFGZY/eBzd.lVLpBeP7DGjZW', 'doctor4', 'department01', 'm', 4, 4);
INSERT INTO `doctor` VALUES ('doctor40', '$2a$10$0uNTuM18D9g13EVhLcE7mOYQfVdZyqCjVjMvGnginsN/2aEvhxPtu', 'doctor40', 'department02', 'm', 40, 40);
INSERT INTO `doctor` VALUES ('doctor41', '$2a$10$uwoEwvxYO215h9psoFfiyuelGoylZfZPMTffky/BfZbYfRqXBxWWW', 'doctor41', 'department02', 'm', 41, 41);
INSERT INTO `doctor` VALUES ('doctor42', '$2a$10$B09dYDBQK0NlRyRS5KukAuQ9d1wc.RqfjZDH5wVp8RfOARy3HaYRe', 'doctor42', 'department03', 'm', 42, 42);
INSERT INTO `doctor` VALUES ('doctor43', '$2a$10$2apIUh9sH6aPQ/g8k.8phuhNmh3ERyjHvURLHTdChdMb6aC4/eJ8a', 'doctor43', 'department03', 'm', 43, 43);
INSERT INTO `doctor` VALUES ('doctor44', '$2a$10$4frbcKIREa4XudYl9/0Zlu0SFBrPicfvoARmGueib6bUhxryDV0YC', 'doctor44', 'department03', 'm', 44, 44);
INSERT INTO `doctor` VALUES ('doctor45', '$2a$10$lt5Vmdj8SKYaW2RvTzTG6.5awYAYIuTnpqi5hBKk0X257fIgi1LQu', 'doctor45', 'department02', 'm', 45, 45);
INSERT INTO `doctor` VALUES ('doctor46', '$2a$10$Zme0oWhWIUnwLkswsSeKqOm/l7g420sjRQot9iJt2n9CPwv.7t05i', 'doctor46', 'department02', 'm', 46, 46);
INSERT INTO `doctor` VALUES ('doctor47', '$2a$10$5SNrKbxem63emC/sOxMj8unwxZBMYsIXLA44ToLcG3VKjkwDS3y6a', 'doctor47', 'department03', 'm', 47, 47);
INSERT INTO `doctor` VALUES ('doctor48', '$2a$10$Hr9EYbiJL5hDnOpHH7RVOeRvBTPX2Yr4h6Km8HLDNXtDT8u6F2AvK', 'doctor48', 'department02', 'm', 48, 48);
INSERT INTO `doctor` VALUES ('doctor49', '$2a$10$M6AudZrTH7PMGuluD45JGeASedacJC0GbK5OGiyF3Kb1n9Hk6lh2O', 'doctor49', 'department01', 'm', 49, 49);
INSERT INTO `doctor` VALUES ('doctor5', '$2a$10$Gih7OyapV1TyA7akXzWTG.gaIA1ssDcBQg.O.05SJLjXw3uHhZnsS', 'doctor5', 'department02', 'm', 5, 5);
INSERT INTO `doctor` VALUES ('doctor50', '$2a$10$uWrCIJo1qAJ3APLRCDScF.F.za3fpftKeRBVOuRJUglxQZHAhhjVW', 'doctor50', 'department01', 'm', 50, 50);
INSERT INTO `doctor` VALUES ('doctor51', '$2a$10$bUtXcD.LjqsXMoMuXy3j/ueY0UAlWib48XzwzXNltGB8r7ruetROu', 'doctor51', 'department02', 'm', 51, 51);
INSERT INTO `doctor` VALUES ('doctor52', '$2a$10$GupycFpl2S.HFP21vgkwNOM3UsHx9De6DrmEf9vkSHtScefRDizXC', 'doctor52', 'department02', 'm', 52, 52);
INSERT INTO `doctor` VALUES ('doctor53', '$2a$10$PmbeqM0RuI0p1nGfMyw4LO3R7CRmQUYBNpnaGz3uHHouJMWWt2CNC', 'doctor53', 'department01', 'm', 53, 53);
INSERT INTO `doctor` VALUES ('doctor54', '$2a$10$MIA58uHdsQWNzHdQ7oXIdOdU/M0rDN2vbimnwPlNuaFXepOzu4s/.', 'doctor54', 'department01', 'm', 54, 54);
INSERT INTO `doctor` VALUES ('doctor55', '$2a$10$2SFIx7in6Ioj2z3igPz1Q.eul2kC0shmB7LwXeFS5SXg1ie1CJ2O6', 'doctor55', 'department01', 'm', 55, 55);
INSERT INTO `doctor` VALUES ('doctor56', '$2a$10$nDJRTy8A4OuBSYYELrCw.eYdLN0K.gIoG89MEkcZtBc0GaXlAaExO', 'doctor56', 'department01', 'm', 56, 56);
INSERT INTO `doctor` VALUES ('doctor57', '$2a$10$H43QGK8jKJTjr7Cl0dsz6e0zGGxKJWmValCOmj6MvNRhgFjo/7bJy', 'doctor57', 'department03', 'm', 57, 57);
INSERT INTO `doctor` VALUES ('doctor58', '$2a$10$I33hmCnrRj.8urcBW.BT4.bi8iVUerdJF6B/58h8GbkLc1wLZFcvm', 'doctor58', 'department01', 'm', 58, 58);
INSERT INTO `doctor` VALUES ('doctor59', '$2a$10$4VTfLRTzUuwGE160YwqIUe6tb3kfDcVUfIgMplxDIkX3zsZTenp5u', 'doctor59', 'department01', 'm', 59, 59);
INSERT INTO `doctor` VALUES ('doctor6', '$2a$10$.LoT0IGWiYqeDfcNOOYfXe/n24GJzaLbTYUP.PTmb78hRQs2ukxDC', 'doctor6', 'department03', 'm', 6, 6);
INSERT INTO `doctor` VALUES ('doctor60', '$2a$10$GEQySy4rD/SOKnGbjqY8CuaauLxS0kOVhecCWZDnqGK5I87LXE5Ry', 'doctor60', 'department01', 'm', 60, 60);
INSERT INTO `doctor` VALUES ('doctor61', '$2a$10$69FJVK75J3FId0Y2YRoF2uwJF8OL1cEA1G.3j3S1ykI3kt..fUfMS', 'doctor61', 'department02', 'm', 61, 61);
INSERT INTO `doctor` VALUES ('doctor62', '$2a$10$.rAxXsCKRBZwrR3sTJV7Vup5rBiofFTAwUS58c17QjHsnUx2KCZ9i', 'doctor62', 'department01', 'm', 62, 62);
INSERT INTO `doctor` VALUES ('doctor63', '$2a$10$Sx3BI3T1pwOUHMHHfNGDnuldDlGUrPlAKEIwL6Vp7b74GBUf3rQWO', 'doctor63', 'department02', 'm', 63, 63);
INSERT INTO `doctor` VALUES ('doctor64', '$2a$10$7tSsZh6RpZu/w79Z/dCgTO4mCJW7S5pUELg9ebEjoOaPo/UqgCfMy', 'doctor64', 'department02', 'm', 64, 64);
INSERT INTO `doctor` VALUES ('doctor65', '$2a$10$ywO8v3c2iSi4cfxC4LlmYOWnnHZDN7aMR1qMhAi/z0D8QNu05HgJO', 'doctor65', 'department02', 'm', 65, 65);
INSERT INTO `doctor` VALUES ('doctor66', '$2a$10$eO5r6g/8JBKWJ4c3RH4hAuXozlmQyBsykTqqWTI0t233aeM/JJYyG', 'doctor66', 'department03', 'm', 66, 66);
INSERT INTO `doctor` VALUES ('doctor67', '$2a$10$Ozc0KGFcvgfzMYvbNTMdBeVcQ07nl1C0Uw2LgfnkhBTYizh.UuPR.', 'doctor67', 'department02', 'm', 67, 67);
INSERT INTO `doctor` VALUES ('doctor68', '$2a$10$MIuxVGCQBZ4/KXq500s2.O1rsbyxqp4uyDHZIk6jf5JNouvxob4QW', 'doctor68', 'department01', 'm', 68, 68);
INSERT INTO `doctor` VALUES ('doctor69', '$2a$10$ZBWqIrODVP0TABUyFJ8/HuVkovSjHlgfrZuGOiKzXwp3FkmySrXG2', 'doctor69', 'department02', 'm', 69, 69);
INSERT INTO `doctor` VALUES ('doctor7', '$2a$10$/3xt8VepNoJ3pBB249jHG.ZdLcNceO7HmMTcMJFVEqb7VNH8s9jri', 'doctor7', 'department01', 'm', 7, 7);
INSERT INTO `doctor` VALUES ('doctor70', '$2a$10$WMskRLXpdt3SQZtulzvx2u4JtkaV0xngnUksywm9CppFD5p2pHKaS', 'doctor70', 'department03', 'm', 70, 70);
INSERT INTO `doctor` VALUES ('doctor71', '$2a$10$6x1dfwHaUNpBT0J2nc3FzuD9S06Ib3sQrGYMmbqSSAWzOYYIKEeu2', 'doctor71', 'department01', 'm', 71, 71);
INSERT INTO `doctor` VALUES ('doctor72', '$2a$10$XzPtii50l6lSNNeDzOz9CeQaaN5NkK4rg3.snrnE0mN45Cn73XYcK', 'doctor72', 'department03', 'm', 72, 72);
INSERT INTO `doctor` VALUES ('doctor73', '$2a$10$dsJbIH0cF.3g.VlHvwzzCOUW7faMGr1iF3fJwm2XfB4XxiNM1RVpm', 'doctor73', 'department01', 'm', 73, 73);
INSERT INTO `doctor` VALUES ('doctor74', '$2a$10$n6U0t6oSWbalJviErcs0mOykYRfHwCcWgc6VQiQNhOeosJdBKJEeS', 'doctor74', 'department02', 'm', 74, 74);
INSERT INTO `doctor` VALUES ('doctor75', '$2a$10$OmD1idRAiSuEOtGxv982..f0v8AbYfuS7hSPrpft98pjP2uVMtSQi', 'doctor75', 'department03', 'm', 75, 75);
INSERT INTO `doctor` VALUES ('doctor76', '$2a$10$gYjvvp4LZ2XDpN96VAGkIugi4ltkcs5O1lFYCouS/fchMAcgP2RLO', 'doctor76', 'department02', 'm', 76, 76);
INSERT INTO `doctor` VALUES ('doctor77', '$2a$10$nHgUdUabIQw.03V9iW6q2.BcCWx.JZ45Pl.Es.2eGolGkINWXZ6LC', 'doctor77', 'department02', 'm', 77, 77);
INSERT INTO `doctor` VALUES ('doctor78', '$2a$10$KxDiB8J4xiDAh/3HknO60O2mSA7R7t2sfmQA.pSyQ4SU/Ouxu0WcC', 'doctor78', 'department01', 'm', 78, 78);
INSERT INTO `doctor` VALUES ('doctor79', '$2a$10$G6dHGDZsL5M/amwsbDPnWONBuQg4EfNWmdlPEeepOH8UYymVd0G5q', 'doctor79', 'department03', 'm', 79, 79);
INSERT INTO `doctor` VALUES ('doctor8', '$2a$10$M.CPG4adT3wABziygDMvieSvSUxGufjut/5aFtZTe9SYVnGg4VZD.', 'doctor8', 'department03', 'm', 8, 8);
INSERT INTO `doctor` VALUES ('doctor80', '$2a$10$dGzYwELzTgpC0Zk1FRtJFePRioBlfYfAd/.tGylCg0Ce5w3b.Tmmi', 'doctor80', 'department03', 'm', 80, 80);
INSERT INTO `doctor` VALUES ('doctor81', '$2a$10$c5c8.dtOeni7YDOeUSVvP.nuuOBu6RQJvYX71RQycKjKDvamEaCk2', 'doctor81', 'department02', 'm', 81, 81);
INSERT INTO `doctor` VALUES ('doctor82', '$2a$10$0iyVtPXmMwyR/Eoax8dOxeL3g4VkKHagYA9JcqEq/F5vmxRj.KHi6', 'doctor82', 'department01', 'm', 82, 82);
INSERT INTO `doctor` VALUES ('doctor83', '$2a$10$UeUGM9T0nGqcaLVg7sFu.O7iqDqs0wdVYatLShFbwxpnzixPkZWui', 'doctor83', 'department02', 'm', 83, 83);
INSERT INTO `doctor` VALUES ('doctor84', '$2a$10$7cEw43gC5VmS6Uf0qO2m.e3no7DL7oxpghO8rEQr2d4y7oWk04LZq', 'doctor84', 'department02', 'm', 84, 84);
INSERT INTO `doctor` VALUES ('doctor85', '$2a$10$K.EIh5hKC.K5ITGz0kGezOYrGVcLdhtafB5WD0KJtnyxk42WM7uW.', 'doctor85', 'department01', 'm', 85, 85);
INSERT INTO `doctor` VALUES ('doctor86', '$2a$10$ZSZZLHuZrd3fThn0Qx3UeODmMWT91xJNHFKXUUVDFpWOYcKETbF7q', 'doctor86', 'department01', 'm', 86, 86);
INSERT INTO `doctor` VALUES ('doctor87', '$2a$10$WH0DnUr9jrkmALg8Za9dleIuvj/doFa934hyclzIs6TYeClqxPJ1u', 'doctor87', 'department01', 'm', 87, 87);
INSERT INTO `doctor` VALUES ('doctor88', '$2a$10$dyTnoWmJlkJwrgTCmgrIMeOrhlKUCCzLpZ87DQAHoVVsv1FRjorR.', 'doctor88', 'department03', 'm', 88, 88);
INSERT INTO `doctor` VALUES ('doctor89', '$2a$10$Y98sUM63Jrcj8POpsjgELu/C.sF/PCsmZ4hFAhKj0m0wZO2xRgBW2', 'doctor89', 'department01', 'm', 89, 89);
INSERT INTO `doctor` VALUES ('doctor9', '$2a$10$/mApZ2KwD7jMtle/nri1KO7YmJiDzCB4WLZ5KG7162IRZ6RbFGZE2', 'doctor9', 'department02', 'm', 9, 9);
INSERT INTO `doctor` VALUES ('doctor90', '$2a$10$ydhdwYCT8PxsvuBajL2lE.TGzdzT4LdWC5N1sl1VMRy9LsWje12Ca', 'doctor90', 'department03', 'm', 90, 90);
INSERT INTO `doctor` VALUES ('doctor91', '$2a$10$.6zFcDhOrA.3T9vMb5XuFeypjhP/Q9UNiouFpy3QvRgbIIa7NK9au', 'doctor91', 'department01', 'm', 91, 91);
INSERT INTO `doctor` VALUES ('doctor92', '$2a$10$j/Si4hdAYVkBTYtvRMA7pOrX4RbmWSk/gMhnyaCPldq91ww.SqEze', 'doctor92', 'department03', 'm', 92, 92);
INSERT INTO `doctor` VALUES ('doctor93', '$2a$10$m120MNV/l4yg4pBA4D80lesBnqzXvxNYPhdhD6XzwBzpVXKfceuhG', 'doctor93', 'department03', 'm', 93, 93);
INSERT INTO `doctor` VALUES ('doctor94', '$2a$10$AxAtWGCDh4Bs5/YitK3bX.FnO0zg9YflEqcJrbEuD6iIQJmJa3Hf2', 'doctor94', 'department03', 'm', 94, 94);
INSERT INTO `doctor` VALUES ('doctor95', '$2a$10$LogCQUpm6TV4HzF5fFtrzOcbE/.Qm6zaXXxnPOSFA5mB4WxGil25m', 'doctor95', 'department01', 'm', 95, 95);
INSERT INTO `doctor` VALUES ('doctor96', '$2a$10$AnAWdc9Co5.Hdp9fwbz1xO8/jOA0j5T7IGZ3PR6RLe5dvTOEnaUfi', 'doctor96', 'department01', 'm', 96, 96);
INSERT INTO `doctor` VALUES ('doctor97', '$2a$10$eRHjgKl.2JjrKw99h5WysuJ./TnwnBj6.gkOQz5uSQ3v/xRE0AwiW', 'doctor97', 'department03', 'm', 97, 97);
INSERT INTO `doctor` VALUES ('doctor98', '$2a$10$BsHit3durqlFMeycUSgqr.WLR7HhH19KY/eOEycy/87itoPw/4C02', 'doctor98', 'department01', 'm', 98, 98);
INSERT INTO `doctor` VALUES ('doctor99', '$2a$10$KcQM7J/tkHkN0IX3Bcz.LOw4FO40Fkofv26koq2Dm4.zW8QAT7.Sa', 'doctor99', 'department01', 'm', 99, 99);

-- ----------------------------
-- Table structure for mapnode
-- ----------------------------
DROP TABLE IF EXISTS `mapnode`;
CREATE TABLE `mapnode`  (
  `nodeId` int NOT NULL,
  `level` int NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  `nextNode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `span` int NOT NULL,
  `stairNode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `elevatorId` int NULL DEFAULT NULL,
  PRIMARY KEY (`nodeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mapnode
-- ----------------------------
INSERT INTO `mapnode` VALUES (1, 1, 1, 1, '1|2|3|4|5|', 0, '1|2|3|4|5|', 2);

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `exception` int NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('patient1', '$2a$10$3ZvjDVhwO4BYzu0oOyB9Cudtuj.scu3BYVpI0nmmN5Y3yriziFggy', 'patient1', 'm', 1, '1', 0);
INSERT INTO `patient` VALUES ('patient10', '$2a$10$Vwx.pCiuLZM9F4HhZttdEO4hk2HXfelBLUGb7m43HTZu80EDWvNH6', 'patient10', 'm', 10, '10', 0);
INSERT INTO `patient` VALUES ('patient11', '$2a$10$erHbq6YX4JllOOZTl9lEAO7yPqvFxjL2Y7VbPyctqDdmMr3/XcJRK', 'patient11', 'm', 11, '11', 0);
INSERT INTO `patient` VALUES ('patient12', '$2a$10$gVftRDC7ucTD451eumAWkuif89Ejnz7sdIUx0WkM4t7YsHTLFSRd2', 'patient12', 'm', 12, '12', 0);
INSERT INTO `patient` VALUES ('patient13', '$2a$10$Sl6b6YFwBWBVPPbn.0vvN.QTP/CEyf8cfz29aZFvimR8sQGNvvHNK', 'patient13', 'm', 13, '13', 0);
INSERT INTO `patient` VALUES ('patient14', '$2a$10$ne9wXX/uCLD4KeljnZgwi.NkOWSdjuPbAoSwI8TyL4eX5fMYaFBwm', 'patient14', 'm', 14, '14', 0);
INSERT INTO `patient` VALUES ('patient15', '$2a$10$TkBI6RQ2JFnbenP6helD/.aIrfv6xCGLmWyVMuewJ/6VoJwwjvSEG', 'patient15', 'm', 15, '15', 0);
INSERT INTO `patient` VALUES ('patient16', '$2a$10$FaUmwx3l5NV5o/bOCUFRCeeU5jMiGHZYLNjPbzLprBlwdhHbNOvfu', 'patient16', 'm', 16, '16', 0);
INSERT INTO `patient` VALUES ('patient17', '$2a$10$W8/BAZo3ySUJ0OYtynotz.VZcpO1Ity5EDoqttR0OPTO65atoJ.M.', 'patient17', 'm', 17, '17', 0);
INSERT INTO `patient` VALUES ('patient18', '$2a$10$UmZN9u5JhOwLPrYO8MKrjOinwl82wjkEYJ6riS4c8obTBU03BlzmS', 'patient18', 'm', 18, '18', 0);
INSERT INTO `patient` VALUES ('patient19', '$2a$10$mWDgoohYLOSkgmMZOFLX.eCIW6OcLEGKG5VGMIAmsUwy1P1S8Bp4G', 'patient19', 'm', 19, '19', 0);
INSERT INTO `patient` VALUES ('patient2', '$2a$10$7u1WdOITQyEvhZQn9/ICiOLkiWk/S/yiZHztfap0y9uWuFgNE5vU.', 'patient2', 'm', 2, '2', 0);
INSERT INTO `patient` VALUES ('patient20', '$2a$10$qBaWAYGZwaasvfayxiPYJebyzUFM0h/LDz/XMdBBWU9ldvqaowmuW', 'patient20', 'm', 20, '20', 0);
INSERT INTO `patient` VALUES ('patient21', '$2a$10$iOjrxAjc7a1K7.uic5Jr1e.Gn7cI06T73Re06w4yplrdLrey82Wf.', 'patient21', 'm', 21, '21', 0);
INSERT INTO `patient` VALUES ('patient22', '$2a$10$Flqu7.I2IUowCVaasiLCWOHORchSAUswdf3VhazwdjDI/qgLnFsz6', 'patient22', 'm', 22, '22', 0);
INSERT INTO `patient` VALUES ('patient23', '$2a$10$6UvxKl5l/V66ZSQoy0TzAeH8gCs9WrQd2.tkI1GHJBO0p7dcpKXge', 'patient23', 'm', 23, '23', 0);
INSERT INTO `patient` VALUES ('patient24', '$2a$10$rGy8lf9u8g6YPdlcKqwtAu9vlqlqeffjCpci/D0ZNGcJcP93OQE9u', 'patient24', 'm', 24, '24', 0);
INSERT INTO `patient` VALUES ('patient25', '$2a$10$PALjE.tLNWmtisJoM/QqjegTjgTeXdCUJXDmjVHq0RDOOUUW457VC', 'patient25', 'm', 25, '25', 0);
INSERT INTO `patient` VALUES ('patient26', '$2a$10$NOhOmOiDPPMHYi02fKcxuuJPbYTotkl/aQt6a8Ug8cLyoFL1dSOhy', 'patient26', 'm', 26, '26', 0);
INSERT INTO `patient` VALUES ('patient27', '$2a$10$HJQqhNQtwxbP/FwBQUV2eeiiFXB6w.cAPrd94NriiF1cEcVgr41sC', 'patient27', 'm', 27, '27', 0);
INSERT INTO `patient` VALUES ('patient28', '$2a$10$7lHcyEyytBQLrI1X/79CQOoGVibYQrmrowDWtgeq58XSdg1bg9fz2', 'patient28', 'm', 28, '28', 0);
INSERT INTO `patient` VALUES ('patient29', '$2a$10$ED5rWq15vzUank4p4qZ8EerBRbNO4MZTLfOBi3Qopn6n2OqnUCOH.', 'patient29', 'm', 29, '29', 0);
INSERT INTO `patient` VALUES ('patient3', '$2a$10$F91C1prj8iJR0Ipf8igHDOCViyEzQO/PBZyOJ2bL4YniYyEUyfq1G', 'patient3', 'm', 3, '3', 0);
INSERT INTO `patient` VALUES ('patient30', '$2a$10$xl62bagwzcQzrmXxld.Xou9S5mOnZXEG.AX9u7jhjHk1X2LTqrCa6', 'patient30', 'm', 30, '30', 0);
INSERT INTO `patient` VALUES ('patient31', '$2a$10$RRYOPxja8fLMgZJZ40jg.ONXaibZbCLWUq1QoHMjDr2myQxnrLl56', 'patient31', 'm', 31, '31', 0);
INSERT INTO `patient` VALUES ('patient32', '$2a$10$/6QIjBWEdFFG6b4IK6O2vuHZ2kWVs9jMbHIvA8OE8aGVUJgaq8vsi', 'patient32', 'm', 32, '32', 0);
INSERT INTO `patient` VALUES ('patient33', '$2a$10$Fjr9JDf5krutVnnVVtwAXuhABiowtOmCUd2wMnhm2OV70uIk8L7OW', 'patient33', 'm', 33, '33', 0);
INSERT INTO `patient` VALUES ('patient34', '$2a$10$IcK0ZysMw0VdQfoy7blWLOR5XzMjmvlZn2oqIGz5CMNrMQho4CfX2', 'patient34', 'm', 34, '34', 0);
INSERT INTO `patient` VALUES ('patient35', '$2a$10$yxGKeATY54d.ohOgetUKHu6dYxmQr74zdQN66..FUhUwNuGck.4ES', 'patient35', 'm', 35, '35', 0);
INSERT INTO `patient` VALUES ('patient36', '$2a$10$QszC.xeFsKhizg0u8E4nU.RjGtgVuCs/5D0BD/U79nd9SrkQ5PSw2', 'patient36', 'm', 36, '36', 0);
INSERT INTO `patient` VALUES ('patient37', '$2a$10$wNWJuDLfHwsL6Ir0kCIfeujy3fzEAWo51ttWyDOnGO1ewrQug7ZZy', 'patient37', 'm', 37, '37', 0);
INSERT INTO `patient` VALUES ('patient38', '$2a$10$1T0CQdMJjFywmtUyb5PY9Oo2bg6svl0ddKj26ek0XUklfsjz5sUMK', 'patient38', 'm', 38, '38', 0);
INSERT INTO `patient` VALUES ('patient39', '$2a$10$y996Fs.MaKY2GnM7dvngXekf6q1Ybhsaf.DYMGYyqmT9e6SN5JSvW', 'patient39', 'm', 39, '39', 0);
INSERT INTO `patient` VALUES ('patient4', '$2a$10$BgiJTkfFC1.lU5Gcts5woetdm0ouodL3klEluSmUKYMD619IPuW4a', 'patient4', 'm', 4, '4', 0);
INSERT INTO `patient` VALUES ('patient40', '$2a$10$gcDQrUC7Oe/w2tl2GuQ/AuMa5wPwLGPdPE6Mnmff0CYnogz2HM2ha', 'patient40', 'm', 40, '40', 0);
INSERT INTO `patient` VALUES ('patient41', '$2a$10$pkDLd7hYrKSiC.FZoV.KMe2a02icpLJwu5O4gDkeB1uty2rmCDhZC', 'patient41', 'm', 41, '41', 0);
INSERT INTO `patient` VALUES ('patient42', '$2a$10$UNpBcD8wSr/mRPadZU4yp.NpGh1qxjaootjm6wKdSAyVsiXnJkC6q', 'patient42', 'm', 42, '42', 0);
INSERT INTO `patient` VALUES ('patient43', '$2a$10$dNn7S49OL1EKwxybftYBDeqbPTUYR1976ImhWmOQva5Bv9o5CV8aG', 'patient43', 'm', 43, '43', 0);
INSERT INTO `patient` VALUES ('patient44', '$2a$10$2FstNXmChyOTCl.BwrTWCu2wgAsznmTpKWquhPkQDWeh7/j1Vpgbu', 'patient44', 'm', 44, '44', 0);
INSERT INTO `patient` VALUES ('patient45', '$2a$10$ZvLPlnwsnaw1S9pG3oO9KOFeL1E7PhUjSImfAv2S796F9onYOsIHi', 'patient45', 'm', 45, '45', 0);
INSERT INTO `patient` VALUES ('patient46', '$2a$10$zVAy84bsgUhjQTEyU1FrL.rIPAfYxQsC8ZTQ2fTHMl5fqREscxv5S', 'patient46', 'm', 46, '46', 0);
INSERT INTO `patient` VALUES ('patient47', '$2a$10$wLZGme7zx01Sa1DM46nREOwm9XlXYM4j8fwwfND2z1kg.19f.aoLu', 'patient47', 'm', 47, '47', 0);
INSERT INTO `patient` VALUES ('patient48', '$2a$10$5PuixuR6lIlPuEi/pxU0NOiVTzpQuLZo4PiiozUqzyTTm2yaAa0la', 'patient48', 'm', 48, '48', 0);
INSERT INTO `patient` VALUES ('patient49', '$2a$10$m.zC57dwgCzF86YEgX2CpO.0WH69VcDbJnPMKFVfuWHzZyfV4YWdm', 'patient49', 'm', 49, '49', 0);
INSERT INTO `patient` VALUES ('patient5', '$2a$10$OnaN19fJz3MyEMlNi3wYMO31lrqbpzs8wgqsm71LwP52bLVX1bb6q', 'patient5', 'm', 5, '5', 0);
INSERT INTO `patient` VALUES ('patient50', '$2a$10$zeLjJiYt.136odvT936PyO1hAZ5VVU4y3WNMeAXhEn8/wH5u40XDC', 'patient50', 'm', 50, '50', 0);
INSERT INTO `patient` VALUES ('patient51', '$2a$10$Q8vpmvtn1anuBruVqy981uTfMo1rMNREg192M9mF54l6mZzU9xEvG', 'patient51', 'm', 51, '51', 0);
INSERT INTO `patient` VALUES ('patient52', '$2a$10$ST0I7mLNax2dK1x7jkDWkOTO4F74OaiK7.dNjnawqKcmFXuK23VBm', 'patient52', 'm', 52, '52', 0);
INSERT INTO `patient` VALUES ('patient53', '$2a$10$QTgF2cbDqxkgMoYPwc.9BeLNiHZ/biwOJa7q6pyOxINu32oJm0bBG', 'patient53', 'm', 53, '53', 0);
INSERT INTO `patient` VALUES ('patient54', '$2a$10$I22Dx7Pe/o1O4y8rbfifPOtWexww3UOO.ixmqOe3votRN24yvkHlq', 'patient54', 'm', 54, '54', 0);
INSERT INTO `patient` VALUES ('patient55', '$2a$10$3AZpl7SKRfKHsgXkvmWlce55s18I57aNJB/TlbYFWroQQT7DMrYga', 'patient55', 'm', 55, '55', 0);
INSERT INTO `patient` VALUES ('patient56', '$2a$10$3TtE1X.07rGjVWzylIjHn.c/sRrGLinrw/xp6DwxLh/GdAjQwuije', 'patient56', 'm', 56, '56', 0);
INSERT INTO `patient` VALUES ('patient57', '$2a$10$86lncnx9EiSXNcXY1uRI2uX083hB/9HDMNuCdai8hC7q/TxKzh3me', 'patient57', 'm', 57, '57', 0);
INSERT INTO `patient` VALUES ('patient58', '$2a$10$qkzP4hLHhAg14Xc56Z6CmOLAFT9PPdSx9/XbF/VUU3ctIEG4Lg442', 'patient58', 'm', 58, '58', 0);
INSERT INTO `patient` VALUES ('patient59', '$2a$10$lhpy8nHAJP7xuFKbwGwqxOgtJCO2Oh.P.cCI7c.19EIwQ6fHFs4rS', 'patient59', 'm', 59, '59', 0);
INSERT INTO `patient` VALUES ('patient6', '$2a$10$hISaZth0pw5CJkpROlKEwust74QQCsipIS8kOOKot3ffkmyA84yRe', 'patient6', 'm', 6, '6', 0);
INSERT INTO `patient` VALUES ('patient60', '$2a$10$1Mx/Z/hYIOPM9XHEw2ymWuI5GkiIvY2rTv/QsU2kPGM5BQrNHCMwG', 'patient60', 'm', 60, '60', 0);
INSERT INTO `patient` VALUES ('patient61', '$2a$10$tUZd.KGA26WyUzamWpVhS.qGSLVru1044eE4PAM3fIUcHSEMiKnze', 'patient61', 'm', 61, '61', 0);
INSERT INTO `patient` VALUES ('patient62', '$2a$10$cwuYcISyf6WoCpJEQfPO7eaxyc2HQuhp/2plIQm/lHdyKJKIrC5tq', 'patient62', 'm', 62, '62', 0);
INSERT INTO `patient` VALUES ('patient63', '$2a$10$uiqKjACVGp8KUQGG8hnBVOQVePjnbh5.UnbRZYc9VQhPPi5tDludC', 'patient63', 'm', 63, '63', 0);
INSERT INTO `patient` VALUES ('patient64', '$2a$10$.o2KRHhpmAtFFonRDJRs4eaceZyOiRx/rsPMSyHb9isavPGCUWDvm', 'patient64', 'm', 64, '64', 0);
INSERT INTO `patient` VALUES ('patient65', '$2a$10$7o0LGoP84H8gIf9R93JdMuAyySup54V2rehSzQSnhvJkmavkR5r7y', 'patient65', 'm', 65, '65', 0);
INSERT INTO `patient` VALUES ('patient66', '$2a$10$pUIHeS5M9E4biGqumQjiT.TzGO/mE5hsyYhI1BhKRpuPHrE8Q1r3a', 'patient66', 'm', 66, '66', 0);
INSERT INTO `patient` VALUES ('patient67', '$2a$10$FeK8qDh7lBl9z/e.A8HAmuu1LbxC39iLkZqsijNSKlcEMw5ezGHjq', 'patient67', 'm', 67, '67', 0);
INSERT INTO `patient` VALUES ('patient68', '$2a$10$gclaGrK7dpZA4t26bypyI.Mz.AI12YJ6oxDSPQY34/d4fO7sPPRFi', 'patient68', 'm', 68, '68', 0);
INSERT INTO `patient` VALUES ('patient69', '$2a$10$aH.WHMatC25049i956bCCuYHln2x1LCdC0SnEVGOuYi9X0I/K4RGG', 'patient69', 'm', 69, '69', 0);
INSERT INTO `patient` VALUES ('patient7', '$2a$10$9Xsn7xT9qYAtOAmxpneQduggJrzkJJrG1Osxd8eF0/zWYu9Xzo4Cm', 'patient7', 'm', 7, '7', 0);
INSERT INTO `patient` VALUES ('patient70', '$2a$10$3MDbk/05VPOskk56jI3KEuU6lpT3UpH5fxrAThFAX5i6OaZyPFpOS', 'patient70', 'm', 70, '70', 0);
INSERT INTO `patient` VALUES ('patient71', '$2a$10$wUcr30nIRXYOkuOJE8kh9.M6KWNEQSgatiC55tbXSNg1ef1STEjLG', 'patient71', 'm', 71, '71', 0);
INSERT INTO `patient` VALUES ('patient72', '$2a$10$VmIbrf4aIg5w5csdqVQ.zOq9I/xk/Yy3JfOkpNDNBt2UegMZseoJ2', 'patient72', 'm', 72, '72', 0);
INSERT INTO `patient` VALUES ('patient73', '$2a$10$cXtTI.D8ohm18wv203dEt..ytUeFiGMCSRmWk3kgRxF0Cw33n0WW6', 'patient73', 'm', 73, '73', 0);
INSERT INTO `patient` VALUES ('patient74', '$2a$10$ojkUrZGgRlpSrMpUSEy9MuDzpS2sfpmd2QbKhjkMTbWl8vDetfftm', 'patient74', 'm', 74, '74', 0);
INSERT INTO `patient` VALUES ('patient75', '$2a$10$Di3clEqfIfC390hl0hTn4up3dD.YSkULuhVm9fUOuwQHekUdjV/wa', 'patient75', 'm', 75, '75', 0);
INSERT INTO `patient` VALUES ('patient76', '$2a$10$Ymm1Ywp8UNFkkAdF8LrO3.OiSVKJcWGA4.9DEoMLAns.QxvQIS6h.', 'patient76', 'm', 76, '76', 0);
INSERT INTO `patient` VALUES ('patient77', '$2a$10$i6yhhUtATYPzuwxweGd1Qu/LH.OJ9ReBgddGR1Q7lq9YOYWZeYW9G', 'patient77', 'm', 77, '77', 0);
INSERT INTO `patient` VALUES ('patient78', '$2a$10$zmizRT1UpB87KFlU6uBsIuREvALrodAds3k0jyqPQNQBk1PAF.X2i', 'patient78', 'm', 78, '78', 0);
INSERT INTO `patient` VALUES ('patient79', '$2a$10$dWekueCXxpVuKViO/u0PFu8RuspI6817WqHvbr/Eomq8O.ZmO9Y3m', 'patient79', 'm', 79, '79', 0);
INSERT INTO `patient` VALUES ('patient8', '$2a$10$JrM9VfqIH8Y/pjKLbpj8NunjrQRRyJPK1nd0y5aroGIV89tjnfb5K', 'patient8', 'm', 8, '8', 0);
INSERT INTO `patient` VALUES ('patient80', '$2a$10$X2Ji5dDp56t1SLLNrza0/uhMpomyRGgS1Q9bYLVh3G6Sv7jVbgQ8W', 'patient80', 'm', 80, '80', 0);
INSERT INTO `patient` VALUES ('patient81', '$2a$10$QhtCH9C5W5HNhGeVFiWL0uYYGoa80u.kgvEE0Pl6cZeuuKZxxJYPG', 'patient81', 'm', 81, '81', 0);
INSERT INTO `patient` VALUES ('patient82', '$2a$10$Xy7KsBQiCeiNE3obY7CvwewM/N73GnwNlUMhwsCHrFd/g2NWa5auG', 'patient82', 'm', 82, '82', 0);
INSERT INTO `patient` VALUES ('patient83', '$2a$10$tzs3cSGtlkFqa66CQVw46.1IO5lTZsk1eHoLSLKNzIFjp7HWIw1Aa', 'patient83', 'm', 83, '83', 0);
INSERT INTO `patient` VALUES ('patient84', '$2a$10$53ROwAA01v70EVUmIxmUbujoRWFGXmX3CQN0aR.pZ5qqNUd8iLZm6', 'patient84', 'm', 84, '84', 0);
INSERT INTO `patient` VALUES ('patient85', '$2a$10$08bTTOrhg0UVp47d26lkyuxyBX6qTGfEodc69foexL0bFIi3uyv3q', 'patient85', 'm', 85, '85', 0);
INSERT INTO `patient` VALUES ('patient86', '$2a$10$brkHZvZRMHusnL0E6Zd1POy7jReGR2OsDlo7oaVsLAQjP0DDh62S6', 'patient86', 'm', 86, '86', 0);
INSERT INTO `patient` VALUES ('patient87', '$2a$10$CeJ6U/AOLzr0BsaHkrx3CuWqMlUX25dWg58jaoQ./eKpw2RGh7Er6', 'patient87', 'm', 87, '87', 0);
INSERT INTO `patient` VALUES ('patient88', '$2a$10$EsBrnlwDvXz7FcXH9hgNBO9lWJ8h20FgnWOQRXBPh2IrGIV97P6lC', 'patient88', 'm', 88, '88', 0);
INSERT INTO `patient` VALUES ('patient89', '$2a$10$AOutJnohbyITqaHkoAFdV.GcD.0zDXNPV5eBJag3FMrurbe2vZhTW', 'patient89', 'm', 89, '89', 0);
INSERT INTO `patient` VALUES ('patient9', '$2a$10$XVg7LoPNVi7UW6IS9CaPr.9Jd5Eau2oMr8BqYb5/WL14OBFwsN/hm', 'patient9', 'm', 9, '9', 0);
INSERT INTO `patient` VALUES ('patient90', '$2a$10$xy6TPhWPf0X78DG1D2AeAusLaZn6nY5Y8pEjZsmVAGX537ijjUbN6', 'patient90', 'm', 90, '90', 0);
INSERT INTO `patient` VALUES ('patient91', '$2a$10$h6LFPsbj4u50nWipmPqTBOfcyFaWtbWwXvXMrqztz0Q/SpLjDQCQK', 'patient91', 'm', 91, '91', 0);
INSERT INTO `patient` VALUES ('patient92', '$2a$10$8ysxNfmiRXlcl8lbxlwjme9koO48hTQ4tUsoJGnUqy7SFfPm4dId.', 'patient92', 'm', 92, '92', 0);
INSERT INTO `patient` VALUES ('patient93', '$2a$10$yHuypIHBeS.CbZbNwZaVtuYsj2WJfe08ty6R8ZyzoEeXUQjtlKJ.C', 'patient93', 'm', 93, '93', 0);
INSERT INTO `patient` VALUES ('patient94', '$2a$10$qvnJ9dYvnlncC9pYbWON4u7YsQmdlW.Dr06tRKMrBcHQBAkB57Vai', 'patient94', 'm', 94, '94', 0);
INSERT INTO `patient` VALUES ('patient95', '$2a$10$XYAMMiD8r4LCFP4pZXg7UeD7sJA6tVtWYLv8QDZBi7ojeEjrjv5Pe', 'patient95', 'm', 95, '95', 0);
INSERT INTO `patient` VALUES ('patient96', '$2a$10$apU/LrpLmpfbxng8D5PaZeKeDSOXYfDQU/xLN66zdNHMKySjA./Em', 'patient96', 'm', 96, '96', 0);
INSERT INTO `patient` VALUES ('patient97', '$2a$10$tXcA4kw9x8mSqtCLk0Hg5O56hfYDtuaw9Jh7XC.CSOxq3DHdHZcwe', 'patient97', 'm', 97, '97', 0);
INSERT INTO `patient` VALUES ('patient98', '$2a$10$9cr5iEsjRtrbZGATVnTpUOwT/4wAgZx4E52m56RrOmeIXxwhuExbG', 'patient98', 'm', 98, '98', 0);
INSERT INTO `patient` VALUES ('patient99', '$2a$10$Be/BtfiMRYbvWIO1WNq6YufISzsnsXw05Yxr4kV8lV.EoMFb8042O', 'patient99', 'm', 99, '99', 0);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avetime` int NOT NULL COMMENT '检查所用的平均时间',
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `pro-department`(`department`) USING BTREE,
  CONSTRAINT `pro-department` FOREIGN KEY (`department`) REFERENCES `department` (`department`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '检查项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('project01', 'department01', 1);
INSERT INTO `project` VALUES ('project02', 'department02', 2);
INSERT INTO `project` VALUES ('project03', 'department03', 3);

SET FOREIGN_KEY_CHECKS = 1;
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

 Date: 13/05/2022 10:54:44
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
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `depaetment`(`department`) USING BTREE,
  CONSTRAINT `depaetment` FOREIGN KEY (`department`) REFERENCES `project` (`department`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('doctor01', '$2a$10$1NJ31v9TUiOjedLZN6WPjO0mczotvkaoM02KL/82dkCtKgQH4RXTO', 'doctor01', 'department09', 'm', 1, 1, NULL);
INSERT INTO `doctor` VALUES ('doctor02', '$2a$10$BgtjpqLkUc3cTeTKaCjkoONoyGwUc1dzKc8te5l138iCPjZ9x.cDq', 'doctor02', 'department09', 'm', 2, 2, NULL);
INSERT INTO `doctor` VALUES ('doctor03', '$2a$10$ZAFrGdBvIuh7tQdgzt/eAe5/cCDmgsYlJoxih/cesIY1ePzpEyBjG', 'doctor03', 'department04', 'm', 3, 3, NULL);
INSERT INTO `doctor` VALUES ('doctor04', '$2a$10$qV06bgCOLAPQICZx7RmKQOIe37i1fNsGYcU.gUQCgix2nmsBzLj8q', 'doctor04', 'department07', 'm', 4, 4, NULL);
INSERT INTO `doctor` VALUES ('doctor05', '$2a$10$nVQ5q6T2UfxFhLieqWkwguURUhA90yB6I6qYx89M61Ps1RC/p6nV2', 'doctor05', 'department03', 'm', 5, 5, NULL);
INSERT INTO `doctor` VALUES ('doctor06', '$2a$10$Ed0xo.5x6pEGYolMF9UMpOX2WyLxqluMUzAldBEy3YNrZZMrvFbQa', 'doctor06', 'department03', 'm', 6, 6, NULL);
INSERT INTO `doctor` VALUES ('doctor07', '$2a$10$ux46qMqZR353AXHpLJGwr.WDVOqrBj.XPCnLb9KChAjR5AgTfD6K2', 'doctor07', 'department09', 'm', 7, 7, NULL);
INSERT INTO `doctor` VALUES ('doctor08', '$2a$10$FVK81AbQA49mh.sOFOpTGuC/lWhpSEsQWXq2hRA8sUa.4hu6Z2x9i', 'doctor08', 'department08', 'm', 8, 8, NULL);
INSERT INTO `doctor` VALUES ('doctor09', '$2a$10$.wROCzwtFS2mdfMB/tfIq.6c6eqBpAl5ZPTIgQ/Xiv2LqrZD3.wyC', 'doctor09', 'department05', 'm', 9, 9, NULL);
INSERT INTO `doctor` VALUES ('doctor10', '$2a$10$4hM/B89jFFNXcK3qJZikWuB6kQvYM2ua2fSVNbubiO4UT1tKTs2I6', 'doctor10', 'department01', 'm', 10, 10, NULL);
INSERT INTO `doctor` VALUES ('doctor11', '$2a$10$M5x2EpejDruvvcZK5cpnJOJGdxoRXm8mAz9Wo.4WtcQrhpN9GNuYe', 'doctor11', 'department08', 'm', 11, 11, NULL);
INSERT INTO `doctor` VALUES ('doctor12', '$2a$10$ceIS2y49ivH19feAd3ji6eh1EJ7oLu3QbdDqnbJHshDRH3RUkXoB.', 'doctor12', 'department07', 'm', 12, 12, NULL);
INSERT INTO `doctor` VALUES ('doctor13', '$2a$10$xwFdER7CBDJdS7WL.Z4xSu2iGi.BQNoEp3AAuVcLHt9tEzqIGzIOO', 'doctor13', 'department03', 'm', 13, 13, NULL);
INSERT INTO `doctor` VALUES ('doctor14', '$2a$10$4YygZiteVY4zudHQxL1k/OgF4.bG97Oxf7A/rRvRipKQfRpykYZTW', 'doctor14', 'department05', 'm', 14, 14, NULL);
INSERT INTO `doctor` VALUES ('doctor15', '$2a$10$Ip8Ypt5ADQyWJxvBCYLe9uc9Zg46AKA0cbsGRsKmbYmmoDTYFxnQq', 'doctor15', 'department02', 'm', 15, 15, NULL);
INSERT INTO `doctor` VALUES ('doctor16', '$2a$10$Zx2z7tyal6DQoJBMafqga.YbJ4Q6pQsfESLJFk2ALrsawe8uqwTRi', 'doctor16', 'department01', 'm', 16, 16, NULL);
INSERT INTO `doctor` VALUES ('doctor17', '$2a$10$fqTR5duV6hEAQk5ZcTaFoOnwMKec/Yf3ZwR7chvuN8SRKQM30FTwG', 'doctor17', 'department04', 'm', 17, 17, NULL);
INSERT INTO `doctor` VALUES ('doctor18', '$2a$10$/q10fe2JRz38PZ/m61yN5uMuKeWqHQ5mB9UxXfDYtCS6z9dRAcuWK', 'doctor18', 'department04', 'm', 18, 18, NULL);
INSERT INTO `doctor` VALUES ('doctor19', '$2a$10$rqljHjU1ISudmSgsIr6GzuoUhADH8VKrlc1m6HkardH6FT5t0w3U6', 'doctor19', 'department09', 'm', 19, 19, NULL);
INSERT INTO `doctor` VALUES ('doctor20', '$2a$10$Mcy62717/E8X3R9/3RNfneAcEEv0yMlYgon.LfCsIl9IKdY9e3OE6', 'doctor20', 'department04', 'm', 20, 20, NULL);
INSERT INTO `doctor` VALUES ('doctor21', '$2a$10$r73/MOg5uTqn7gvhyGmeEOwrY6Gx0etw7gln0FyyUu9t.F1X6wzaC', 'doctor21', 'department02', 'm', 21, 21, NULL);
INSERT INTO `doctor` VALUES ('doctor22', '$2a$10$SRdPE/lYrqJYk6SRhIHO9ePIvZ.3z4KbMwNmZj/d.LtgipBRdzgTq', 'doctor22', 'department02', 'm', 22, 22, NULL);
INSERT INTO `doctor` VALUES ('doctor23', '$2a$10$4ZX5hx85E6xY5opOiAArHufQeUhDhez2sEl2RLNtWdSaOLMB5F.1a', 'doctor23', 'department06', 'm', 23, 23, NULL);
INSERT INTO `doctor` VALUES ('doctor24', '$2a$10$YUx1IkbKw9w2Kc77X4g9zeQEuxwar7.VoE6ABlUWfLntvB0xtW.eu', 'doctor24', 'department09', 'm', 24, 24, NULL);
INSERT INTO `doctor` VALUES ('doctor25', '$2a$10$Ih2/YRYBig7ODE19dtP0E.bMElEnAfy0mGlbHXutZclRrntRtus7K', 'doctor25', 'department02', 'm', 25, 25, NULL);
INSERT INTO `doctor` VALUES ('doctor26', '$2a$10$8sBTCBsZbdXLU8mvw04NUe9YxMBlOjzELohhc3zrs.XaX/xBH7yje', 'doctor26', 'department07', 'm', 26, 26, NULL);
INSERT INTO `doctor` VALUES ('doctor27', '$2a$10$9cPwO8ILLdB26eFXEmYwf.qIXITCRd1ntGwJjfHMYI3gZ.TO/2dGS', 'doctor27', 'department07', 'm', 27, 27, NULL);
INSERT INTO `doctor` VALUES ('doctor28', '$2a$10$6aVkxEr7RCsfISEOhP9L6OTHet0C.WlBRMym3YyGTSjei7a9lqm4y', 'doctor28', 'department03', 'm', 28, 28, NULL);
INSERT INTO `doctor` VALUES ('doctor29', '$2a$10$jsvpP7VgfV8totpP5AF2qO0qpd5cYyD1mVnMS9BWsXGKvET8un2Im', 'doctor29', 'department09', 'm', 29, 29, NULL);

-- ----------------------------
-- Table structure for mapnode
-- ----------------------------
DROP TABLE IF EXISTS `mapnode`;
CREATE TABLE `mapnode`  (
  `nodeId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nodeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `level` int NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  `nextNode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stairNode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `elevatorNode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `elevatorId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nodeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mapnode
-- ----------------------------
INSERT INTO `mapnode` VALUES ('10000', NULL, 1, 567, 598, '10010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10001', NULL, 1, 315, 230, '10014,10002,10015,10016', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10002', NULL, 1, 441, 230, '10001,10003,10017', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10003', NULL, 1, 567, 230, '10002,10004,10018', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10004', NULL, 1, 693, 230, '10003,10005,10019', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10005', NULL, 1, 819, 230, '10004,10006,10020,10021', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10006', NULL, 1, 819, 322, '10005,10007,10022', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10007', NULL, 1, 819, 414, '10006,10008,10023', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10008', NULL, 1, 819, 506, '10007,10009,10024,10025', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10009', NULL, 1, 693, 506, '10008,10010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10010', NULL, 1, 567, 506, '10009,10011,10000', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10011', NULL, 1, 441, 506, '10010,10012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10012', NULL, 1, 315, 506, '10011,10013,10029,10030', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10013', NULL, 1, 315, 414, '10012,10014,10031', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10014', NULL, 1, 315, 322, '10013,10001,10032', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10015', NULL, 1, 315, 138, '10001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10016', NULL, 1, 189, 230, '10001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10017', NULL, 1, 441, 138, '10002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10018', NULL, 1, 567, 138, '10003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10019', NULL, 1, 693, 138, '10004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10020', NULL, 1, 819, 138, '10005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10021', NULL, 1, 945, 230, '10005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10022', NULL, 1, 945, 322, '10006', NULL, '20022,30022', 'e1', NULL);
INSERT INTO `mapnode` VALUES ('10023', NULL, 1, 945, 414, '10007', '20023', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10024', NULL, 1, 819, 598, '10008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10025', NULL, 1, 945, 506, '10008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10029', NULL, 1, 315, 598, '10012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10030', NULL, 1, 189, 506, '10012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10031', NULL, 1, 189, 414, '10013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10032', NULL, 1, 189, 322, '10014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20001', NULL, 2, 315, 230, '20014,20002,20015,20016', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20002', NULL, 2, 441, 230, '20001,20003,20017', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20003', NULL, 2, 567, 230, '20002,20004,20018', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20004', NULL, 2, 693, 230, '20003,20005,20019', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20005', NULL, 2, 819, 230, '20004,20006,20020,20021', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20006', NULL, 2, 819, 322, '20005,20007,20022', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20007', NULL, 2, 819, 414, '20006,20008,20023', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20008', NULL, 2, 819, 506, '20007,20009,20024,20025', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20009', NULL, 2, 693, 506, '20008,20010,20026', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20010', NULL, 2, 567, 506, '20009,20011,20027', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20011', NULL, 2, 441, 506, '20010,20012,20028', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20012', NULL, 2, 315, 506, '20011,20013,20029,20030', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20013', NULL, 2, 315, 414, '20012,20014,20031', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20014', NULL, 2, 315, 322, '20013,20001,20032', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20015', NULL, 2, 315, 138, '20001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20016', NULL, 2, 189, 230, '20001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20017', NULL, 2, 441, 138, '20002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20018', NULL, 2, 567, 138, '20003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20019', NULL, 2, 693, 138, '20004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20020', NULL, 2, 819, 138, '20005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20021', NULL, 2, 945, 230, '20005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20022', NULL, 2, 945, 322, '20006', NULL, '10022,30022', 'e1', NULL);
INSERT INTO `mapnode` VALUES ('20023', NULL, 2, 945, 414, '20007', '10023,30023', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20024', NULL, 2, 819, 598, '20008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20025', NULL, 2, 945, 506, '20008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20026', NULL, 2, 693, 598, '20009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20027', NULL, 2, 567, 598, '20010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20028', NULL, 2, 441, 598, '20011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20029', NULL, 2, 315, 598, '20012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20030', NULL, 2, 189, 506, '20012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20031', NULL, 2, 189, 414, '20013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20032', NULL, 2, 189, 322, '20014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30001', NULL, 3, 315, 230, '30014,30002,30015,30016', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30002', NULL, 3, 441, 230, '30001,30003,30017', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30003', NULL, 3, 567, 230, '30002,30004,30018', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30004', NULL, 3, 693, 230, '30003,30005,30019', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30005', NULL, 3, 819, 230, '30004,30006,30020,30021', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30006', NULL, 3, 819, 322, '30005,30007,30022', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30007', NULL, 3, 819, 414, '30006,30008,30023', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30008', NULL, 3, 819, 506, '30007,30009,30024,30025', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30009', NULL, 3, 693, 506, '30008,30010,30026', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30010', NULL, 3, 567, 506, '30009,30011,30027', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30011', NULL, 3, 441, 506, '30010,30012,30028', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30012', NULL, 3, 315, 506, '30011,30013,30029,30030', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30013', NULL, 3, 315, 414, '30012,30014,30031', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30014', NULL, 3, 315, 322, '30013,30001,30032', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30015', NULL, 3, 315, 138, '30001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30016', NULL, 3, 189, 230, '30001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30017', NULL, 3, 441, 138, '30002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30018', NULL, 3, 567, 138, '30003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30019', NULL, 3, 693, 138, '30004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30020', NULL, 3, 819, 138, '30005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30021', NULL, 3, 945, 230, '30005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30022', NULL, 3, 945, 322, '30006', NULL, '10022,20022,', 'e1', NULL);
INSERT INTO `mapnode` VALUES ('30023', NULL, 3, 945, 414, '30007', '20023', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30024', NULL, 3, 819, 598, '30008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30025', NULL, 3, 945, 506, '30008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30026', NULL, 3, 693, 598, '30009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30027', NULL, 3, 567, 598, '30010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30028', NULL, 3, 441, 598, '30011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30029', NULL, 3, 315, 598, '30012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30030', NULL, 3, 189, 506, '30012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30031', NULL, 3, 189, 414, '30013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30032', NULL, 3, 189, 322, '30014', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `messageId` bigint NOT NULL AUTO_INCREMENT,
  `speakerUsername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `speakerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `speakerRole` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `datestr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`messageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------

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
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('patient01', '$2a$10$8cNAf9X1KjGvBdX1m2MyEOu97JU4DSvDRDzJ0WZqqdK3Y5.aEHhL2', 'patient01', 'm', 1, '1', 0, NULL);
INSERT INTO `patient` VALUES ('patient02', '$2a$10$Uteqa3.vOpFJZ9UxtQK.y./XrCx9Pe/e6VqqV/RcHClmnlIEh/ukC', 'patient02', 'm', 2, '2', 0, NULL);
INSERT INTO `patient` VALUES ('patient03', '$2a$10$MVc8vNa81Fw5eQDtPC6i8OWx8GXzYud4GvOjKLM29Y95eME/N9enu', 'patient03', 'f', 3, '3', 0, NULL);
INSERT INTO `patient` VALUES ('patient04', '$2a$10$/Xw4xIPee/vupBBEyw8oQemxYWPsREbm4wieVCG6dZoN7qbteKb5e', 'patient04', 'f', 4, '4', 0, NULL);
INSERT INTO `patient` VALUES ('patient05', '$2a$10$pt2GDtkARYjzYZENRbD26OFzyNO2PB0dbXWVp4DCTctHOIAHqtG6a', 'patient05', 'f', 5, '5', 0, NULL);
INSERT INTO `patient` VALUES ('patient06', '$2a$10$51B2gfOPghlonOmfuxqSZOorRDdRLL5FKJoxFC9z0P51uU6A7fPuy', 'patient06', 'm', 6, '6', 0, NULL);
INSERT INTO `patient` VALUES ('patient07', '$2a$10$rKL52vh93L8t7bP1s5OcROC1X8zYbA6yO8AW0C70dvYQ4QurZDtQW', 'patient07', 'm', 7, '7', 0, NULL);
INSERT INTO `patient` VALUES ('patient08', '$2a$10$Z0X383UUa1Khr5t8cFNwvO3ZzJ/ninv0Z2hDPJAviFAkkw8b09Y5K', 'patient08', 'f', 8, '8', 0, NULL);
INSERT INTO `patient` VALUES ('patient09', '$2a$10$cie4H5alN1NPbXx625jEteIIy73u5OQHRJcX4UlF.NTa.QFlixKGu', 'patient09', 'f', 9, '9', 0, NULL);
INSERT INTO `patient` VALUES ('patient10', '$2a$10$cQ48ivkW9uB5XN.ga0y7P.oi5POL7PTMfrQG9q979kN.VuZEOzP6.', 'patient10', 'f', 10, '10', 0, NULL);
INSERT INTO `patient` VALUES ('patient11', '$2a$10$G4Y0I.NRrD.3Ee5viG5hKOVSzoh22oyFz7lYPlmMbb1I6gvRL0TrO', 'patient11', 'm', 11, '11', 0, NULL);
INSERT INTO `patient` VALUES ('patient12', '$2a$10$K1AXEDtSxUHwVbNglkIa8uu5I30lvIHNEyI.nuRCOGGghXP9DqUTC', 'patient12', 'm', 12, '12', 0, NULL);
INSERT INTO `patient` VALUES ('patient13', '$2a$10$/IMmtWM3Kqw0a.nwFEiZm.hOffmmj5UUbyyZGTPVXlT1JpH0c8EA2', 'patient13', 'f', 13, '13', 0, NULL);
INSERT INTO `patient` VALUES ('patient14', '$2a$10$bF6ApLXK43rxts7RzgbKZ.0upZUkAuVX0tuRRu2.0449JtQJgpte6', 'patient14', 'f', 14, '14', 0, NULL);
INSERT INTO `patient` VALUES ('patient15', '$2a$10$7N.SjQ03c4H23XqtAtosjeGX4ndHyY7KXOobc3GBqV6VHyEVUgHri', 'patient15', 'f', 15, '15', 0, NULL);
INSERT INTO `patient` VALUES ('patient16', '$2a$10$wUEMKdOTr/CjNTQ/IpyhVu6JQHFyzInr.o4ph/v/IZGK7bkMNNByC', 'patient16', 'f', 16, '16', 0, NULL);
INSERT INTO `patient` VALUES ('patient17', '$2a$10$mMcHxe1Wn2t0o225uDORXube3Ctmh1mPjhA7nSlE6l5OVLiUWZTHi', 'patient17', 'm', 17, '17', 0, NULL);
INSERT INTO `patient` VALUES ('patient18', '$2a$10$k9rppe1FR8EAlCYuV63aKu/Yt.MJkQss/BW06tN8dfjVhjEMKE13m', 'patient18', 'f', 18, '18', 0, NULL);
INSERT INTO `patient` VALUES ('patient19', '$2a$10$8wrZkcLKxHrnApIo6mGeyu2FcccbEcEZFw./HtHFVE2xVYm/hrA8C', 'patient19', 'm', 19, '19', 0, NULL);
INSERT INTO `patient` VALUES ('patient20', '$2a$10$un9FhQi/gprTtQAcQonm2eVwR5NLy/00cBTBMaZSHcfw6gXT0KqL2', 'patient20', 'm', 20, '20', 0, NULL);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `aveTime` int NOT NULL,
  `nodeId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`project`, `department`) USING BTREE,
  INDEX `nodeId`(`nodeId`) USING BTREE,
  INDEX `department`(`department`) USING BTREE,
  INDEX `project`(`project`) USING BTREE,
  CONSTRAINT `nodeId` FOREIGN KEY (`nodeId`) REFERENCES `mapnode` (`nodeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '科室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('project10017', 'department01', 360000, '10017', NULL);
INSERT INTO `project` VALUES ('project10018', 'department01', 420000, '10018', NULL);
INSERT INTO `project` VALUES ('project10019', 'department01', 360000, '10019', NULL);
INSERT INTO `project` VALUES ('project10020', 'department05', 420000, '10020', NULL);
INSERT INTO `project` VALUES ('project10021', 'department01', 540000, '10021', NULL);
INSERT INTO `project` VALUES ('project10024', 'department07', 60000, '10024', NULL);
INSERT INTO `project` VALUES ('project10025', 'department07', 360000, '10025', NULL);
INSERT INTO `project` VALUES ('project10029', 'department02', 540000, '10029', NULL);
INSERT INTO `project` VALUES ('project10030', 'department01', 300000, '10030', NULL);
INSERT INTO `project` VALUES ('project10031', 'department03', 180000, '10031', NULL);
INSERT INTO `project` VALUES ('project10032', 'department03', 480000, '10032', NULL);
INSERT INTO `project` VALUES ('project20017', 'department05', 180000, '20017', NULL);
INSERT INTO `project` VALUES ('project20018', 'department04', 360000, '20018', NULL);
INSERT INTO `project` VALUES ('project20019', 'department06', 600000, '20019', NULL);
INSERT INTO `project` VALUES ('project20020', 'department03', 300000, '20020', NULL);
INSERT INTO `project` VALUES ('project20021', 'department05', 300000, '20021', NULL);
INSERT INTO `project` VALUES ('project20024', 'department06', 600000, '20024', NULL);
INSERT INTO `project` VALUES ('project20025', 'department08', 420000, '20025', NULL);
INSERT INTO `project` VALUES ('project20026', 'department02', 540000, '20026', NULL);
INSERT INTO `project` VALUES ('project20027', 'department06', 540000, '20027', NULL);
INSERT INTO `project` VALUES ('project20028', 'department08', 540000, '20028', NULL);
INSERT INTO `project` VALUES ('project20029', 'department02', 240000, '20029', NULL);
INSERT INTO `project` VALUES ('project20030', 'department01', 360000, '20030', NULL);
INSERT INTO `project` VALUES ('project20031', 'department03', 600000, '20031', NULL);
INSERT INTO `project` VALUES ('project20032', 'department01', 480000, '20032', NULL);
INSERT INTO `project` VALUES ('project30017', 'department08', 360000, '30017', NULL);
INSERT INTO `project` VALUES ('project30018', 'department05', 60000, '30018', NULL);
INSERT INTO `project` VALUES ('project30019', 'department09', 420000, '30019', NULL);
INSERT INTO `project` VALUES ('project30020', 'department03', 240000, '30020', NULL);
INSERT INTO `project` VALUES ('project30021', 'department07', 420000, '30021', NULL);
INSERT INTO `project` VALUES ('project30024', 'department01', 180000, '30024', NULL);
INSERT INTO `project` VALUES ('project30025', 'department08', 540000, '30025', NULL);
INSERT INTO `project` VALUES ('project30026', 'department02', 540000, '30026', NULL);
INSERT INTO `project` VALUES ('project30027', 'department02', 420000, '30027', NULL);
INSERT INTO `project` VALUES ('project30028', 'department05', 60000, '30028', NULL);
INSERT INTO `project` VALUES ('project30029', 'department07', 120000, '30029', NULL);
INSERT INTO `project` VALUES ('project30030', 'department05', 600000, '30030', NULL);
INSERT INTO `project` VALUES ('project30031', 'department03', 60000, '30031', NULL);
INSERT INTO `project` VALUES ('project30032', 'department01', 360000, '30032', NULL);

SET FOREIGN_KEY_CHECKS = 1;

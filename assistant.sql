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

 Date: 14/04/2022 03:49:04
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
INSERT INTO `doctor` VALUES ('doctor01', '$2a$10$5N6EkcuEynCfaE97CUmnFu3DmDcxDoF.Bv5Eq0JWXUkCtjNOoIzXO', 'doctor01', 'department04', 'm', 1, 1, NULL);
INSERT INTO `doctor` VALUES ('doctor02', '$2a$10$gLf1isP6WvOjtDleT6tZkOpHida/Lkrpl4y4eDZzXrQRoql8S3mJS', 'doctor02', 'department01', 'm', 2, 2, NULL);
INSERT INTO `doctor` VALUES ('doctor03', '$2a$10$0wXfYTGRHpNLfYg4Kw6TzejEuXCHexbOvQYrJ0JKECoqbYDuTNHmS', 'doctor03', 'department02', 'm', 3, 3, NULL);
INSERT INTO `doctor` VALUES ('doctor04', '$2a$10$DZUFEaSm.X57kr.9QSFxru/lBbZtxKbCjMH9gRgbv7unhLgIc5fsS', 'doctor04', 'department02', 'm', 4, 4, NULL);
INSERT INTO `doctor` VALUES ('doctor05', '$2a$10$uaTpoDpj9qGveACYwoTD3O.TNqCucqXO.R2LtLRzrchbe2W51K0hO', 'doctor05', 'department07', 'm', 5, 5, NULL);
INSERT INTO `doctor` VALUES ('doctor06', '$2a$10$h3jtMwcIQwVRWd41wL/p2epDplZR06OM9ilMRnWmO5sqR6ciRdFci', 'doctor06', 'department06', 'm', 6, 6, NULL);
INSERT INTO `doctor` VALUES ('doctor07', '$2a$10$UmSrF7Hta/eDoNshaTJL0eYrTzO72Xn7H9Hya71undeYcQ9SZECKu', 'doctor07', 'department02', 'm', 7, 7, NULL);
INSERT INTO `doctor` VALUES ('doctor08', '$2a$10$L.9QhnbrxkRZxcJi7k2WjOQijBytDp/T.g3LlILfYPqPpBNDcpqC6', 'doctor08', 'department03', 'm', 8, 8, NULL);
INSERT INTO `doctor` VALUES ('doctor09', '$2a$10$LZBVmG7f./Dikxje3/9CMeJMkUrdE4XsRGrUi4MXBsDPZ0NQMzolC', 'doctor09', 'department05', 'm', 9, 9, NULL);
INSERT INTO `doctor` VALUES ('doctor10', '$2a$10$TR5oqc6XlFhKoEh/rvKTzua2OqgEUtMq1dDH7pk8qlXdANzEYa6Om', 'doctor10', 'department02', 'm', 10, 10, NULL);
INSERT INTO `doctor` VALUES ('doctor11', '$2a$10$hXda2y8FiXozuqVwfvwLXebwNdT9iLtp8sGvuFSRRQjvCGrQ5BFUq', 'doctor11', 'department01', 'm', 11, 11, NULL);
INSERT INTO `doctor` VALUES ('doctor12', '$2a$10$90D5a72y254h1PXIBpuOg.lrPy/uettQ86OXd6SQmIiUbeSnOLL8.', 'doctor12', 'department06', 'm', 12, 12, NULL);
INSERT INTO `doctor` VALUES ('doctor13', '$2a$10$BDpxa.OSNb6PW3zTMTI.juvyBQ1rEDEHS5IlDNLDyEYQP2/5M5IZ2', 'doctor13', 'department03', 'm', 13, 13, NULL);
INSERT INTO `doctor` VALUES ('doctor14', '$2a$10$Iuz507ibzJI.Vb0gT2tqQe0z/mQUrGOslR/SUqdDdOE.KUGP7cnEO', 'doctor14', 'department04', 'm', 14, 14, NULL);
INSERT INTO `doctor` VALUES ('doctor15', '$2a$10$1Kfnje5K4gzYSz2ugHdjNuTPi4VSdzuQmUfhV.3ZR5czcpv1W0X4C', 'doctor15', 'department08', 'm', 15, 15, NULL);
INSERT INTO `doctor` VALUES ('doctor16', '$2a$10$E4ES4YM43gHR9RcyVPTZhO0.8KBdRtTSXfVqOtwR2IoHcozdw.xlS', 'doctor16', 'department05', 'm', 16, 16, NULL);
INSERT INTO `doctor` VALUES ('doctor17', '$2a$10$/tQSl0PQiGD7WnfiQ8Zp0uRzi8ehjBcjj7O/2TzZopdZnOoM.MCQO', 'doctor17', 'department04', 'm', 17, 17, NULL);
INSERT INTO `doctor` VALUES ('doctor18', '$2a$10$1XeFEMjfNxGd8G9lQwdSc.joLQ4zvyNgWtq8sbb1MpPa1JJQqaowO', 'doctor18', 'department07', 'm', 18, 18, NULL);
INSERT INTO `doctor` VALUES ('doctor19', '$2a$10$HRtu1mFwtdTLkZnR6FTmX.MfylXbenZNo8EcndvkX8l8nPUqMtD3m', 'doctor19', 'department09', 'm', 19, 19, NULL);
INSERT INTO `doctor` VALUES ('doctor20', '$2a$10$AVSTNsJR6oaihWqJknb7ruoMXDH6k/9Y1dYvA9PGQf0h08Nf3BEaO', 'doctor20', 'department04', 'm', 20, 20, NULL);
INSERT INTO `doctor` VALUES ('doctor21', '$2a$10$n8yBU/s8YrquOJjWqGCMOu3F0knxta6x.F8us/AJ65v5fKkK.CriW', 'doctor21', 'department01', 'm', 21, 21, NULL);
INSERT INTO `doctor` VALUES ('doctor22', '$2a$10$9dWzk3jovY0u2O4dgZ0L2.IdEHsB3A9xzcaalyPNn7no1RCnDrvmW', 'doctor22', 'department06', 'm', 22, 22, NULL);
INSERT INTO `doctor` VALUES ('doctor23', '$2a$10$YHa5sqAaaT3KDAyKGZ5ACuwW7.5Ae./5yAr8Dyz7UFf4KA9Sh2hN.', 'doctor23', 'department03', 'm', 23, 23, NULL);
INSERT INTO `doctor` VALUES ('doctor24', '$2a$10$svws6idKlSqp/CcE1hI5lO9XkGJFHR5Lzy6tfN8F27POEwGyRaAke', 'doctor24', 'department03', 'm', 24, 24, NULL);
INSERT INTO `doctor` VALUES ('doctor25', '$2a$10$liR9V26b/gPsVKTt3c4nk.UYU9bjMLhAmtY/Box.sH04nsJRc/Axe', 'doctor25', 'department07', 'm', 25, 25, NULL);
INSERT INTO `doctor` VALUES ('doctor26', '$2a$10$V78AhDNawMuOtzLCi2qRf.mWAwVUtDG.FL8iSlw9CEHqR5a2FK3uC', 'doctor26', 'department02', 'm', 26, 26, NULL);
INSERT INTO `doctor` VALUES ('doctor27', '$2a$10$GHsYQAowIj/TYp.xdJNo4Oq.dYpdufHdxpnWYswTZGlrLakKCpwOe', 'doctor27', 'department04', 'm', 27, 27, NULL);
INSERT INTO `doctor` VALUES ('doctor28', '$2a$10$QOK6AXQHXuhveofts7UDiO6S3IBztYEuO.6MmoLKT8T5WGOvCNbm.', 'doctor28', 'department04', 'm', 28, 28, NULL);
INSERT INTO `doctor` VALUES ('doctor29', '$2a$10$gVzNhFcn92hOUkVoFnrStuVU0qhNkCEBLdjVXADU75jXR3mYwJn2i', 'doctor29', 'department08', 'm', 29, 29, NULL);

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
INSERT INTO `mapnode` VALUES ('0', NULL, 1, 567, 598, '10010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10001', NULL, 1, 315, 230, '10015,10002,10016,10017', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10002', NULL, 1, 441, 230, '10001,10003,10018', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10003', NULL, 1, 567, 230, '10002,10004,10019', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10004', NULL, 1, 693, 230, '10003,10005,10020', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10005', NULL, 1, 819, 230, '10004,10006,10021,10022', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10006', NULL, 1, 819, 322, '10005,10007,10023', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10007', NULL, 1, 819, 414, '10006,10008,10024', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10008', NULL, 1, 819, 506, '10007,10009,10025,10026', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10009', NULL, 1, 693, 506, '10008,10010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10010', NULL, 1, 567, 506, '10009,10011,0', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10011', NULL, 1, 441, 506, '10010,10012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10012', NULL, 1, 315, 506, '10011,10013,10030,10031', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10013', NULL, 1, 315, 414, '10012,10014,10032', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10014', NULL, 1, 315, 322, '10013,10015,10033', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10015', NULL, 1, 315, 230, '10014,10001,10034,10035', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10016', NULL, 1, 315, 138, '10001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10017', NULL, 1, 189, 230, '10001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10018', NULL, 1, 441, 138, '10002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10019', NULL, 1, 567, 138, '10003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10020', NULL, 1, 693, 138, '10004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10021', NULL, 1, 819, 138, '10005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10022', NULL, 1, 945, 230, '10005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10023', NULL, 1, 945, 322, '10006', NULL, '20023,30023', 'e1', NULL);
INSERT INTO `mapnode` VALUES ('10024', NULL, 1, 945, 414, '10007', '20024', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10025', NULL, 1, 819, 598, '10008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10026', NULL, 1, 945, 506, '10008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10030', NULL, 1, 315, 598, '10012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10031', NULL, 1, 189, 506, '10012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10032', NULL, 1, 189, 414, '10013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10033', NULL, 1, 189, 322, '10014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10034', NULL, 1, 315, 138, '10015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('10035', NULL, 1, 189, 230, '10015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20001', NULL, 2, 315, 230, '20015,20002,20016,20017', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20002', NULL, 2, 441, 230, '20001,20003,20018', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20003', NULL, 2, 567, 230, '20002,20004,20019', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20004', NULL, 2, 693, 230, '20003,20005,20020', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20005', NULL, 2, 819, 230, '20004,20006,20021,20022', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20006', NULL, 2, 819, 322, '20005,20007,20023', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20007', NULL, 2, 819, 414, '20006,20008,20024', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20008', NULL, 2, 819, 506, '20007,20009,20025,20026', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20009', NULL, 2, 693, 506, '20008,20010,20027', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20010', NULL, 2, 567, 506, '20009,20011,20028', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20011', NULL, 2, 441, 506, '20010,20012,20029', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20012', NULL, 2, 315, 506, '20011,20013,20030,20031', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20013', NULL, 2, 315, 414, '20012,20014,20032', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20014', NULL, 2, 315, 322, '20013,20015,20033', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20015', NULL, 2, 315, 230, '20014,20001,20034,20035', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20016', NULL, 2, 315, 138, '20001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20017', NULL, 2, 189, 230, '20001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20018', NULL, 2, 441, 138, '20002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20019', NULL, 2, 567, 138, '20003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20020', NULL, 2, 693, 138, '20004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20021', NULL, 2, 819, 138, '20005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20022', NULL, 2, 945, 230, '20005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20023', NULL, 2, 945, 322, '20006', NULL, '10023,30023', 'e1', NULL);
INSERT INTO `mapnode` VALUES ('20024', NULL, 2, 945, 414, '20007', '10024,30024', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20025', NULL, 2, 819, 598, '20008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20026', NULL, 2, 945, 506, '20008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20027', NULL, 2, 693, 598, '20009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20028', NULL, 2, 567, 598, '20010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20029', NULL, 2, 441, 598, '20011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20030', NULL, 2, 315, 598, '20012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20031', NULL, 2, 189, 506, '20012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20032', NULL, 2, 189, 414, '20013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20033', NULL, 2, 189, 322, '20014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20034', NULL, 2, 315, 138, '20015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('20035', NULL, 2, 189, 230, '20015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30001', NULL, 3, 315, 230, '30015,30002,30016,30017', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30002', NULL, 3, 441, 230, '30001,30003,30018', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30003', NULL, 3, 567, 230, '30002,30004,30019', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30004', NULL, 3, 693, 230, '30003,30005,30020', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30005', NULL, 3, 819, 230, '30004,30006,30021,30022', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30006', NULL, 3, 819, 322, '30005,30007,30023', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30007', NULL, 3, 819, 414, '30006,30008,30024', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30008', NULL, 3, 819, 506, '30007,30009,30025,30026', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30009', NULL, 3, 693, 506, '30008,30010,30027', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30010', NULL, 3, 567, 506, '30009,30011,30028', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30011', NULL, 3, 441, 506, '30010,30012,30029', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30012', NULL, 3, 315, 506, '30011,30013,30030,30031', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30013', NULL, 3, 315, 414, '30012,30014,30032', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30014', NULL, 3, 315, 322, '30013,30015,30033', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30015', NULL, 3, 315, 230, '30014,30001,30034,30035', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30016', NULL, 3, 315, 138, '30001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30017', NULL, 3, 189, 230, '30001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30018', NULL, 3, 441, 138, '30002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30019', NULL, 3, 567, 138, '30003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30020', NULL, 3, 693, 138, '30004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30021', NULL, 3, 819, 138, '30005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30022', NULL, 3, 945, 230, '30005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30023', NULL, 3, 945, 322, '30006', NULL, '10023,20023', 'e1', NULL);
INSERT INTO `mapnode` VALUES ('30024', NULL, 3, 945, 414, '30007', '20024', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30025', NULL, 3, 819, 598, '30008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30026', NULL, 3, 945, 506, '30008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30027', NULL, 3, 693, 598, '30009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30028', NULL, 3, 567, 598, '30010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30029', NULL, 3, 441, 598, '30011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30030', NULL, 3, 315, 598, '30012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30031', NULL, 3, 189, 506, '30012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30032', NULL, 3, 189, 414, '30013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30033', NULL, 3, 189, 322, '30014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30034', NULL, 3, 315, 138, '30015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('30035', NULL, 3, 189, 230, '30015', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `messageId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answerId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `speakerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `speakerUsername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `speakerRole` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`messageId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `project` VALUES ('project10017', 'department04', 60000, '10017', NULL);
INSERT INTO `project` VALUES ('project10018', 'department02', 600000, '10018', NULL);
INSERT INTO `project` VALUES ('project10019', 'department06', 540000, '10019', NULL);
INSERT INTO `project` VALUES ('project10020', 'department03', 120000, '10020', NULL);
INSERT INTO `project` VALUES ('project10021', 'department06', 420000, '10021', NULL);
INSERT INTO `project` VALUES ('project10022', 'department05', 180000, '10022', NULL);
INSERT INTO `project` VALUES ('project10023', 'department02', 480000, '10023', NULL);
INSERT INTO `project` VALUES ('project10024', 'department07', 420000, '10024', NULL);
INSERT INTO `project` VALUES ('project10025', 'department04', 540000, '10025', NULL);
INSERT INTO `project` VALUES ('project10026', 'department07', 60000, '10026', NULL);
INSERT INTO `project` VALUES ('project10030', 'department04', 420000, '10030', NULL);
INSERT INTO `project` VALUES ('project10031', 'department09', 120000, '10031', NULL);
INSERT INTO `project` VALUES ('project10032', 'department06', 600000, '10032', NULL);
INSERT INTO `project` VALUES ('project10033', 'department01', 180000, '10033', NULL);
INSERT INTO `project` VALUES ('project10034', 'department04', 540000, '10034', NULL);
INSERT INTO `project` VALUES ('project10035', 'department01', 360000, '10035', NULL);
INSERT INTO `project` VALUES ('project20017', 'department06', 60000, '20017', NULL);
INSERT INTO `project` VALUES ('project20018', 'department09', 120000, '20018', NULL);
INSERT INTO `project` VALUES ('project20019', 'department08', 600000, '20019', NULL);
INSERT INTO `project` VALUES ('project20020', 'department01', 120000, '20020', NULL);
INSERT INTO `project` VALUES ('project20021', 'department08', 120000, '20021', NULL);
INSERT INTO `project` VALUES ('project20022', 'department01', 60000, '20022', NULL);
INSERT INTO `project` VALUES ('project20023', 'department02', 540000, '20023', NULL);
INSERT INTO `project` VALUES ('project20024', 'department08', 420000, '20024', NULL);
INSERT INTO `project` VALUES ('project20025', 'department07', 480000, '20025', NULL);
INSERT INTO `project` VALUES ('project20026', 'department06', 60000, '20026', NULL);
INSERT INTO `project` VALUES ('project20027', 'department07', 540000, '20027', NULL);
INSERT INTO `project` VALUES ('project20028', 'department04', 180000, '20028', NULL);
INSERT INTO `project` VALUES ('project20029', 'department05', 420000, '20029', NULL);
INSERT INTO `project` VALUES ('project20030', 'department03', 120000, '20030', NULL);
INSERT INTO `project` VALUES ('project20031', 'department01', 60000, '20031', NULL);
INSERT INTO `project` VALUES ('project20032', 'department02', 60000, '20032', NULL);
INSERT INTO `project` VALUES ('project20033', 'department02', 600000, '20033', NULL);
INSERT INTO `project` VALUES ('project20034', 'department08', 240000, '20034', NULL);
INSERT INTO `project` VALUES ('project20035', 'department01', 180000, '20035', NULL);
INSERT INTO `project` VALUES ('project30017', 'department03', 300000, '30017', NULL);
INSERT INTO `project` VALUES ('project30018', 'department05', 240000, '30018', NULL);
INSERT INTO `project` VALUES ('project30019', 'department08', 240000, '30019', NULL);
INSERT INTO `project` VALUES ('project30020', 'department08', 420000, '30020', NULL);
INSERT INTO `project` VALUES ('project30021', 'department05', 480000, '30021', NULL);
INSERT INTO `project` VALUES ('project30022', 'department01', 360000, '30022', NULL);
INSERT INTO `project` VALUES ('project30023', 'department01', 540000, '30023', NULL);
INSERT INTO `project` VALUES ('project30024', 'department01', 480000, '30024', NULL);
INSERT INTO `project` VALUES ('project30025', 'department05', 60000, '30025', NULL);
INSERT INTO `project` VALUES ('project30026', 'department05', 420000, '30026', NULL);
INSERT INTO `project` VALUES ('project30027', 'department04', 540000, '30027', NULL);
INSERT INTO `project` VALUES ('project30028', 'department01', 300000, '30028', NULL);
INSERT INTO `project` VALUES ('project30029', 'department01', 420000, '30029', NULL);
INSERT INTO `project` VALUES ('project30030', 'department03', 180000, '30030', NULL);
INSERT INTO `project` VALUES ('project30031', 'department05', 360000, '30031', NULL);
INSERT INTO `project` VALUES ('project30032', 'department03', 420000, '30032', NULL);
INSERT INTO `project` VALUES ('project30033', 'department05', 300000, '30033', NULL);
INSERT INTO `project` VALUES ('project30034', 'department07', 600000, '30034', NULL);
INSERT INTO `project` VALUES ('project30035', 'department06', 420000, '30035', NULL);

SET FOREIGN_KEY_CHECKS = 1;

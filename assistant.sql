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

 Date: 14/04/2022 03:28:45
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
INSERT INTO `doctor` VALUES ('doctor01', '$2a$10$n0t2C0ajG1QOddMXT5tVNOmvW.5IkeTOyPSUPEVQqDPHukrSvSir2', 'doctor01', 'department05', 'm', 1, 1, NULL);
INSERT INTO `doctor` VALUES ('doctor02', '$2a$10$yV02TxIhpuqu.QSMv24mQ.HPziii1pf4Z4U0nQb9BlZ2BAIF0ARXC', 'doctor02', 'department07', 'm', 2, 2, NULL);
INSERT INTO `doctor` VALUES ('doctor03', '$2a$10$St54u74UFQQxs3RwDJ/u1ut8KfsmoWiXs8u5iywqR0266uX7NmduC', 'doctor03', 'department02', 'm', 3, 3, NULL);
INSERT INTO `doctor` VALUES ('doctor04', '$2a$10$sQ5au7X8p8f1SiI.ssfuiutMw6tG1l5f3guKZ7mk5IkN3KV7hJ9UK', 'doctor04', 'department02', 'm', 4, 4, NULL);
INSERT INTO `doctor` VALUES ('doctor05', '$2a$10$q7s9hIO5tKRPi/VSeTfYWO8ojtxCRTDm6kXHMIkUkqOK6.7JG3/0e', 'doctor05', 'department04', 'm', 5, 5, NULL);
INSERT INTO `doctor` VALUES ('doctor06', '$2a$10$bCXfE3VERK99lCk5FxQmP.X9qHP/XjKnJaeRSAm3EAMEhLqhgeQze', 'doctor06', 'department05', 'm', 6, 6, NULL);
INSERT INTO `doctor` VALUES ('doctor07', '$2a$10$B7kKvgFFq/oNleMUCt77hO8yVKmVEqoVD7vpZwC.dCx9AjZ2fzy/u', 'doctor07', 'department08', 'm', 7, 7, NULL);
INSERT INTO `doctor` VALUES ('doctor08', '$2a$10$YZKiszew5x4CPO8ev3PBpuT/WtHyBcVfzfL/xyzk8Z5Gbt1XeM/aO', 'doctor08', 'department09', 'm', 8, 8, NULL);
INSERT INTO `doctor` VALUES ('doctor09', '$2a$10$pdoV8s/puv0aZAOBQoFTdOWsiJSYawccxKl2LK6PM5tpk4FADIujm', 'doctor09', 'department07', 'm', 9, 9, NULL);
INSERT INTO `doctor` VALUES ('doctor10', '$2a$10$L.ErImf2F9sA9f9rSobAGO01vvw3AIgr6Cm6hGFvlC8S50erspLry', 'doctor10', 'department09', 'm', 10, 10, NULL);
INSERT INTO `doctor` VALUES ('doctor11', '$2a$10$ByCyy.FtIHwmZIBcKGQuJ..SUvV5gJpTHrZp7oMa1dRw1MIKGHwpS', 'doctor11', 'department01', 'm', 11, 11, NULL);
INSERT INTO `doctor` VALUES ('doctor12', '$2a$10$pq6MWJTijpCJyt5pBMFDTeSMan2ZIVLZWF9aNf2orbTG/baKt3D9S', 'doctor12', 'department01', 'm', 12, 12, NULL);
INSERT INTO `doctor` VALUES ('doctor13', '$2a$10$dDSM7KWgarkoo/wh3f1nI.BuB5oM7ftv29ViCuxv9iHPnuIrF8.dK', 'doctor13', 'department08', 'm', 13, 13, NULL);
INSERT INTO `doctor` VALUES ('doctor14', '$2a$10$WLSA6fLhzIQI9/KwKUyUQu518B9g0toO6baVExZkbznh2im3QTYnS', 'doctor14', 'department02', 'm', 14, 14, NULL);
INSERT INTO `doctor` VALUES ('doctor15', '$2a$10$1d4ARtiP1ioVpht6MFI3ZOhLA3xkiumcAplS8IMQ2ne73uQnFcFKC', 'doctor15', 'department06', 'm', 15, 15, NULL);
INSERT INTO `doctor` VALUES ('doctor16', '$2a$10$iUMbsge0hV.Pna5YbzOw2uWQvi3o59n8UTKYosmG5QJgRjc9XnPnO', 'doctor16', 'department07', 'm', 16, 16, NULL);
INSERT INTO `doctor` VALUES ('doctor17', '$2a$10$9u9CVsO./rZtpTrmxcmvfe3gDGu1KiGBEp57JH0VotNeAIz1F0g8i', 'doctor17', 'department03', 'm', 17, 17, NULL);
INSERT INTO `doctor` VALUES ('doctor18', '$2a$10$TakimlpD1qZYNO0YgLdkUOKZ49EJCh2XTfvnJJOJB.Udwp1MxLdkC', 'doctor18', 'department01', 'm', 18, 18, NULL);
INSERT INTO `doctor` VALUES ('doctor19', '$2a$10$WYYBpg5g9kZnuSXLXq3jvugnBqNVNvnopsSz8id4ARNhIrT1Z3Nny', 'doctor19', 'department06', 'm', 19, 19, NULL);
INSERT INTO `doctor` VALUES ('doctor20', '$2a$10$CzPKUMd1jRBV6BIjmzOyDeU0Ni7YR/QHLQSVR7/8EhjbpYwixB5aO', 'doctor20', 'department05', 'm', 20, 20, NULL);
INSERT INTO `doctor` VALUES ('doctor21', '$2a$10$nKJML3EQWDkU5RVz6q6S7u24CO4qTjIyXu0QQZjsiFERMfQ2oXQU.', 'doctor21', 'department06', 'm', 21, 21, NULL);
INSERT INTO `doctor` VALUES ('doctor22', '$2a$10$H6vEBJwKkH9t335tRgwOSeJwMSZkvBWI.nC2uC17gVQvUeeeSahzm', 'doctor22', 'department08', 'm', 22, 22, NULL);
INSERT INTO `doctor` VALUES ('doctor23', '$2a$10$ysZhzeJInF9vVkrdI30qseZL9AGkepgmykMmGmw.TJo614OueuZt.', 'doctor23', 'department05', 'm', 23, 23, NULL);
INSERT INTO `doctor` VALUES ('doctor24', '$2a$10$lw43Et36SsLzpchY2spybOd9.iLC.heYtIuH.V7czLPeAKaJKjvsm', 'doctor24', 'department07', 'm', 24, 24, NULL);
INSERT INTO `doctor` VALUES ('doctor25', '$2a$10$rjqnU8bLgev8CwZ0wizlze34GPgI8TKUtL62A9.UqVsp1WBkw8uTu', 'doctor25', 'department07', 'm', 25, 25, NULL);
INSERT INTO `doctor` VALUES ('doctor26', '$2a$10$G9JDkBbfEw2rTzGkhk9W8O8qEihsGGiK4fUUVxs2cYrCRTrVy3nTS', 'doctor26', 'department01', 'm', 26, 26, NULL);
INSERT INTO `doctor` VALUES ('doctor27', '$2a$10$q.Z247FLQwK/7Gts9APOM.Dc8bODNvXbBOywnH84n09vAHSzGIOnO', 'doctor27', 'department05', 'm', 27, 27, NULL);
INSERT INTO `doctor` VALUES ('doctor28', '$2a$10$URjEujwrwjzY3RsSH2hVougN30C9SMAtfAipFbLhoTNYqOVo0GPOe', 'doctor28', 'department08', 'm', 28, 28, NULL);
INSERT INTO `doctor` VALUES ('doctor29', '$2a$10$huvP2hufw9cCMUNaKRQa2./Er66rS1Am4Y8NwWvL/iQbNDbGsx3Ym', 'doctor29', 'department08', 'm', 29, 29, NULL);
INSERT INTO `doctor` VALUES ('doctor30', '$2a$10$bUPkfxEHmHGagKLCUmKy6.FdWOHkpjkJH6Em1Txs1HyOI3UAHktwi', 'doctor30', 'department09', 'm', 30, 30, NULL);
INSERT INTO `doctor` VALUES ('doctor31', '$2a$10$1laZiAh3lU5xXToYWsH.s.2b0UeJKZ0sa32jy2o7anFIY69dg.2Ke', 'doctor31', 'department07', 'm', 31, 31, NULL);
INSERT INTO `doctor` VALUES ('doctor32', '$2a$10$QsSFrUoN.ybJ1Hweg8NXbeHI3WORTOSYZ/Kq2htgqeihfZKj2jsyi', 'doctor32', 'department09', 'm', 32, 32, NULL);
INSERT INTO `doctor` VALUES ('doctor33', '$2a$10$CLV3HQYb6m96mCza8mgEMOqHZin0Wec/a3zwWqQOc4ydYLJgldu9e', 'doctor33', 'department08', 'm', 33, 33, NULL);
INSERT INTO `doctor` VALUES ('doctor34', '$2a$10$pmNwEfNsC1eGvkrrV25kVOxOvvb3cpWXMCB3Q81IiZv15KQuMxTey', 'doctor34', 'department01', 'm', 34, 34, NULL);
INSERT INTO `doctor` VALUES ('doctor35', '$2a$10$uwL9xP9.HEiOaDJC7Ewtv.0O51Ck1qqFInYFQMdZH/nsp.iQCZPTq', 'doctor35', 'department09', 'm', 35, 35, NULL);
INSERT INTO `doctor` VALUES ('doctor36', '$2a$10$hjgBEo4WOJrbTrCpwDvSXe9tc1Zj7PkZi/CRpDGjZb1GuKrAdsCP2', 'doctor36', 'department09', 'm', 36, 36, NULL);
INSERT INTO `doctor` VALUES ('doctor37', '$2a$10$hGy8Ev3zJmMS4aI4vxeIz.WGuC7OL.h.qTWHxyaFAAoQ8BioOkrmS', 'doctor37', 'department09', 'm', 37, 37, NULL);
INSERT INTO `doctor` VALUES ('doctor38', '$2a$10$SnuKIJjxX.N2bxwRjvlfrOqIGWuzX9ciaU1LQac9cBrbQLKvtMDo.', 'doctor38', 'department04', 'm', 38, 38, NULL);
INSERT INTO `doctor` VALUES ('doctor39', '$2a$10$R7C8A1nZynBSnymg37HpoufpbSHcv1dSNwY9YpEnp.f8VCLyVkPnm', 'doctor39', 'department02', 'm', 39, 39, NULL);
INSERT INTO `doctor` VALUES ('doctor40', '$2a$10$orlLotCTrn5tElIVQf5bnuBw/z.6nun1I7chf8Vp9RsWZF038BH3C', 'doctor40', 'department03', 'm', 40, 40, NULL);
INSERT INTO `doctor` VALUES ('doctor41', '$2a$10$bIxWGm5ZPdZSdEZWNPd6We1KvFSdk8AMH5RHarqso3w8enY7xg1f6', 'doctor41', 'department01', 'm', 41, 41, NULL);
INSERT INTO `doctor` VALUES ('doctor42', '$2a$10$VlUG7SBPVRGwwfOe.bOmjeeczNvwgW9ww1yG4.LL8jWEThU16Ki12', 'doctor42', 'department06', 'm', 42, 42, NULL);
INSERT INTO `doctor` VALUES ('doctor43', '$2a$10$.HYo1evW1vdRZXAax4r6dOkUK4ioR/cfjTUjJnnAywGTOR2L23fji', 'doctor43', 'department03', 'm', 43, 43, NULL);
INSERT INTO `doctor` VALUES ('doctor44', '$2a$10$cZz3lU6mGNPWlJ8Xz.Wd2ujjERDg6zghQacGpzVo6L0qvZwXy3Gv.', 'doctor44', 'department05', 'm', 44, 44, NULL);
INSERT INTO `doctor` VALUES ('doctor45', '$2a$10$5kNxtSyauBVKOyGmldBo5ex6wG16BFce8WfycBKH428yNW/AoKjyC', 'doctor45', 'department02', 'm', 45, 45, NULL);
INSERT INTO `doctor` VALUES ('doctor46', '$2a$10$zW.BP2KDk5ZSpbtkIFu.DuWVVRqnsLrByPHvCKq60lUydlN42q58O', 'doctor46', 'department04', 'm', 46, 46, NULL);
INSERT INTO `doctor` VALUES ('doctor47', '$2a$10$GlhcFBOsZsGQRek6K1qL4OzywqKDcFKNxfvEnXuugsqx3ffVBZdl.', 'doctor47', 'department04', 'm', 47, 47, NULL);
INSERT INTO `doctor` VALUES ('doctor48', '$2a$10$hDtz80bsQdu7Rae1DF2RnOw2U0XwpOHpghnEQqWaOKPpbd/YyvJSC', 'doctor48', 'department09', 'm', 48, 48, NULL);
INSERT INTO `doctor` VALUES ('doctor49', '$2a$10$59YHg5WuZ9iKmrx58zC6tufJ1eLr745o04FmMRsnoUYY8XXoXWWhS', 'doctor49', 'department03', 'm', 49, 49, NULL);
INSERT INTO `doctor` VALUES ('doctor50', '$2a$10$NflYNDDwJMWQLZ7CWmksz.gixeQzeaD91q8HydVFVvVT90QtsSRfq', 'doctor50', 'department06', 'm', 50, 50, NULL);
INSERT INTO `doctor` VALUES ('doctor51', '$2a$10$XAFFg1HYqg.s3LUH/GJZbe65cdmq2SL5nj2cyZAqKWOdPF6cLbUke', 'doctor51', 'department02', 'm', 51, 51, NULL);
INSERT INTO `doctor` VALUES ('doctor52', '$2a$10$G9m3jfwl8IQHRqEuLM0naenI/Yt0oAsUjyDrBqs/BGxxMsy2SM5hO', 'doctor52', 'department09', 'm', 52, 52, NULL);
INSERT INTO `doctor` VALUES ('doctor53', '$2a$10$uD9GCBlMqEje09XCKpW3met3DQlrwNIzKCP7WRhYFzK5GacOmT/TC', 'doctor53', 'department05', 'm', 53, 53, NULL);
INSERT INTO `doctor` VALUES ('doctor54', '$2a$10$p9G4hKMnbKBIcFWT2FYKZOpV8p8JH3.pL9BEqmS0LdpUeQ8CJh6KC', 'doctor54', 'department05', 'm', 54, 54, NULL);
INSERT INTO `doctor` VALUES ('doctor55', '$2a$10$hS1O313CAMmMVqGIYFW1j.TG8koar8ZK/mOu1pW.HN8oEYg2plzQ6', 'doctor55', 'department03', 'm', 55, 55, NULL);
INSERT INTO `doctor` VALUES ('doctor56', '$2a$10$iNz3Vb6J103GFo8wXFfc0.5BmFnbGkNqO3veYcOXWIIKlEUkj3zYq', 'doctor56', 'department03', 'm', 56, 56, NULL);
INSERT INTO `doctor` VALUES ('doctor57', '$2a$10$TQ6zKOaENQZibPDdblcnseh2ru1ViXyYAxpFahD8P0IyZv/YszItq', 'doctor57', 'department06', 'm', 57, 57, NULL);
INSERT INTO `doctor` VALUES ('doctor58', '$2a$10$R.0qJBLEkw1wbijK59tf6eKKtfc7.m7/L1Qmbsc5Rx8R2si8F3CE6', 'doctor58', 'department08', 'm', 58, 58, NULL);
INSERT INTO `doctor` VALUES ('doctor59', '$2a$10$If9N4I6NKbrOAEw.8p2cve5LTuyf3IbvFIDz/.Ho1Cq/b/dQQddDK', 'doctor59', 'department06', 'm', 59, 59, NULL);
INSERT INTO `doctor` VALUES ('doctor60', '$2a$10$w7xFW1.5jZV2iudL9WN92.kNtViqzQbiF6tFc3HOneoNlZDJa0tBO', 'doctor60', 'department04', 'm', 60, 60, NULL);
INSERT INTO `doctor` VALUES ('doctor61', '$2a$10$n.aT/UK.axl.XlogHUASjeWJj.MOfhu8kFsg.KQQ.v4UWxvOhjuw6', 'doctor61', 'department02', 'm', 61, 61, NULL);
INSERT INTO `doctor` VALUES ('doctor62', '$2a$10$1NvsmGLGk60CsBsbzVyBeehBr7ZziOx6FUi9owCWHcES1BJjlcjwq', 'doctor62', 'department03', 'm', 62, 62, NULL);
INSERT INTO `doctor` VALUES ('doctor63', '$2a$10$m1IrNIuJeO9.czOmOx6TNOgen./Rn7VHsrQcWPvJX2q0puxSHH2uK', 'doctor63', 'department07', 'm', 63, 63, NULL);
INSERT INTO `doctor` VALUES ('doctor64', '$2a$10$vwpahXRoNtMkHEW93f6GO.vTBxMvQdVtajBP2xwkfKIx42aGjLOF2', 'doctor64', 'department02', 'm', 64, 64, NULL);
INSERT INTO `doctor` VALUES ('doctor65', '$2a$10$E/ZkLLmwZOCjRhNcTHYyDuWFUMTknONJGKeHJ4O8Jxk5TGYEASXeS', 'doctor65', 'department02', 'm', 65, 65, NULL);
INSERT INTO `doctor` VALUES ('doctor66', '$2a$10$6KSrCh7y19Ad3Ym9U9mmx.IEJ9UAKkhSvIBR7GMs9J5xkifG20HI6', 'doctor66', 'department07', 'm', 66, 66, NULL);
INSERT INTO `doctor` VALUES ('doctor67', '$2a$10$Qocu7jGPPZ/AMOCFGg/FSO3WrSPavusMS/ng7Hr5c0lvcsMu9hWvi', 'doctor67', 'department09', 'm', 67, 67, NULL);
INSERT INTO `doctor` VALUES ('doctor68', '$2a$10$gMrfDgpS.CGSnsQ3oDNPA.pO.Z7mimMnNomsOkG4v.e1QQ/1Vvjpy', 'doctor68', 'department05', 'm', 68, 68, NULL);
INSERT INTO `doctor` VALUES ('doctor69', '$2a$10$d45kMUIQYeK7NpJeeQ.dbe.c4mTH4veMVX87oD6lMpCFQEC4zVcIO', 'doctor69', 'department06', 'm', 69, 69, NULL);
INSERT INTO `doctor` VALUES ('doctor70', '$2a$10$0NpCsUEMVx0ytFDmzVGt0elMlKCtC9GpqmDAsEUnbVoBwI4iprdIu', 'doctor70', 'department08', 'm', 70, 70, NULL);
INSERT INTO `doctor` VALUES ('doctor71', '$2a$10$5rULKmPwAt25QOIZ5.j5PeijRlSfW9ZDiVPLOEorvBaAXXgROYWhG', 'doctor71', 'department02', 'm', 71, 71, NULL);
INSERT INTO `doctor` VALUES ('doctor72', '$2a$10$WY23GP7hpQbLCi40iAf/neFRllRbPNdjmYzU0j.Idvtt7erQ9gs0a', 'doctor72', 'department02', 'm', 72, 72, NULL);
INSERT INTO `doctor` VALUES ('doctor73', '$2a$10$LBAKYAZejt27Is1Gu0Vhr.sLR0IKFGLwmeBbRtVZjbfrR8L2SH3z.', 'doctor73', 'department04', 'm', 73, 73, NULL);
INSERT INTO `doctor` VALUES ('doctor74', '$2a$10$goNqevPfl3CrZNYd601Eo.0rv.8pHM.0ClhxUxZ5eFIQ/AfwKSI2S', 'doctor74', 'department04', 'm', 74, 74, NULL);
INSERT INTO `doctor` VALUES ('doctor75', '$2a$10$exw6extdmoz0j.9MJAoBWefHsztF0PE0Ctx/heUH7gMKFi4XoKSU.', 'doctor75', 'department07', 'm', 75, 75, NULL);
INSERT INTO `doctor` VALUES ('doctor76', '$2a$10$smSpLa2zyrAv/qD0FTWPweJqgQQ3e2absfQUP8cQUxg/UpLxbOmWS', 'doctor76', 'department07', 'm', 76, 76, NULL);
INSERT INTO `doctor` VALUES ('doctor77', '$2a$10$TWlbMd6zv0Ym426JlWaQUeD6aPgEQH3kmAt0h9VT01QxUl5FPGsA.', 'doctor77', 'department02', 'm', 77, 77, NULL);
INSERT INTO `doctor` VALUES ('doctor78', '$2a$10$l0OJPSuy/dENwv9n0V2Ct.y9RT9qJ4TJZ68udsgJaEtehYumwU1rS', 'doctor78', 'department04', 'm', 78, 78, NULL);
INSERT INTO `doctor` VALUES ('doctor79', '$2a$10$.vhvG9qXzDO.WTkVJciRyeA9XrwBqpQa9KbG/clLWrgM5UDKH/W1q', 'doctor79', 'department05', 'm', 79, 79, NULL);
INSERT INTO `doctor` VALUES ('doctor80', '$2a$10$7vP3p2FbkCmyQM.ZEzWuFexRZfsnNqa0YsLryyIRq8P9k6OnR.Nte', 'doctor80', 'department09', 'm', 80, 80, NULL);
INSERT INTO `doctor` VALUES ('doctor81', '$2a$10$P76OE8F0weQxlPDx6Ab6kOHc05f8zt73VVja8zkavQG9G91Uyck72', 'doctor81', 'department02', 'm', 81, 81, NULL);
INSERT INTO `doctor` VALUES ('doctor82', '$2a$10$rrECLPoUkz9K81zGLwDFO.g7AFkkzzkHua4J7Brbo8BO8cCRlLd9O', 'doctor82', 'department08', 'm', 82, 82, NULL);
INSERT INTO `doctor` VALUES ('doctor83', '$2a$10$VDvTXfHY42enGr4CXSpzO.u2muVzVVzQiJgxm9IwHXxHf953/oQa6', 'doctor83', 'department02', 'm', 83, 83, NULL);
INSERT INTO `doctor` VALUES ('doctor84', '$2a$10$B/W9mgeRn1IwqAuBhcObZeAHLhf0raloU1y4KbIBlTJ5tnGK1yune', 'doctor84', 'department01', 'm', 84, 84, NULL);
INSERT INTO `doctor` VALUES ('doctor85', '$2a$10$UudUINg7KP651KkNjF1cw.BKfFbkinH2DIwU9DYolKQRObtgkkAZ.', 'doctor85', 'department06', 'm', 85, 85, NULL);
INSERT INTO `doctor` VALUES ('doctor86', '$2a$10$U.q0fdp3oTiKntpCDGlg9e/D3RGn91h46vbgDVmkluP4ac7k/1Zvy', 'doctor86', 'department06', 'm', 86, 86, NULL);
INSERT INTO `doctor` VALUES ('doctor87', '$2a$10$ed3y6/8S58mHk8p.pZYWu.YwWDu3fHfOrZm/0EUFY00qkhxKMHtmq', 'doctor87', 'department09', 'm', 87, 87, NULL);
INSERT INTO `doctor` VALUES ('doctor88', '$2a$10$pQFnugh5khPNL24fa2Xf5ua68KJ.xVq6lNv4lKZw/Ze..LtY.yY6C', 'doctor88', 'department09', 'm', 88, 88, NULL);
INSERT INTO `doctor` VALUES ('doctor89', '$2a$10$mB66npW7a.ibiP6u.3Yd2.Oqw.X9a0MOTY1HWLEqlv/LWljI/oVAW', 'doctor89', 'department02', 'm', 89, 89, NULL);
INSERT INTO `doctor` VALUES ('doctor90', '$2a$10$otR5WBSz6Op7DdIwxfKEl.RfrU7DjK5dJeuY/h.Rlt0OlWBCRUUEe', 'doctor90', 'department08', 'm', 90, 90, NULL);
INSERT INTO `doctor` VALUES ('doctor91', '$2a$10$ki3RoOuxq94SdjpZHb4ms.8WSM12o0tV7/kSY0W2iu9x4rXnKKTo6', 'doctor91', 'department06', 'm', 91, 91, NULL);
INSERT INTO `doctor` VALUES ('doctor92', '$2a$10$vVoKPD32o/hIEvFMxAhVcO/3YEqovI9pDyHNNF0NcC8udwoZfx9D6', 'doctor92', 'department05', 'm', 92, 92, NULL);
INSERT INTO `doctor` VALUES ('doctor93', '$2a$10$N.kFqxPK.VsXu8bTQD4uyeRkb2IGE4qpzWMZV6jwVpDT3LUVqEmqG', 'doctor93', 'department05', 'm', 93, 93, NULL);
INSERT INTO `doctor` VALUES ('doctor94', '$2a$10$FIISE3nKiJ2S6qQYidR.Ye6RTewdhi3HPm6z0Z6P42efmjOVPLa.S', 'doctor94', 'department07', 'm', 94, 94, NULL);
INSERT INTO `doctor` VALUES ('doctor95', '$2a$10$iGHFRXV1NuIJKSJ2g61uXOmhYXh28S2Fcg86QjLCMmy4AfqPxjwMu', 'doctor95', 'department08', 'm', 95, 95, NULL);
INSERT INTO `doctor` VALUES ('doctor96', '$2a$10$gQptxa.bfoNjh5R9/45i1.KyVpgkfDg4s1fHkCOVhqB3ThsN3nk4u', 'doctor96', 'department01', 'm', 96, 96, NULL);
INSERT INTO `doctor` VALUES ('doctor97', '$2a$10$7.z7aGtttSOJKQ5g1lghVeHK6/jLMkW/1RAt2Ppp9ihCTpgXLwQh2', 'doctor97', 'department01', 'm', 97, 97, NULL);
INSERT INTO `doctor` VALUES ('doctor98', '$2a$10$mqERf3gvFhrMo1RqGe5VwekxrBxueZmKBqyEIbTGVk9rw2oTIV9q.', 'doctor98', 'department05', 'm', 98, 98, NULL);
INSERT INTO `doctor` VALUES ('doctor99', '$2a$10$op.kEuLiBucln16G.Kn8YeqF9YiItZ8cCH5yJCcPayZBa8bUR0pPu', 'doctor99', 'department06', 'm', 99, 99, NULL);

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
INSERT INTO `mapnode` VALUES ('10023', NULL, 1, 945, 322, '10006', NULL, '20023,30023,40023,50023', 'e1', NULL);
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
INSERT INTO `mapnode` VALUES ('20023', NULL, 2, 945, 322, '20006', NULL, '10023,30023,40023,50023', 'e1', NULL);
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
INSERT INTO `mapnode` VALUES ('30023', NULL, 3, 945, 322, '30006', NULL, '10023,20023,40023,50023', 'e1', NULL);
INSERT INTO `mapnode` VALUES ('30024', NULL, 3, 945, 414, '30007', '20024,40024', NULL, NULL, NULL);
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
INSERT INTO `mapnode` VALUES ('40001', NULL, 4, 315, 230, '40015,40002,40016,40017', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40002', NULL, 4, 441, 230, '40001,40003,40018', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40003', NULL, 4, 567, 230, '40002,40004,40019', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40004', NULL, 4, 693, 230, '40003,40005,40020', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40005', NULL, 4, 819, 230, '40004,40006,40021,40022', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40006', NULL, 4, 819, 322, '40005,40007,40023', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40007', NULL, 4, 819, 414, '40006,40008,40024', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40008', NULL, 4, 819, 506, '40007,40009,40025,40026', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40009', NULL, 4, 693, 506, '40008,40010,40027', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40010', NULL, 4, 567, 506, '40009,40011,40028', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40011', NULL, 4, 441, 506, '40010,40012,40029', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40012', NULL, 4, 315, 506, '40011,40013,40030,40031', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40013', NULL, 4, 315, 414, '40012,40014,40032', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40014', NULL, 4, 315, 322, '40013,40015,40033', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40015', NULL, 4, 315, 230, '40014,40001,40034,40035', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40016', NULL, 4, 315, 138, '40001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40017', NULL, 4, 189, 230, '40001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40018', NULL, 4, 441, 138, '40002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40019', NULL, 4, 567, 138, '40003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40020', NULL, 4, 693, 138, '40004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40021', NULL, 4, 819, 138, '40005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40022', NULL, 4, 945, 230, '40005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40023', NULL, 4, 945, 322, '40006', NULL, '10023,20023,30023,50023', 'e1', NULL);
INSERT INTO `mapnode` VALUES ('40024', NULL, 4, 945, 414, '40007', '30024,50024', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40025', NULL, 4, 819, 598, '40008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40026', NULL, 4, 945, 506, '40008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40027', NULL, 4, 693, 598, '40009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40028', NULL, 4, 567, 598, '40010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40029', NULL, 4, 441, 598, '40011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40030', NULL, 4, 315, 598, '40012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40031', NULL, 4, 189, 506, '40012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40032', NULL, 4, 189, 414, '40013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40033', NULL, 4, 189, 322, '40014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40034', NULL, 4, 315, 138, '40015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('40035', NULL, 4, 189, 230, '40015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50001', NULL, 5, 315, 230, '50015,50002,50016,50017', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50002', NULL, 5, 441, 230, '50001,50003,50018', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50003', NULL, 5, 567, 230, '50002,50004,50019', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50004', NULL, 5, 693, 230, '50003,50005,50020', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50005', NULL, 5, 819, 230, '50004,50006,50021,50022', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50006', NULL, 5, 819, 322, '50005,50007,50023', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50007', NULL, 5, 819, 414, '50006,50008,50024', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50008', NULL, 5, 819, 506, '50007,50009,50025,50026', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50009', NULL, 5, 693, 506, '50008,50010,50027', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50010', NULL, 5, 567, 506, '50009,50011,50028', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50011', NULL, 5, 441, 506, '50010,50012,50029', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50012', NULL, 5, 315, 506, '50011,50013,50030,50031', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50013', NULL, 5, 315, 414, '50012,50014,50032', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50014', NULL, 5, 315, 322, '50013,50015,50033', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50015', NULL, 5, 315, 230, '50014,50001,50034,50035', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50016', NULL, 5, 315, 138, '50001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50017', NULL, 5, 189, 230, '50001', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50018', NULL, 5, 441, 138, '50002', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50019', NULL, 5, 567, 138, '50003', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50020', NULL, 5, 693, 138, '50004', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50021', NULL, 5, 819, 138, '50005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50022', NULL, 5, 945, 230, '50005', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50023', NULL, 5, 945, 322, '50006', NULL, '10023,20023,30023,40023,', 'e1', NULL);
INSERT INTO `mapnode` VALUES ('50024', NULL, 5, 945, 414, '50007', '40024', NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50025', NULL, 5, 819, 598, '50008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50026', NULL, 5, 945, 506, '50008', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50027', NULL, 5, 693, 598, '50009', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50028', NULL, 5, 567, 598, '50010', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50029', NULL, 5, 441, 598, '50011', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50030', NULL, 5, 315, 598, '50012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50031', NULL, 5, 189, 506, '50012', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50032', NULL, 5, 189, 414, '50013', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50033', NULL, 5, 189, 322, '50014', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50034', NULL, 5, 315, 138, '50015', NULL, NULL, NULL, NULL);
INSERT INTO `mapnode` VALUES ('50035', NULL, 5, 189, 230, '50015', NULL, NULL, NULL, NULL);

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
INSERT INTO `patient` VALUES ('patient21', '$2a$10$GGDFWFCbZRcpH5i0vUkCzO/mHC0OJ0mQI2ml4OXImb9j.j5rybUGO', 'patient21', 'm', 21, '21', 0, NULL);
INSERT INTO `patient` VALUES ('patient22', '$2a$10$8ZhILieOicI9gDWzA0.gpeTzudZdIDyVP8BZOehsd3.T1gfxT.giS', 'patient22', 'm', 22, '22', 0, NULL);
INSERT INTO `patient` VALUES ('patient23', '$2a$10$WrOiOZoGwvCJYdzAjVa/3uU7I7gAS7kUwCZTpyCKvpzvnIf2/xKs.', 'patient23', 'm', 23, '23', 0, NULL);
INSERT INTO `patient` VALUES ('patient24', '$2a$10$rCVcbhD73ZpJkfbbYFjfh.3FaxX8hkI8gbhyhmWCAIod4KGxvr.AS', 'patient24', 'm', 24, '24', 0, NULL);
INSERT INTO `patient` VALUES ('patient25', '$2a$10$r3GN4ChNS3dum5gtxhm8qul7KJpsaHxS9vReyULkKmlcHCrGtMFny', 'patient25', 'f', 25, '25', 0, NULL);
INSERT INTO `patient` VALUES ('patient26', '$2a$10$DxSGZZVQ6Ija/8bhng.9AuUQqSDo2fQGRL3ggNgBVAY1FdgfWBE.e', 'patient26', 'm', 26, '26', 0, NULL);
INSERT INTO `patient` VALUES ('patient27', '$2a$10$j4LqdqJNcZgpMBJUnKGvauvDParznqDsd1Q8dEYm/p5JkPx5EfSVa', 'patient27', 'f', 27, '27', 0, NULL);
INSERT INTO `patient` VALUES ('patient28', '$2a$10$FvWgTY7JfdDwuEKl0oi5ve/VHZTLEnNXX/KYzyqbNt6tmbDxGDUFG', 'patient28', 'm', 28, '28', 0, NULL);
INSERT INTO `patient` VALUES ('patient29', '$2a$10$JpXGSGnRvIOJ7PDo.Zut2exMkOn65ymIZ8k4e51eYviwNvTPiS7eO', 'patient29', 'f', 29, '29', 0, NULL);
INSERT INTO `patient` VALUES ('patient30', '$2a$10$kML.18Xy3lqYUaYy45joheEb/VP7nZDbOL0QDe08G0UhPet4YvtT2', 'patient30', 'm', 30, '30', 0, NULL);
INSERT INTO `patient` VALUES ('patient31', '$2a$10$INFuewPtXECX3c88ax4PNev.TIMtQXDIwIgmI/fRMzKwkWjyUxmAq', 'patient31', 'm', 31, '31', 0, NULL);
INSERT INTO `patient` VALUES ('patient32', '$2a$10$Ryu46QdHOviQJTByUdf1E.3tC.6dDKKGJwndFaXWSLyG/hxSBS/ui', 'patient32', 'f', 32, '32', 0, NULL);
INSERT INTO `patient` VALUES ('patient33', '$2a$10$US9i9x1Gbgstuu8JLVTQhuuWkJHCUszxo6B3nLcdMvsJxUD2FaXlm', 'patient33', 'm', 33, '33', 0, NULL);
INSERT INTO `patient` VALUES ('patient34', '$2a$10$NETseLx6MqUh8vXpjp88Y.1bIeYbCs7szva2eeCGhG9uYqaOusPyi', 'patient34', 'f', 34, '34', 0, NULL);
INSERT INTO `patient` VALUES ('patient35', '$2a$10$T4NpYmV9DcB6M0ScSMSwre3RY.w/lfw4/HDUYDdUfVCefNPhJoLmu', 'patient35', 'f', 35, '35', 0, NULL);
INSERT INTO `patient` VALUES ('patient36', '$2a$10$C.g0DviFQnuvGZ0Tv6DZseDg8e4bz/bCpCv1CbW/kcb/4YvDKgRg6', 'patient36', 'f', 36, '36', 0, NULL);
INSERT INTO `patient` VALUES ('patient37', '$2a$10$AFnEmhkRdZGrMHrYIad1UezQ7tCfeJ9m3dXoc.malAdTSAa/mwyx.', 'patient37', 'f', 37, '37', 0, NULL);
INSERT INTO `patient` VALUES ('patient38', '$2a$10$b4W9cyUE.Rxw9JAnnE5nb.ZfENfnyuZQMmTuR54c7jagK87HGEQSC', 'patient38', 'f', 38, '38', 0, NULL);
INSERT INTO `patient` VALUES ('patient39', '$2a$10$3mB1LRVzu79Vsemmb2GoD.0ELtkKbKQZXVVfWSUfsZqxtjA8YX0zi', 'patient39', 'f', 39, '39', 0, NULL);
INSERT INTO `patient` VALUES ('patient40', '$2a$10$NatJcuOeVzzMT2HwY/M1xuxbt1HMXJmLUnGez32imVSjIWBXLipUW', 'patient40', 'm', 40, '40', 0, NULL);
INSERT INTO `patient` VALUES ('patient41', '$2a$10$Ph2SpXdw7EOmR2LUSXsRIuc5ukfSw0Hs6IZLbpH7t3SjrBdZ/jd4K', 'patient41', 'f', 41, '41', 0, NULL);
INSERT INTO `patient` VALUES ('patient42', '$2a$10$IjE3bcKQPDN4Y1T3umHwKOOy1JotpKdK4qXsb/dpkdQsfuJSjisie', 'patient42', 'f', 42, '42', 0, NULL);
INSERT INTO `patient` VALUES ('patient43', '$2a$10$cC2UDYcoNNGDJFybqyxyKuLZCKk1ihmZ7eWS67a/x3VZ2UwXSTKr.', 'patient43', 'm', 43, '43', 0, NULL);
INSERT INTO `patient` VALUES ('patient44', '$2a$10$I4FpnRKImmB0yDHhysGCJut2A7GkawkOwqHFrZ4Zqs7brQ4uavqLW', 'patient44', 'm', 44, '44', 0, NULL);
INSERT INTO `patient` VALUES ('patient45', '$2a$10$BcckqIdJOLAr4RvDW1sYx.hKPdm0RMP4wfn2T9gp.Oy1HKnFOeV2y', 'patient45', 'f', 45, '45', 0, NULL);
INSERT INTO `patient` VALUES ('patient46', '$2a$10$ouGNpCR1GOhGQTyTOy1O3.PwL4my5sClOrjxt1TlM01vf2dPngF7u', 'patient46', 'f', 46, '46', 0, NULL);
INSERT INTO `patient` VALUES ('patient47', '$2a$10$thYPJR7yhU7PV50845pIw.5PwSsvRtYGZNu08DxRgrMB68DkvKXhu', 'patient47', 'm', 47, '47', 0, NULL);
INSERT INTO `patient` VALUES ('patient48', '$2a$10$GqnKk.Qcf6DAmibcOZ1CkOEVT0WCSULBGZGqGwZZn6M3gDGGbmVDa', 'patient48', 'f', 48, '48', 0, NULL);
INSERT INTO `patient` VALUES ('patient49', '$2a$10$VSJP7rav97x.uPGWh4T8WuJ.bfsNDYCrDyOyynz9MZuINbgU22XCS', 'patient49', 'm', 49, '49', 0, NULL);
INSERT INTO `patient` VALUES ('patient50', '$2a$10$I2DL9Xy128UKSvnuoxvioO5eQfuheuvFMsG4RjjXfZQhRF8zeZ812', 'patient50', 'f', 50, '50', 0, NULL);
INSERT INTO `patient` VALUES ('patient51', '$2a$10$3/Fo5MDYVVcstRu4Cfs7M.wlQLWgaQDv7BfyM4nCBSnksIt3v5g6u', 'patient51', 'f', 51, '51', 0, NULL);
INSERT INTO `patient` VALUES ('patient52', '$2a$10$httAI1NSMld34yuhD/drAeBG0n2BGgrkkdjPPdGVE4MbXFnphEbMG', 'patient52', 'm', 52, '52', 0, NULL);
INSERT INTO `patient` VALUES ('patient53', '$2a$10$g4Ej8Vo33brLc/0vqLZ3iOhtn.QGSkZc/tekUIXpK.bK0QijeG5gu', 'patient53', 'm', 53, '53', 0, NULL);
INSERT INTO `patient` VALUES ('patient54', '$2a$10$Kyc.fbREHx3OgbiPKP0odO8KdC4W6w7d4vIbnaeTG5cQoWsq1u8zC', 'patient54', 'm', 54, '54', 0, NULL);
INSERT INTO `patient` VALUES ('patient55', '$2a$10$nVXbtGZqwjo6kuUKGq4Jku5b2GUBceDZsmaOtAE6bLL7fIBBxTujC', 'patient55', 'm', 55, '55', 0, NULL);
INSERT INTO `patient` VALUES ('patient56', '$2a$10$.70Z/OLv0aCQxGNe/JPMmusg.EnxFu4rS9sPyz1XYEqSoel/TzTCC', 'patient56', 'm', 56, '56', 0, NULL);
INSERT INTO `patient` VALUES ('patient57', '$2a$10$00hv.j.fdxf6RZDaHaWj8OA85SWZAE/31282gyaeiHoT/2pFT09Jy', 'patient57', 'f', 57, '57', 0, NULL);
INSERT INTO `patient` VALUES ('patient58', '$2a$10$cuT8BjYME06XE5oPrpdaB.RWak3qA3MNkEzflmOjcwxKLDug1Km4O', 'patient58', 'f', 58, '58', 0, NULL);
INSERT INTO `patient` VALUES ('patient59', '$2a$10$EYqcpxuTPJoywxl1sMsmb.pMwYIxNhZI1wf1/tt2mINV06Qr3po42', 'patient59', 'm', 59, '59', 0, NULL);
INSERT INTO `patient` VALUES ('patient60', '$2a$10$uWHwDHeL4Iokd3fR/K/54eDvJRzKVKvkbsL7ll1MqJtTy3M1EFMu6', 'patient60', 'm', 60, '60', 0, NULL);
INSERT INTO `patient` VALUES ('patient61', '$2a$10$WFaq44cXaAaQsE6O7JBRp.FiQgmspNamTIfGsWZuGlS9qkU44gP4G', 'patient61', 'f', 61, '61', 0, NULL);
INSERT INTO `patient` VALUES ('patient62', '$2a$10$jl5d6YOyT7fGYVQHd6Jpje/iAsTRnofZOHiTAHb2hC1n1eZykfd9a', 'patient62', 'f', 62, '62', 0, NULL);
INSERT INTO `patient` VALUES ('patient63', '$2a$10$uWxQtz/FQzs/9iAuPRCo3.jZVTNODdlL6xjGGUyINQLzK5mLFzZzC', 'patient63', 'f', 63, '63', 0, NULL);
INSERT INTO `patient` VALUES ('patient64', '$2a$10$KMHO4qa4Wmkfx9wQwLQ11ebtI1LrxwythGnpJyl86Ex.IAzQupIP2', 'patient64', 'm', 64, '64', 0, NULL);
INSERT INTO `patient` VALUES ('patient65', '$2a$10$YxKMIri14exJCLKTwoAVhO9zf0aEWJiy1jR5wv2LQ7z.3y4J9/IbO', 'patient65', 'f', 65, '65', 0, NULL);
INSERT INTO `patient` VALUES ('patient66', '$2a$10$hLpnyuM8Zo5qgaAs5w4g8eMPztDxkhWg8GwqYPlimgFEZ4lGNxluW', 'patient66', 'm', 66, '66', 0, NULL);
INSERT INTO `patient` VALUES ('patient67', '$2a$10$6TKdxZibIhwdxwmE95WNAul8ZehspCQrUF14wRuCZs6SHhatNY6xq', 'patient67', 'f', 67, '67', 0, NULL);
INSERT INTO `patient` VALUES ('patient68', '$2a$10$BmoS4R6gp5GSbC0gpY7r1.V7ftGLB5vT5SWeJ2Sn/sVGZtcaTvUFm', 'patient68', 'm', 68, '68', 0, NULL);
INSERT INTO `patient` VALUES ('patient69', '$2a$10$HUJxFq/Lhbu.Or8HSoyGAO.aXmAfEo0lO8IHgiOlVHiStBYWjZ21y', 'patient69', 'm', 69, '69', 0, NULL);
INSERT INTO `patient` VALUES ('patient70', '$2a$10$x7Exl5SXmwX39n1jINu07eiB/HIRdM.nNSc7zLHm78epX9ivDo4ZW', 'patient70', 'm', 70, '70', 0, NULL);
INSERT INTO `patient` VALUES ('patient71', '$2a$10$E4N802IruHU9AkIRHLV3Ke2DWBFcAok.57S9wmABHanQ./NKhl3n6', 'patient71', 'f', 71, '71', 0, NULL);
INSERT INTO `patient` VALUES ('patient72', '$2a$10$FaTwOti.tiKmVavLYCPHG.VNOeRYbIi/eXTFX7LOI4GNuhMTlqxXS', 'patient72', 'm', 72, '72', 0, NULL);
INSERT INTO `patient` VALUES ('patient73', '$2a$10$lhZEMYYO4wG.YPO.9wdTcOoZ1K3SOqSKE.RkyWqjN1/Bg3b81jziu', 'patient73', 'f', 73, '73', 0, NULL);
INSERT INTO `patient` VALUES ('patient74', '$2a$10$3yrMWtKXDJ/xQOsJE/RlJejgCxEhmqzJM6bDXLNrk3Mjh7ynvUyiS', 'patient74', 'm', 74, '74', 0, NULL);
INSERT INTO `patient` VALUES ('patient75', '$2a$10$gtzrdQNF0EuXwnXHlfODq.SZ4GICc8NSJsaa9UgmcMLh5/pa2J0km', 'patient75', 'm', 75, '75', 0, NULL);
INSERT INTO `patient` VALUES ('patient76', '$2a$10$J7cR1nAFBc8WxKNHb6uRQ.oqyMZzNke3q9TS9b03Mq49L/sM2b3Mu', 'patient76', 'f', 76, '76', 0, NULL);
INSERT INTO `patient` VALUES ('patient77', '$2a$10$ISylyggTYZ5K9yLTHwuz1.dJ8ZWEiYlklCDDNkfJKvENjggqUA7Ti', 'patient77', 'm', 77, '77', 0, NULL);
INSERT INTO `patient` VALUES ('patient78', '$2a$10$D4VIt0e0qHEjaWC8oU8mB.JATlxkCCxX39161ALxamb2Qczt9YnMO', 'patient78', 'f', 78, '78', 0, NULL);
INSERT INTO `patient` VALUES ('patient79', '$2a$10$HUlISfU9Q5Cq1Kbj7DR/fuOr83F.YqvNmQBa4fG.5g/ZY.EQvcwCi', 'patient79', 'm', 79, '79', 0, NULL);
INSERT INTO `patient` VALUES ('patient80', '$2a$10$7H8MJXRVj0Ocu9FYo4lJ4uZuNA5ceShEzFGLiPTft4mf1Mp9k9DHS', 'patient80', 'f', 80, '80', 0, NULL);
INSERT INTO `patient` VALUES ('patient81', '$2a$10$EOKhcoWRAj2WuCw6U6b1yej0SspxUsTTwLn2Wwe3a82oppm1NuWre', 'patient81', 'f', 81, '81', 0, NULL);
INSERT INTO `patient` VALUES ('patient82', '$2a$10$gY7NZcj6HqDrDO49YkVWcegY.AXXBw27rC6T46hH39CKfixIlCPPa', 'patient82', 'm', 82, '82', 0, NULL);
INSERT INTO `patient` VALUES ('patient83', '$2a$10$8P96qqlQ1.Z9yrDmvFvFvu0CFWRty4ouA0LQRGehKjRfG2etALyum', 'patient83', 'f', 83, '83', 0, NULL);
INSERT INTO `patient` VALUES ('patient84', '$2a$10$7seat7.CmisdriSWAyIXHuD61xavIGj1F2BoxBn2pVhGGWnGka4jC', 'patient84', 'm', 84, '84', 0, NULL);
INSERT INTO `patient` VALUES ('patient85', '$2a$10$vw6GGSIR7hM4TpjTpyJY5Oe..1DY8uXtl6NECXG6u9s9Rch2i9Lba', 'patient85', 'f', 85, '85', 0, NULL);
INSERT INTO `patient` VALUES ('patient86', '$2a$10$lnCliMApMg7bCKlfMbNixuA33R8i5l3hSbC4fa4HAv0/2EChovbRa', 'patient86', 'm', 86, '86', 0, NULL);
INSERT INTO `patient` VALUES ('patient87', '$2a$10$zBQd8PlSENozaLlC9reeTO7emzUOCHJJ4m4Aq8u8WKQEW6UPdzKrO', 'patient87', 'f', 87, '87', 0, NULL);
INSERT INTO `patient` VALUES ('patient88', '$2a$10$ZnH/VvGZi0.4/xiLIfhoEO0U221cR7ETa10k5HSqYQE.jSHjZwK.6', 'patient88', 'm', 88, '88', 0, NULL);
INSERT INTO `patient` VALUES ('patient89', '$2a$10$ZCbxijgmqkLNpTALiz3ceeJoHjtGWk2Rs.0d8wVLuWfDOcQHrFex.', 'patient89', 'f', 89, '89', 0, NULL);
INSERT INTO `patient` VALUES ('patient90', '$2a$10$wWYpCuwqwLuCw7.N0rQx2.uZ8Z/eGw0H75g72SGn/WVNpXkTHy27G', 'patient90', 'f', 90, '90', 0, NULL);
INSERT INTO `patient` VALUES ('patient91', '$2a$10$b.U5t09t6hRZJubxrvyOJum7ELH7hnIFbIMSlbsqvkR.HN5.IJMKC', 'patient91', 'f', 91, '91', 0, NULL);
INSERT INTO `patient` VALUES ('patient92', '$2a$10$kQ1QYNc1dkiNla4afmk4VO8NuefMH/ddCrSowrXMYOtl6OpAhbcpi', 'patient92', 'f', 92, '92', 0, NULL);
INSERT INTO `patient` VALUES ('patient93', '$2a$10$u9uUkQzGBWxR0aEriSgxPufqAcEehWMwcZTe6cqqkLQXz40cAArn.', 'patient93', 'm', 93, '93', 0, NULL);
INSERT INTO `patient` VALUES ('patient94', '$2a$10$Yvh.KB.t/R7JaWxeXsdIGufM9A9zFp40En4Ay4DvUWVnYZ/KST84e', 'patient94', 'm', 94, '94', 0, NULL);
INSERT INTO `patient` VALUES ('patient95', '$2a$10$TPDOJexwWWxpXO50s0XPM.tBXw0yw/U5FrMC9gRwQpxshP3R4QsQ2', 'patient95', 'm', 95, '95', 0, NULL);
INSERT INTO `patient` VALUES ('patient96', '$2a$10$eMt5Y6ITXzMxRtkiXUVdBeq4sTeKQWVoSgjmPm7Rm3CqCBztIhO5.', 'patient96', 'f', 96, '96', 0, NULL);
INSERT INTO `patient` VALUES ('patient97', '$2a$10$y1NEazfeq9ckKOU5BXq6iu5LLppM0ZDgsu9pfaQMXQcQJTMLY8x.e', 'patient97', 'm', 97, '97', 0, NULL);
INSERT INTO `patient` VALUES ('patient98', '$2a$10$PDzKRh42tJdxrmqhnyy4Ru4ufr1DOBPZRQyqykleAr1VyA2.gifbK', 'patient98', 'f', 98, '98', 0, NULL);
INSERT INTO `patient` VALUES ('patient99', '$2a$10$ndK7s.bq9Eo4/OQMRs8miewVmoivL.Z2nfJtquq7CuEcCssLuLfK.', 'patient99', 'm', 99, '99', 0, NULL);

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
INSERT INTO `project` VALUES ('project10017', 'department02', 480000, '10017', NULL);
INSERT INTO `project` VALUES ('project10018', 'department08', 60000, '10018', NULL);
INSERT INTO `project` VALUES ('project10019', 'department08', 180000, '10019', NULL);
INSERT INTO `project` VALUES ('project10020', 'department06', 180000, '10020', NULL);
INSERT INTO `project` VALUES ('project10021', 'department01', 60000, '10021', NULL);
INSERT INTO `project` VALUES ('project10022', 'department08', 180000, '10022', NULL);
INSERT INTO `project` VALUES ('project10023', 'department01', 60000, '10023', NULL);
INSERT INTO `project` VALUES ('project10024', 'department03', 600000, '10024', NULL);
INSERT INTO `project` VALUES ('project10025', 'department01', 120000, '10025', NULL);
INSERT INTO `project` VALUES ('project10026', 'department04', 540000, '10026', NULL);
INSERT INTO `project` VALUES ('project10030', 'department08', 120000, '10030', NULL);
INSERT INTO `project` VALUES ('project10031', 'department03', 180000, '10031', NULL);
INSERT INTO `project` VALUES ('project10032', 'department07', 180000, '10032', NULL);
INSERT INTO `project` VALUES ('project10033', 'department03', 120000, '10033', NULL);
INSERT INTO `project` VALUES ('project10034', 'department05', 540000, '10034', NULL);
INSERT INTO `project` VALUES ('project10035', 'department06', 540000, '10035', NULL);
INSERT INTO `project` VALUES ('project20017', 'department05', 600000, '20017', NULL);
INSERT INTO `project` VALUES ('project20018', 'department04', 60000, '20018', NULL);
INSERT INTO `project` VALUES ('project20019', 'department03', 360000, '20019', NULL);
INSERT INTO `project` VALUES ('project20020', 'department02', 420000, '20020', NULL);
INSERT INTO `project` VALUES ('project20021', 'department05', 540000, '20021', NULL);
INSERT INTO `project` VALUES ('project20022', 'department03', 420000, '20022', NULL);
INSERT INTO `project` VALUES ('project20023', 'department01', 600000, '20023', NULL);
INSERT INTO `project` VALUES ('project20024', 'department03', 540000, '20024', NULL);
INSERT INTO `project` VALUES ('project20025', 'department01', 60000, '20025', NULL);
INSERT INTO `project` VALUES ('project20026', 'department09', 120000, '20026', NULL);
INSERT INTO `project` VALUES ('project20027', 'department01', 180000, '20027', NULL);
INSERT INTO `project` VALUES ('project20028', 'department02', 60000, '20028', NULL);
INSERT INTO `project` VALUES ('project20029', 'department05', 600000, '20029', NULL);
INSERT INTO `project` VALUES ('project20030', 'department02', 300000, '20030', NULL);
INSERT INTO `project` VALUES ('project20031', 'department09', 240000, '20031', NULL);
INSERT INTO `project` VALUES ('project20032', 'department03', 120000, '20032', NULL);
INSERT INTO `project` VALUES ('project20033', 'department09', 120000, '20033', NULL);
INSERT INTO `project` VALUES ('project20034', 'department05', 600000, '20034', NULL);
INSERT INTO `project` VALUES ('project20035', 'department06', 600000, '20035', NULL);
INSERT INTO `project` VALUES ('project30017', 'department05', 360000, '30017', NULL);
INSERT INTO `project` VALUES ('project30018', 'department09', 300000, '30018', NULL);
INSERT INTO `project` VALUES ('project30019', 'department09', 480000, '30019', NULL);
INSERT INTO `project` VALUES ('project30020', 'department04', 480000, '30020', NULL);
INSERT INTO `project` VALUES ('project30021', 'department09', 180000, '30021', NULL);
INSERT INTO `project` VALUES ('project30022', 'department09', 420000, '30022', NULL);
INSERT INTO `project` VALUES ('project30023', 'department07', 420000, '30023', NULL);
INSERT INTO `project` VALUES ('project30024', 'department02', 600000, '30024', NULL);
INSERT INTO `project` VALUES ('project30025', 'department06', 120000, '30025', NULL);
INSERT INTO `project` VALUES ('project30026', 'department07', 300000, '30026', NULL);
INSERT INTO `project` VALUES ('project30027', 'department01', 480000, '30027', NULL);
INSERT INTO `project` VALUES ('project30028', 'department06', 180000, '30028', NULL);
INSERT INTO `project` VALUES ('project30029', 'department04', 360000, '30029', NULL);
INSERT INTO `project` VALUES ('project30030', 'department07', 180000, '30030', NULL);
INSERT INTO `project` VALUES ('project30031', 'department04', 600000, '30031', NULL);
INSERT INTO `project` VALUES ('project30032', 'department09', 600000, '30032', NULL);
INSERT INTO `project` VALUES ('project30033', 'department09', 360000, '30033', NULL);
INSERT INTO `project` VALUES ('project30034', 'department02', 60000, '30034', NULL);
INSERT INTO `project` VALUES ('project30035', 'department06', 300000, '30035', NULL);
INSERT INTO `project` VALUES ('project40017', 'department09', 120000, '40017', NULL);
INSERT INTO `project` VALUES ('project40018', 'department06', 120000, '40018', NULL);
INSERT INTO `project` VALUES ('project40019', 'department02', 60000, '40019', NULL);
INSERT INTO `project` VALUES ('project40020', 'department09', 360000, '40020', NULL);
INSERT INTO `project` VALUES ('project40021', 'department06', 600000, '40021', NULL);
INSERT INTO `project` VALUES ('project40022', 'department04', 240000, '40022', NULL);
INSERT INTO `project` VALUES ('project40023', 'department09', 420000, '40023', NULL);
INSERT INTO `project` VALUES ('project40024', 'department03', 240000, '40024', NULL);
INSERT INTO `project` VALUES ('project40025', 'department03', 120000, '40025', NULL);
INSERT INTO `project` VALUES ('project40026', 'department07', 540000, '40026', NULL);
INSERT INTO `project` VALUES ('project40027', 'department07', 300000, '40027', NULL);
INSERT INTO `project` VALUES ('project40028', 'department01', 120000, '40028', NULL);
INSERT INTO `project` VALUES ('project40029', 'department07', 60000, '40029', NULL);
INSERT INTO `project` VALUES ('project40030', 'department06', 600000, '40030', NULL);
INSERT INTO `project` VALUES ('project40031', 'department05', 180000, '40031', NULL);
INSERT INTO `project` VALUES ('project40032', 'department05', 360000, '40032', NULL);
INSERT INTO `project` VALUES ('project40033', 'department01', 420000, '40033', NULL);
INSERT INTO `project` VALUES ('project40034', 'department03', 120000, '40034', NULL);
INSERT INTO `project` VALUES ('project40035', 'department07', 420000, '40035', NULL);
INSERT INTO `project` VALUES ('project50017', 'department07', 60000, '50017', NULL);
INSERT INTO `project` VALUES ('project50018', 'department06', 120000, '50018', NULL);
INSERT INTO `project` VALUES ('project50019', 'department05', 540000, '50019', NULL);
INSERT INTO `project` VALUES ('project50020', 'department05', 480000, '50020', NULL);
INSERT INTO `project` VALUES ('project50021', 'department01', 480000, '50021', NULL);
INSERT INTO `project` VALUES ('project50022', 'department02', 180000, '50022', NULL);
INSERT INTO `project` VALUES ('project50023', 'department07', 60000, '50023', NULL);
INSERT INTO `project` VALUES ('project50024', 'department07', 360000, '50024', NULL);
INSERT INTO `project` VALUES ('project50025', 'department05', 300000, '50025', NULL);
INSERT INTO `project` VALUES ('project50026', 'department07', 420000, '50026', NULL);
INSERT INTO `project` VALUES ('project50027', 'department06', 420000, '50027', NULL);
INSERT INTO `project` VALUES ('project50028', 'department08', 480000, '50028', NULL);
INSERT INTO `project` VALUES ('project50029', 'department07', 480000, '50029', NULL);
INSERT INTO `project` VALUES ('project50030', 'department05', 300000, '50030', NULL);
INSERT INTO `project` VALUES ('project50031', 'department05', 60000, '50031', NULL);
INSERT INTO `project` VALUES ('project50032', 'department05', 180000, '50032', NULL);
INSERT INTO `project` VALUES ('project50033', 'department04', 240000, '50033', NULL);
INSERT INTO `project` VALUES ('project50034', 'department07', 180000, '50034', NULL);
INSERT INTO `project` VALUES ('project50035', 'department04', 420000, '50035', NULL);

SET FOREIGN_KEY_CHECKS = 1;

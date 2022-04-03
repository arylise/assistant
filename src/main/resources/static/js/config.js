const ROLE = {
    ROLE_ADMIN: "ROLE_ADMIN",
    ROLE_DOCTOR: "ROLE_DOCTOR",
    ROLE_PATIENT: "ROLE_PATIENT"
}


const admin = [
    {
        "name": "首页",
        "icon": "&#xe68e;",
        "url": "/index",
        "list": [],
    }, {
        "name": "用户管理",
        "icon": "&#xe612;",
        "baseUrl": "/admin",
        "list": [{
            "name": "医生用户",
            "url": "/page_doctor"
        }, {
            "name": "患者用户",
            "url": "/page_patient"
        }]
    }, {
        "name": "医院管理",
        "icon": "&#xe612;",
        "baseUrl": "/admin",
        "list": [{
            "name": "检查科室",
            "url": "/page_department"
        }, {
            "name": "节点管理",
            "url": "/page_mapnode"
        }, {
            "name": "地图管理",
            "url": "/page_map"
        }]
    }, {
        "name": "测试页面",
        "icon": "&#xe612;",
        "baseUrl": "/test",
        "list": [{
            "name": "redis测试",
            "url": "/test_redis"
        }, {
            "name": "医生管理测试",
            "url": "/test_page_doctor"
        }, {
            "name": "科室管理测试",
            "url": "/test_page_department"
        }, {
            "name": "测试1",
            "url": "/test_1"
        }, {
            "name": "测试2",
            "url": "/test_2"
        }, {
            "name": "测试3",
            "url": "/test_3"
        }, {
            "name": "测试4",
            "url": "/test_4"
        }]
    }, {
        "name": "退出登录",
        "icon": "&#xe65c;",
        "url": "/logout",
        "list": []
    }
];

const doctor = [
    {
        "name": "首页",
        "icon": "&#xe68e;",
        "url": "/index",
        "list": [],
    }, {
        "name": "文章管理",
        "icon": "&#xe609;",
        "url": "",
        "list": [{
            "name": "栏目管理",
            "url": "/type_index.html"
        }, {
            "name": "文章管理",
            "url": "/article_index.html"
        }]
    }, {
        "name": "退出登录",
        "icon": "&#xe65c;",
        "url": "/logout",
        "list": []
    }
];


const patient = [
    {
        "name": "首页",
        "icon": "&#xe68e;",
        "url": "/index",
        "list": [],
    }, {
        "name": "测试页面",
        "icon": "&#xe612;",
        "baseUrl": "/test",
        "list": [{
            "name": "register",
            "url": ""
        }]
    }, {
        "name": "测试页面",
        "icon": "&#xe612;",
        "baseUrl": "/test",
        "list": [{
            "name": "redis测试",
            "url": "/test_redis"
        }, {
            "name": "测试1",
            "url": "/test_1"
        }, {
            "name": "测试2",
            "url": "/test_2"
        }, {
            "name": "测试3",
            "url": "/test_3"
        }, {
            "name": "测试4",
            "url": "/test_4"
        }]
    }, {
        "name": "退出登录",
        "icon": "&#xe65c;",
        "url": "/logout",
        "list": []
    }
];

let menu;

// function getLevel() {
$.ajax({
    type: 'GET',
    url: '/checkRole',
    async: false,
    success: function (data) {
        if (data === ROLE.ROLE_ADMIN) {
            menu = admin;
        }
        if (data === ROLE.ROLE_DOCTOR) {
            menu = doctor;
        }
        if (data === ROLE.ROLE_PATIENT) {
            menu = patient;
        }
    }
})
// const oAjax = new XMLHttpRequest();
// oAjax.open('GET', '/checkRole', false);//false表示同步请求
// oAjax.onreadystatechange = function () {
//     //6,通过状态确认完成
//     if (oAjax.readyState === 4 && oAjax.status === 200) {
//         //7,获取返回值，解析json格式字符串为对象
//         var data = oAjax.responseText;
//         if (data === ROLE.ROLE_ADMIN) {
//             menu = admin;
//         }
//         if (data === ROLE.ROLE_DOCTOR) {
//             menu = doctor;
//         }
//         if (data === ROLE.ROLE_PATIENT) {
//             menu = patient;
//         }
//     } else {
//         console.log(oAjax);
//     }
// };
// oAjax.send();
// }
//
// getLevel();


const config = {
    name: "检查助手",
};

// try {
//     module.exports.name = config.name;
//     module.exports.menu = config.menu;
//     module.exports.baseUrl = config.baseUrl;
// } catch (e) {
//
// }
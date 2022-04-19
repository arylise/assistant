const ROLE = {
    ADMIN: "admin",
    DOCTOR: "doctor",
    PATIENT: "patient"
}


const admin = [
    {
        "name": "首页",
        "icon": "&#xe68e;",
        "url": "/index",
        "list": [],
    }, {
        "name": "线上管理",
        "icon": "&#xe612;",
        "list": [{
            "name": "医生在线用户",
            "url": "/page_doctorAct"
        }, {
            "name": "患者在线用户",
            "url": "/page_patientAct "
        }]
    }, {
        "name": "医院管理",
        "icon": "&#xe612;",
        "list": [{
            "name": "检查科室",
            "url": "/page_project"
        }, {
            "name": "节点管理",
            "url": "/page_mapnode"
        }, {
            "name": "地图查看",
            "url": "/page_map"
        }]
    }, {
        "name": "用户管理",
        "icon": "&#xe612;",
        "list": [{
            "name": "医生用户",
            "url": "/page_doctor"
        }, {
            "name": "患者用户",
            "url": "/page_patient"
        }]
    }, {
        "name": "评论专区",
        "icon": "&#xe609;",
        "list": [{
            "name": "查看评论",
            "url": "/message_check"
        },{
            "name": "写评论",
            "url": "/message_write"
        }]
    }, {
        "name": "退出登录",
        "icon": "&#xe65c;",
        "url": "/logout",
        "list": []
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
            "url": "/test_page_project"
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
    }
];

const doctor = [
    {
        "name": "首页",
        "icon": "&#xe68e;",
        "url": "/index",
        "list": [],
    }, {
        "name": "个人信息管理",
        "icon": "&#xe66f;",
        "list": [{
            "name": "信息管理",
            "url": "/page_info"
        }]
    }, {
        "name": "患者管理",
        "icon": "&#xe66f;",
        "list": [{
            "name": "患者清单管理",
            "url": "/page_patient"
        }, {
            "name": "在线患者",
            "url": "/page_activity"
        }]
    }, {
        "name": "科室管理",
        "icon": "&#xe66f;",
        "list": [{
            "name": "科室排队",
            "url": "/page_queue"
        }]
    }, {
        "name": "评论专区",
        "icon": "&#xe609;",
        "list": [{
            "name": "查看评论",
            "url": "/message_check"
        },{
            "name": "写评论",
            "url": "/message_write"
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

        "name": "挂号管理",
        "icon": "&#xe612;",
        "list": [{
            "name": "查看清单",
            "url": "/page_projects"
        }, {
            "name": "排队情况",
            "url": "/page_queue"
        }]
    }, {
        "name": "排队推荐",
        "icon": "&#xe612;",
        "list": [{
            "name": "推荐路径",
            "url": "/page_path"
        }]
    }, {
        "name": "评论专区",
        "icon": "&#xe609;",
        "list": [{
            "name": "查看评论",
            "url": "/message_check"
        },{
            "name": "写评论",
            "url": "/message_write"
        }]
    }, {
        "name": "退出登录",
        "icon": "&#xe65c;",
        "url": "/logout",
        "list": []
    }
];

let menu,
    role,
    name

// function getLevel() {
$.ajax({
    type: 'GET',
    url: '/checkRole',
    async: false,
    success: function (resp) {
        let r = resp['role']
        name = resp['name']
        if (r === ROLE.ADMIN) {
            menu = admin;
            role = "管理员";
        }
        if (r === ROLE.DOCTOR) {
            menu = doctor;
            role = "医生";
        }
        if (r === ROLE.PATIENT) {
            menu = patient;
            role = "患者";
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
    hello: "你好" + role + name
};

// try {
//     module.exports.name = config.name;
//     module.exports.menu = config.menu;
//     module.exports.baseUrl = config.baseUrl;
// } catch (e) {
//
// }
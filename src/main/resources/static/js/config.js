const ROLE = {
    ROLE_ADMIN: "ROLE_ADMIN",
    ROLE_DOCTOR: "ROLE_DOCTOR",
    ROLE_PATIENT: "ROLE_PATIENT"
}


const admin = [{
    "name": "首页",
    "icon": "&#xe68e;",
    "url": "/",
    "list": [],
}, {
    "name": "用户管理",
    "icon": "&#xe612;",
    "url": "",
    "list": [{
        "name": "医生用户",
        "url": "/admin/management?role=doctor"
    }, {
        "name": "患者用户",
        "url": "/admin/management?role=patient"
    }]
},{
    "name": "测试页面",
    "icon": "&#xe612;",
    "url": "",
    "list": [{
        "name": "测试1",
        "url": "/test/test?n=1"
    },{
        "name": "测试2",
        "url": "/test/test?n=2"
    },{
        "name": "测试3",
        "url": "/test/test?n=3"
    }]
}, {
    "name": "退出登录",
    "icon": "&#xe65c;",
    "url": "/logout",
    "list": []
}];

const doctor = [{
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
}];


const patient = [{
    "name": "首页",
    "icon": "&#xe68e;",
    "url": "/index",
    "list": [],
}, {
    "name": "退出登录",
    "icon": "&#xe65c;",
    "url": "/logout",
    "list": []
}];

let menu;

function getLevel() {
    const oAjax = new XMLHttpRequest();
    oAjax.open('GET', '/checkRole', false);//false表示同步请求
    oAjax.onreadystatechange = function () {
        //6,通过状态确认完成
        if (oAjax.readyState === 4 && oAjax.status === 200) {
            //7,获取返回值，解析json格式字符串为对象
            var data = oAjax.responseText;
            if (data === ROLE.ROLE_ADMIN) {
                menu = admin;
            }
            if (data === ROLE.ROLE_DOCTOR) {
                menu = doctor;
            }
            if (data === ROLE.ROLE_PATIENT) {
                menu = patient;
            }
        } else {
            console.log(oAjax);
        }
    };
    oAjax.send();
}

getLevel();


const config = {
    name: "检查助手",
    menu: menu,
};

try {
    module.exports.name = "检查助手";
    module.exports.menu = menu;
} catch (e) {

}
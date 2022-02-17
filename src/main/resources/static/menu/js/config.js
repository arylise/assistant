const level = {
    ADMIN: "ADMIN",
    DOCTOR: "DOCTOR",
    PATIENT: "PATIENT",
    UNKNOWN: "UNKNOWN"
}


const admin = [{
    "name": "首页",
    "icon": "&#xe68e;",
    "url": "index",
    "hidden": false,
    "list": [],
    "level": level.UNKNOWN
}, {
    "name": "基本组件",
    "icon": "&#xe653;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "layui基本组件",
        "url": "pages_component.html",
    }, {
        "name": "layui内置模块",
        "url": "pages_model.html"
    }, {
        "name": "提示框",
        "url": "pages_msg.html"
    }],
    "level": 1
}, {
    "name": "用户管理",
    "icon": "&#xe612;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "用户列表",
        "url": "user_index.html"
    }, {
        "name": "添加用户",
        "url": "user_add.html"
    }]
}, {
    "name": "文章管理",
    "icon": "&#xe609;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "栏目管理",
        "url": "type_index.html"
    }, {
        "name": "文章管理",
        "url": "article_index.html"
    }]
}, {
    "name": "系统设置",
    "icon": "&#xe620;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "网站设置",
        "url": "web_index.html"
    }, {
        "name": "友情连接",
        "url": "flink_index.html"
    }, {
        "name": "导航管理",
        "url": "nav_index.html"
    }, {
        "name": "修改密码",
        "url": "web_pwd.html"
    }, {
        "name": "清除缓存",
        "url": "web_cache.html"
    }, {
        "name": "登录页",
        "url": "login.html"
    }]
}, {
    "name": "数据库",
    "icon": "&#xe857;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "备份数据库",
        "url": "db_backup.html"
    }, {
        "name": "还原数据库",
        "url": "db_reduction.html"
    }]
}, {
    "name": "退出登录",
    "icon": "&#xe65c;",
    "url": "logout",
    "list": []
}];

const doctor = [{
    "name": "首页",
    "icon": "&#xe68e;",
    "url": "index",
    "hidden": false,
    "list": [],
    "level": level.ADMIN
}, {
    "name": "文章管理",
    "icon": "&#xe609;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "栏目管理",
        "url": "type_index.html"
    }, {
        "name": "文章管理",
        "url": "article_index.html"
    }]
}, {
    "name": "退出登录",
    "icon": "&#xe65c;",
    "url": "logout",
    "list": []
}];


const patient = [{
    "name": "首页",
    "icon": "&#xe68e;",
    "url": "index",
    "hidden": false,
    "list": [],
    "level": level.PATIENT
}, {
    "name": "退出登录",
    "icon": "&#xe65c;",
    "url": "logout",
    "list": []
}];

let menu;

function getLevel() {
    const oAjax = new XMLHttpRequest();
    oAjax.open('GET', '/user/level', false);//false表示同步请求
    oAjax.onreadystatechange = function () {
        //6,通过状态确认完成
        if (oAjax.readyState === 4 && oAjax.status === 200) {
            //7,获取返回值，解析json格式字符串为对象
            var data = oAjax.responseText;
            if (data === level.ADMIN) {
                menu = admin;
            }
            if (data === level.DOCTOR) {
                menu = doctor;
            }
            if (data === level.PATIENT) {
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
    version: 'v0.1',
    official: ''
};

try {
    module.exports.name = "检查助手";
    module.exports.menu = menu;
} catch (e) {

}
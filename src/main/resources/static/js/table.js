layui.use(['table'], function () {

    const table = layui.table;

    table.render({
        elem: page_config.elem
        , toolbar: page_config.toolbar
        , defaultToolbar: [
            {title: '获取选中行数据', layEvent: 'getCheckData', icon: 'layui-icon-tips'}
            , {title: '获取选中数目', layEvent: 'getCheckLength', icon: 'layui-icon-tips'}
            , {title: '验证是否全选', layEvent: 'isAll', icon: 'layui-icon-tips'}
            , 'filter'
            , 'exports'
            , 'print'
        ]
        , height: '100%'
        , width: '100%'
        , title: page_config.title
        , even: true
        , skin: 'row'
        , url: page_config.url
        , limit: 20
        , page: true //开启分页
        , cols: page_config.cols
    })

    //监听表格复选框选择
    table.on('checkbox(list-listener)', function (obj) {
        console.log(obj)
    });

    //头工具栏事件
    table.on('toolbar(list-listener)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);
        switch (obj.event) {
            case 'getCheckData':
                var data = checkStatus.data;
                layer.alert(JSON.stringify(data));
                break;
            case 'getCheckLength':
                var data = checkStatus.data;
                layer.msg('选中了：' + data.length + ' 个');
                break;
            case 'isAll':
                layer.msg(checkStatus.isAll ? '全选' : '未全选');
                break;

            //自定义头工具栏右侧图标 - 提示
            case 'LAYTABLE_TIPS':
                layer.alert('这是工具栏右侧自定义的一个图标按钮');
                break;
        }

    });

    //监听工具条
    table.on('tool(list-listener)', function (obj) {
        // alert("work!!");
        var data = obj.data;
        if (obj.event === 'detail') {
            layer.msg('ID：' + data.id + ' 的查看操作');
        } else if (obj.event === 'del') {
            layer.confirm('真的删除行么', function (index) {
                obj.del();
                layer.close(index);
            });
        } else if (obj.event === 'edit') {
            layer.alert('编辑行：<br>' + JSON.stringify(data))
        }
    });

});
new Vue({
    el: '#app',
    data: {
        webname: config.name,
        menu: menu,
    },
    methods: {
        onActive: function (pid1, pid2) {
            if (pid2 == null) {
                let data = this.menu[pid1];
                if (data.url.length > 0) {
                    window.location.href = data.url;
                    $("#a1").text(data.name);
                    $("#a2").text("");
                }
            } else {
                let data = this.menu[pid1].list[pid2];
                // if (data.url.length > 0) {
                window.open(this.menu[pid1].baseUrl + data.url, "main");
                $("#a1").text(this.menu[pid1].name);
                $("#a2").text(data.name);
                // }
            }
        }
    }
})

window.onbeforeunload = function delCache() {
    sessionStorage.clear();
    localStorage.clear();
}

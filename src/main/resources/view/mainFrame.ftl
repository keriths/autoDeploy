<!DOCTYPE html>
<html>
<head>
    <title>平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="http://api.bandexlife.cn/backend/css/easyui.css" rel="stylesheet" type="text/css" />
</head>
<body class="easyui-layout" style="background: #ccc;">
<div id="topdiv" region="north" class="head" style="background: #ccc;">
    <span><img height="25px" width="25px" src=""/>后台</span>
    <div class="user">
        你好，<b>系统管理员</b><span>|</span><a
            onclick="javascript:addTab('修改密码','http://api.bandexlife.cn/backend/system/admin/editPassword');" href="javascript:;" title="修改密码">修改密码</a><span>|</span><a href="http://api.bandexlife.cn/backend/logout" target="_top">退出</a>
    </div>
</div>
<div region="west" title="导航菜单" class="left">
    <div id="menubox" class="easyui-accordion">
        <div title="菜单1" class="firstMenu">
            <ul class="easyui-tree">
                <li>
                    <a  href="http://www.baidu.com" >百度</a>
                </li>
                <li>
                    <a  href="http://www.dianping.com" >点评</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div id="mainPanle" region="center" class="right">
    <div id="tabs" class="easyui-tabs man-tab" fit="true" border="false">
        <!--<div title="首页" id="home">-->
        <!--<div class="quick-menu">-->
        <!--</div>-->
        <!--<div id="mainPanle_frame">-->

        <!--</div>-->
        <!--<iframe name="" class="iframe-main" scrolling="auto" frameborder="0" src="" style="width:100%"></iframe>-->
        <!--</div>-->
    </div>
</div>
<!--mainPanle-->


<script src="http://api.bandexlife.cn/backend/js/jquery.min.js" type="text/javascript"></script>
<script src="http://api.bandexlife.cn/backend/js/jquery.easyui.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#menubox").find("li").each(function(){
            var _menuLi = $(this);
            _menuLi.find("a").each(function(){
                var _menuA = $(this);
                var menuhref = _menuA.attr("href");
                var openUrl = _menuA.attr("openUrl");
                if(openUrl==null){
                    openUrl=menuhref;
                }
                _menuA.attr("href","javascript:void(0);");
                var title = _menuA.attr("title");
                if(title == null){
                    title = _menuA.text();
                }
                _menuLi.click(function(){
                    openMenu(title,openUrl);
                })
                _menuLi.dblclick(function(){
                    refreashMenu(title,openUrl);
                })
            });
        });
    })
    var openMenu = function(title,openUrl){
        var existed = $('#tabs').tabs('exists', title);
        if(existed){
            $('#tabs').tabs('select', title);
            return;
        }
        addMenuTab(title,openUrl);
    }
    var refreashMenu = function(title,openUrl){
        var existed = $('#tabs').tabs('exists', title);
        if(existed){
            updateMenuTab(title,openUrl);
        }else{
            addMenuTab(title,openUrl);
        }
    }
    var addMenuTab = function(title,openUrl){
        var options = {
            title: title,
            content: createFrame(openUrl),
            closable: true,
            cache: false,
            closed: true,
            width: $('#mainPanle').width() - 10,
            height: $('#mainPanle').height() - 26
        };
        $('#tabs').tabs('add', options);
    }
    var updateMenuTab = function(title,openUrl){
        var options = {
            title: title,
            content: createFrame(openUrl),
            closable: true,
            cache: false,
            closed: true,
            width: $('#mainPanle').width() - 10,
            height: $('#mainPanle').height() - 26
        };
        var thisTab = $("#tabs").tabs('getTab', title);
        $('#tabs').tabs('update', {
            tab: thisTab,
            options: options
        });
        $('#tabs').tabs('select', title);
    }
    function createFrame(url) {
        return '<iframe name="mainFrame" scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    }

    //
    //
    //    function createCookie(name, value, days) {
    //        if (days) {
    //            var date = new Date();
    //            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    //            var expires = "; expires=" + date.toGMTString();
    //        } else var expires = "";
    //        document.cookie = name + "=" + value + expires + "; path=/";
    //    }
    //    function readCookie(name) {
    //        var nameEQ = name + "=";
    //        var ca = document.cookie.split(';');
    //        for (var i = 0; i < ca.length; i++) {
    //            var c = ca[i];
    //            while (c.charAt(0) == ' ')c = c.substring(1, c.length);
    //            if (c.indexOf(nameEQ) == 0)return c.substring(nameEQ.length, c.length);
    //        }
    //        return null;
    //    }
    //    function eraseCookie(name) {
    //        createCookie(name, "", -1);
    //    }
    //    function switchStylestyle(styleName) {
    //        $('link[rel*=style][title]').each(function (i) {
    //            this.disabled = true;
    //            if (this.getAttribute('title') == styleName) this.disabled = false;
    //        });
    //        createCookie('style', styleName, 365);
    //    }
    //    function addTab(title, href, update) {
    //        var options = {
    //            title: title,
    //            content: createFrame(href),
    //            closable: true,
    //            cache: false,
    //            closed: true,
    //            width: $('#mainPanle').width() - 10,
    //            height: $('#mainPanle').height() - 26
    //        };
    //        var existed = $('#tabs').tabs('exists', title);
    //        if (existed) {
    //            var thisTab = $("#tabs").tabs('getTab', title);
    //            if (update) {
    //                $('#tabs').tabs('update', {
    //                    tab: thisTab,
    //                    options: options
    //                });
    //            }
    //            $('#tabs').tabs('select', title);
    //        } else {
    //            $('#tabs').tabs('add', options);
    //        }
    //    }
    //    function closeSelf() {
    //        var thisTab = $("#tabs").tabs("getSelected");
    //        var thisTabIndex = $("#tabs").tabs("getTabIndex", thisTab);
    //        $("#tabs").tabs("close", thisTabIndex);
    //    }
    //    function closeThenAddTab(title, href, update) {
    //        closeSelf();
    //        addTab(title, href, update);
    //    }
    //
    //    $(function () {
    //        $("#mainPanle_frame").html('<iframe class="iframe-main" scrolling="auto" frameborder="0"  src="" style="width:100%;height:100%;"></iframe>');
    //        $(".iframe-main").load(function () {
    //            $(this).height($(window).height() - 100);
    //        });
    //        $('.set-skin a').click(function () {
    //            switchStylestyle(this.getAttribute("rel"));
    //            return false;
    //        });
    //        var c = readCookie('style');
    //        if (c) {
    //            switchStylestyle(c);
    //        }
    //    });
</script>
</body>
</html>
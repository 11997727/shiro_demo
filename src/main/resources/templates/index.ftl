<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 引入Bootstrap核心文件 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery(Bootstrap的JavaScript插件需要引入jQuery，务必在bootstrap.min.js之前引入) -->
    <script src="js/jquery.min.js"></script>

    <!-- 包括所有已编译的JS插件 -->
    <script src="js/bootstrap.min.js"></script>

</head>

<body>


<div class="container" style="font-family:微软雅黑;font-size:larger">
    <div class="page-header">
        <h2 align="center">管理员列表</h2>
        <div align="right">
            <span>操作人:${username}</span>
            <a href="/logout">退出</a>
        </div>
    </div>
    <div class="col-md-offset-2 col-md-8">


        <button type="button" class="btn btn-primary" data-target="#myModal" data-toggle="modal">添加</button>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            添加
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="role" class="col-sm-2 control-label">角色</label>
                            <div class="col-sm-10">
                            <label class="checkbox-inline">
                                <input type="checkbox" id="role" name="role" value="1"> 超级管理员
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="role" value="2"> 普通管理员
                            </label>
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="username" id="username" placeholder="请输入账号">
                            </div>
                        </div>
                            <div class="form-group">
                                <label for="phone" class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入电话">
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
                            </div>
                        </div>

                        </form>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button"  id="add" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>





        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel2">
                            模态框（Modal）标题
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="phone" class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="phone" id="phone2" placeholder="请输入电话">
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" id="updateBtn" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>



        <#if map.code==2001>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <td>账号</td>
                    <td>电话</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>
                </thead>
                <#list map.data as user>
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.phone}</td>
                        <#if user.status==0>
                        <td>正常</td>
                <#else >
                    <td>禁用</td>
                        </#if>
                        <td>
<#--                            <a href="/del/delById">禁用</a>-->
<#--                            <a href="/update/updateById">修改</a>-->
                            <#if user.status==0>
                                <button type="button" id="delBtn" class="btn btn-danger btn-xs" onclick="del(${user.id})">禁用</button>
                            <#else >
                                <button type="button" id="updateStatusBtn" class="btn btn-success btn-xs" onclick="updateStatus(${user.id})">启用</button>
                            </#if>

                            <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal2" onclick="update(${user.id},${user.phone})">修改</button>
                        </td>
                    </tr>
                </#list>
            </table>
        <#else >
            <span>暂无数据</span>
        </#if>


    </div>

</div>



</body>
<script type="text/javascript">
    $(function () {

    })

    function getVal(){
        var chk_value =[];//定义一个数组
        $('input[name="role"]:checked').each(function(){//遍历每一个名字为nodes的复选框，其中选中的执行函数
            chk_value.push($(this).val());//将选中的值添加到数组chk_value中
        });
        // var groups = chk_value.join(",");
        // alert(groups);
        return chk_value
    }
    function del(id){
        $.ajax({
            url:"/del/delById",
            data:{
                "id":id,
            },
            dataType:"json",
            type:"post",
            success:function (res) {
                alert(res.msg)
                window.location.reload()
            }

        })
    }



    function updateStatus(id){
        $.ajax({
            url:"/updateStatus/updateStatusById",
            data:{
                "id":id,
            },
            dataType:"json",
            type:"post",
            success:function (res) {
                alert(res.msg)
                window.location.reload()
            }

        })
    }




    function update(id,phone){
       $('#phone2').val(phone)
        $('#updateBtn').click(function () {
            var $phone = $('#phone2').val();
            if($phone==''){
                alert("请输入电话")
                return
            }
            $.ajax({
                url:"/update/updateById",
                data:{
                    "id":id,
                    "phone":$phone
                },
                dataType:"json",
                type:"post",
                success:function (res) {
                    alert(res.msg)
                    $('#updateBtn').attr("data-dismiss","modal");
                    window.location.reload()
                }

            })
        })

    }

        $('#add').click(function () {
            var $username = $('#username').val();
            var $password = $('#password').val();
            var $phone = $('#phone').val();
            var $roles=getVal();
            if($roles.length==0){
                alert("请选择角色")
                return
            }
            if($username==''){
                alert("请输入账号")
                return
            }
            if($phone==''){
                alert("请输入电话")
                return
            }
            if($password==''){
                alert("请输入密码")
                return
            }
            $.ajax({
                url:"/add/addUser",
                data:{
                    "roles":$roles,
                    "username":$username,
                    "phone":$phone,
                    "password":$password
                },
                dataType:"json",
                type:"post",
                traditional:true,//防止深度序列化
                cache:false,
                async:false,
                success:function (res) {
                    alert(res.msg)
                    $('#add').attr("data-dismiss","modal");
                    window.location.reload()
                }

            })

        })
</script>
</html>

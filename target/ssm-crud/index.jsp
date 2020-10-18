<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%--模态框 新增--%>


<!-- Modal -->
<div class="modal fade" id="model_add_box" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_from" class="col-sm-2 control-label">lastName</label>
                        <div class="col-sm-10">
                            <input type="email" name="empName" class="form-control" id="empName_add_from"
                                   placeholder="lastName">
                            <span id="helpBlock1" class="help-block"></span>
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="empEmail_add_from" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="enail" class="form-control" id="empEmail_add_from"
                                   placeholder="lastName">
                            <span id="helpBlock2" class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_gender" class="col-sm-2 control-label" id="add_gender">gender</label>
                        <div class="col-sm-10">
                            <label>
                                <input type="radio" name="gender" id="man" value="m" checked>
                                男
                            </label>
                            <label>
                                <input type="radio" name="gender" id="woman" value="f">
                                女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dept_Name" class="col-sm-2 control-label" id="dept_Name">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="emp_add_select" name="dId">
                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_add_btn">添加</button>
            </div>
        </div>
    </div>
</div>

<%--模态框 修改--%>
<div class="modal fade" id="model_update_box" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalupdateLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_from" class="col-sm-2 control-label">lastName</label>
                        <div class="col-sm-10">
                            <%--<input type="email" name="empName" class="form-control" id="empName_update_from"
                                   placeholder="lastName">--%>
                                <p class="form-control-static" id="empName_update_from"></p>
                            <span id="updatehelpBlock1" class="help-block"></span>
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="empEmail_add_from" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="enail" class="form-control" id="empEmail_update_from"
                                   placeholder="lastName">
                            <span id="updatehelpBlock2" class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_gender" class="col-sm-2 control-label" id="update_gender">gender</label>
                        <div class="col-sm-10">
                            <label>
                                <input type="radio" name="gender" id="update_man" value="m" checked>
                                男
                            </label>
                            <label>
                                <input type="radio" name="gender" id="update_woman" value="f">
                                女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dept_Name" class="col-sm-2 control-label" id="update_dept_Name">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="emp_update_select" name="dId">
                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>

    </div>
    <%--新增删除按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success" id="dept_add_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_btn">删除</button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="tbd">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_par"></th>
                    <th>#</th>
                    <th>lastName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <div class="col-md-12" id="pageNotice">

        </div>
        <div>
            <div class="col-md-offset-8" id="pagepone">

            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    var totalRecord;
    var currentNum;
    $(function () {
        toPage(1);
    })


    function toPage(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            method: "get",
            data: "pn=" + pn,
            success: function (result) {
                //console.log(result);
                // 分页列表
                pagelist(result);

                pagenotice(result);

                pagepane(result);
            }
        })
    }


    function pagelist(result) {
        $("#tbd tbody").empty();
        var emps = result.record.pageInfo.list;
        $.each(emps, function (index, item) {
            //alert(item.empName);
            var checkTd = $("<td><input type='checkbox' class='check_son'></td>")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var enailTd = $("<td></td>").append(item.enail);
            var genderTd = $("<td></td>").append(item.gender == 'm' ? "男" : "女");
            var deptNameTd = $("<td></td>").append(item.departMent.deptName);
            /*
            * <button class="btn btn-success btn-sm">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                    </button>
                    <button class="btn btn-danger btn-sm">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                    </button>*/
            var editTd = $("<button></button>").addClass("btn btn-success btn-sm edit-btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑"));
            editTd.attr("update_dId",item.empId);
            var delTd = $("<button></button>").addClass("btn btn-danger btn-sm delete-btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash").append("删除"));
            delTd.attr("emp_del_btn",item.empId);
            var buttonTd = $("<td></td>").append(editTd).append(" ").append(delTd);
            $("<tr></tr>").append(checkTd).append(empIdTd).append(empNameTd).append(enailTd).append(genderTd).append(deptNameTd)
                .append(buttonTd).appendTo("#tbd tbody");
        })
    }

    //分页信息条 当前第 页,共有 页,总页数为 条记录
    function pagenotice(result) {
        $("#pageNotice").empty();
        $("#pageNotice").append("当前第" + result.record.pageInfo.pageNum + "页,共有"
            + result.record.pageInfo.pages + "页,总页数为" + result.record.pageInfo.total + "条记录");
        totalRecord = result.record.pageInfo.pages;
        currentNum = result.record.pageInfo.pageNum;
    }

    //分页窗格
    function pagepane(result) {
        $("#pagepone").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var topLi = $("<li></li>").append($("<a></a>").append("<span></span>").append("&laquo;"));

        if (result.record.pageInfo.hasPreviousPage == true) {
            firstLi.click(function () {
                toPage(1);
            });
            topLi.click(function () {
                toPage(result.record.pageInfo.pageNum - 1);
            });
        } else {
            firstLi.addClass("disabled");
            topLi.addClass("disabled");
        }

        var nextLi = $("<li></li>").append($("<a></a>").append("<span></span>").append("&raquo;"));

        var lastLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));

        if (result.record.pageInfo.hasNextPage == true) {
            nextLi.click(function () {
                toPage(result.record.pageInfo.pageNum + 1);
            });
            lastLi.click(function () {
                toPage(result.record.pageInfo.pages);
            });
        } else {
            nextLi.addClass("disabled");
            lastLi.addClass("disabled");
        }

        ul.append(firstLi).append(topLi);
        $.each(result.record.pageInfo.navigatepageNums, function (index, item) {
            var itemli = $("<li></li>").append($("<a></a>").append(item));
            if (result.record.pageInfo.pageNum == item) {
                itemli.addClass("active");
            }
            itemli.click(function () {
                toPage(item);
            })

            ul.append(itemli);
        });
        ul.append(nextLi).append(lastLi);
        $("<nav></nav>").append(ul).appendTo($("#pagepone"));
    }

    $("#dept_add_btn").click(function () {
        /*获取部门信息*/
        //$("#model_add_box form")[0].reset();
        clear_from_data("#model_add_box form");
        getDepts("#model_add_box form");
        $("#model_add_box").modal({
            backdrop: 'static'
        });
    });

    $("#empName_add_from").change(function () {
        var empName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkUser",
            method: "post",
            data: "empName=" + empName,
            success: function (result) {
                if (result.code == 100) {
                    validate_hint_status("#empName_add_from", "success", "");
                    $("#emp_add_btn").attr("vali_empname", "success");
                } else {
                    validate_hint_status("#empName_add_from", "error", result.record.check_user);
                    $("#emp_add_btn").attr("vali_empname", "error");
                }
            }
        })
    })

    $("#emp_add_btn").click(function () {
        // 先校验参数值
        /*var isFlag = validate_emp_add();
        if (!isFlag) {
            return false;
        };*/

        if ($("#emp_add_btn").attr("vali_empname") == "error") {
            return false;
        }
        //alert($("#model_add_box form").serialize());
        $.ajax({
            url: "${APP_PATH}/emps",
            method: "post",
            data: $("#model_add_box form").serialize(),
            success: function (result) {
                //console.log(result);
                console.log(result);
                if (result.code == 100) {
                    //关闭模态框
                    $("#model_add_box").modal("hide");
                    //跳到最后一页数据出来的地方
                    toPage(totalRecord);
                } else {
                    if (undefined != result.record.hib_vali.empName) {
                        validate_hint_status("#empName_add_from", "error", result.record.hib_vali.empName);
                    }

                    if (undefined != result.record.hib_vali.enail) {
                        validate_hint_status("#empEmail_add_from", "error", result.record.hib_vali.enail);
                    }
                }

            }
        });
    });

    function validate_emp_add() {
        var empName = $("#empName_add_from").val();
        var regEmpName = /(^[0-9a-zA-Z_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        //alert(regEmpName.test(empName));
        if (!regEmpName.test(empName)) {
            //alert("用户名为2-5位中文或6-16位的数字字母下划线")
            validate_hint_status("#empName_add_from", "error", "用户名为2-5位中文或6-16位的数字字母下划线");
            return false;
        } else {
            validate_hint_status("#empName_add_from", "success", "");
        }

        var enail = $("#empEmail_add_from").val();
        var regEnail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEnail.test(enail)) {
            //alert("邮箱格式非法");
            validate_hint_status("#empEmail_add_from", "error", "邮箱格式非法");
            return false;
        } else {
            validate_hint_status("#empEmail_add_from", "success", "");
        }
        return true;
    }

    function validate_hint_status(ele, status, msg) {
        //先情况父元素中已有的class
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    function clear_from_data(ele) {
        //还原状态
        $(ele)[0].reset();
        //清空class
        $(ele).find("*").removeClass("has-error has-success");
        //清空文字
        $(ele).find("span").text("");
    }

    function getDepts(ele) {
        //先清空数据 表单清空样式和class和文字
        //$("#model_add_box select").empty();
        //clear_from_data(ele);
        $(ele +" select").empty();
        $.ajax({
            url: "${APP_PATH}/getDepts",
            type: "get",
            success: function (result) {
                //$.each(result.)
                //$("#model_add_box form select")
                console.log(result);
                //$(ele).empty();
                $.each(result.record.record, function () {
                    $(ele + " select").append($("<option></option>")
                        .append(this.deptName).attr("value", this.deptId));
                })

            }
        })
    }

    //员工修改
    //1、我们是按钮创建之前就绑定了click，所以绑定不上。
    //1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
    //jquery新版没有live，使用on进行替代
    $(document).on("click",".edit-btn",function () {
        // 先获取部门信息
        getDepts("#model_update_box form");
        // 获取员工id,上面在遍历的时候已经用update_dId字段放了
        var empId = $(this).attr("update_dId");
        // 点击修改给模态框帮一个属性 值为empId
        $("#emp_update_btn").attr("update_dId",empId);
        //获取员工信息
        getEmp(empId);

        $("#model_update_box").modal({
            backdrop:"static"
        })
    });

    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            method:"get",
            success:function (result) {
                console.log(result);
                $("#empName_update_from").text(result.record.emp.empName);
                $("#empEmail_update_from").val(result.record.emp.enail);
                $("#model_update_box input[name=gender]").val([result.record.emp.gender]);
                $("#model_update_box select").val([result.record.emp.dId]);
            }
        })

    }

    //员工修改
    $("#emp_update_btn").click(function () {
        //判断邮箱是否非法
        var enail = $("#empEmail_update_from").val();
        var regEnail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEnail.test(enail)) {
            //alert("邮箱格式非法");
            validate_hint_status("#empEmail_add_from", "error", "邮箱格式非法");
            return false;
        } else {
            validate_hint_status("#empEmail_add_from", "success", "");
        }

        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("update_dId"),
            type: "PUT",
            data:$("#model_update_box form").serialize(),
            success:function (result) {
                //alert(result);
                //关闭模态框
                $("#model_update_box").modal("hide");
                // 回到当前页
                toPage(currentNum);
            }
        })
    });

    //员工删除
    $(document).on("click",".delete-btn",function () {
        //获取员工id   emp_del_btn
        //alert($(this).parents("tr").find("td:eq(1)").text());
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("您确定要删除"+empName+"吗?")) {
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("emp_del_btn"),
                type:"DELETE",
                success:function (result) {
                    toPage(currentNum);
                }
            })
        }
    });

    //父子绑定
    $("#check_par").click(function () {
        var parentCheck = $(this).prop("checked");
        $(".check_son").prop("checked",parentCheck);
    });

    $(document).on("click",".check_son",function () {
        var flag = $(".check_son:checked").length == $(".check_son").length;
            $("#check_par").prop("checked",flag);
    });

    $("#emp_delete_btn").click(function () {
        //获取选中的状态栏的用户名,用作提示框
        var empNames = "";
        var empIds = "";
        $.each($(".check_son:checked"),function () {
           //alert($(this).parents("tr").find("td:eq(2)").text());
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            empIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        empNames = empNames.substring(0,empNames.length-1);
        empIds = empIds.substring(0,empIds.length-1);
        console.log(empIds);
        if (confirm("您确定要删除"+empNames+"吗?")) {
            //alert(1);
            $.ajax({
                url:"${APP_PATH}/emp/"+empIds,
                type:"delete",
                success:function (result) {
                    alert(result.msg);
                    toPage(currentNum);
                }
            })
        }
    })
</script>
</html>

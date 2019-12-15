function validateClick(){
    //学校
    var reg1=/^[\u0391-\uFFE5]+$/;
    if($("#inStuSchool").val() == ""){
        document.getElementById("spanInStuSchool").innerHTML="*  学校输入不能为空";
        $("#spanInStuSchool").css('display','block');
        $("#inStuSchool").css('border','1px solid red');
        return flag=false;
    }else if(!reg1.test($("#inStuSchool").val())){
        document.getElementById("spanInStuSchool").innerHTML="*  学校输入只能为中文符号";
        $("#spanInStuSchool").css('display','block');
        $("#inStuSchool").css('border','1px solid red');
        return flag=false;
    }else{
        document.getElementById("spanInStuSchool").innerHTML="";
        $("#spanInStuSchool").css('display','none');
        $("#inStuSchool").css('border','1px solid #dddddd');
    }
    //学院
    if($("#inStuDepart").val() == ""){
        document.getElementById("spanInStuDepart").innerHTML="*  输入不能为空";
        $("#spanInStuDepart").css('display','block');
        $("#inStuDepart").css('border','1px solid red');
        return flag=false;
    }else if(!reg1.test($("#inStuDepart").val())){
        document.getElementById("spanInStuDepart").innerHTML="*  输入只能为中文符号";
        $("#spanInStuDepart").css('display','block');
        $("#inStuDepart").css('border','1px solid red');
        return flag=false;
    }else{
        document.getElementById("spanInStuDepart").innerHTML="";
        $("#spanInStuDepart").css('display','none');
        $("#inStuDepart").css('border','1px solid #dddddd');
    }
    //专业验证
    if($("#inStuMajor").val() == "") {
        document.getElementById("spanInStuMajor").innerHTML = "*  输入不能为空";
        $("#spanInStuMajor").css('display', 'block');
        $("#inStuMajor").css('border', '1px solid red');
        return flag=false;
    }else{
        document.getElementById("spanInStuMajor").innerHTML="";
        $("#spanInStuMajor").css('display','none');
        $("#inStuMajor").css('border','1px solid #dddddd');
    }
    //年级
    if($("#inStuGrade").val() == "") {
        document.getElementById("spanInStuGrade").innerHTML = "*  输入不能为空";
        $("#spanInStuGrade").css('display', 'block');
        $("#inStuGrade").css('border', '1px solid red');
        return flag=false;
    }else{
        document.getElementById("spanInStuGrade").innerHTML="";
        $("#spanInStuGrade").css('display','none');
        $("#inStuGrade").css('border','1px solid #dddddd');
    }
    //班级
    if($("#inStuClass").val() == "") {
        document.getElementById("spanInStuClass").innerHTML = "*  输入不能为空";
        $("#spanInStuClass").css('display', 'block');
        $("#inStuClass").css('border', '1px solid red');
        return flag=false;
    }else{
        document.getElementById("spanInStuClass").innerHTML="";
        $("#spanInStuClass").css('display','none');
        $("#inStuClass").css('border','1px solid #dddddd');
    }
    //电话验证
    var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
    if($("#inStuPhone").val()==""){
        $("#spanInStuPhone").css('display','block');
        $("#inStuPhone").css('border','1px solid red');
        document.getElementById("spanInStuPhone").innerHTML="*  电话输入不能为空";
        return flag=false;
    }else if(!myreg.test($("#inStuPhone").val())){
        $("#spanInStuPhone").css('display','block');
        document.getElementById("spanInStuPhone").innerHTML="*  请输入有效的电话号码";
        $("#inStuPhone").css.borderColor="red";
        return flag=false;
    }else{
        $("#spanInStuPhone").css('display','none');
        document.getElementById("spanInStuPhone").innerHTML="";
        $("#inStuPhone").css.borderColor="blue";
    }
}
function stuRegister() {
    //密码验证
    if($("#inStuPassword").val() =="") {
        document.getElementById("spanInStuPassword").innerHTML = "*  密码设置不能为空";
        $("#spanInStuPassword").css('display', 'block');
        $("#inStuPassword").css('border', '1px solid red');
        return flag=false;
    }else if(($("#inStuPassword").val().length <= 5 )&&( $("#inStuPassword").val().length >=17)) {
        document.getElementById("spanInStuPassword").innerHTML = "*  密码设置长度为6-16位";
        $("#spanInStuPassword").css('display', 'block');
        $("#inStuPassword").css('border', '1px solid red');
        return flag=false;
    }else{
        document.getElementById("spanInStuPassword").innerHTML="";
        $("#spanInStuId").css('display','none');
        $("#inStuPassword").css('border','1px solid #dddddd')
    }
    //学号
    var reg = /^[0-9]+$/;
    if($("#inStuId").val()==""){
        $("#spanInStuId").css('display','block');
        $("#inStuId").css('border','1px solid red');
        document.getElementById("spanInStuId").innerHTML="*  学号输入不能为空";
        return flag=false;
    }else if(!reg.test($("#inStuId").val()) ) {
        $("#spanInStuId").css('display', 'block');
        document.getElementById("spanInStuId").innerHTML = "*  学号输入只能是数字";
        $("#inStuId").css.borderColor = "red";
        return flag=false;
    }else{
        $("#spanInStuId").css('display','none');
        $("#inStuId").css('border','1px solid #dddddd');
        document.getElementById("spanInStuId").innerHTML="";
    }
    //姓名
    var reg1=/^[\u0391-\uFFE5]+$/;
    if($("#inStuName").val() == ""){
        document.getElementById("spanInStuName").innerHTML="*  姓名输入不能为空";
        $("#spanInStuName").css('display','block');
        $("#inStuName").css('border','1px solid red');
        return flag=false;
    }else if(!reg1.test($("#inStuName").val())){
        document.getElementById("spanInStuName").innerHTML="*  姓名只能为中文符号";
        $("#spanInStuName").css('display','block');
        $("#inStuName").css('border','1px solid red');
        return flag=false;
    }else{
        document.getElementById("spanInStuName").innerHTML="";
        $("#spanInStuName").css('display','none');
        $("#inStuName").css('border','1px solid #dddddd');
    }
    validateClick();
    //判断是否选中协议
    if (!$('#checkbox-id').prop('checked')) {
        alert("请仔细阅读协议！");
        return;
    }

    let mainComp = $("#mainDiv");
    //获得Canvas对象
    let video = document.getElementById("video");
    let canvas = document.getElementById("canvas");
    let ctx = canvas.getContext('2d');
    ctx.drawImage(video, 0, 0, 250, 250);
    let formData = new FormData();
    //保存当前图片
    var base64File = canvas.toDataURL();
    formData.append("file", base64File);
    formData.append("inStuId", $("#inStuId").val());
    formData.append("inStuPassword", $("#inStuPassword").val());
    formData.append("inStuName", $("#inStuName").val());
    formData.append("inStuSex", $("input[name='inStuSex']:checked").val());
    formData.append("inStuSchool", $("#inStuSchool").val());
    formData.append("inStuDepart", $("#inStuDepart").val());
    formData.append("inStuGrade", $("#inStuGrade").val());
    formData.append("inStuMajor", $("#inStuMajor").val());
    formData.append("inStuClass", $("#inStuClass").val());
    formData.append("inStuPhone", $("#inStuPhone").val());

    $.ajax({
        type: "post",
        url: "/stuRegister",
        data: formData,
        async:false,
        contentType: false,
        processData: false,
        success: function (text) {
            if (text == "register success") {
                alert("恭喜你注册成功");
                window.location.href = 'index';
            } else {
                alert("学号已被注册");
            }
        },
        error: function (error) {
            alert("失败");
        }
    });

}
function validate(){
    var flag;
//密码输入验证
    $('input').on('input propertychange', function() {
        if($("#inStuPassword").val() =="") {
            document.getElementById("spanInStuPassword").innerHTML = "*  密码设置不能为空";
            $("#spanInStuPassword").css('display', 'block');
            $("#inStuPassword").css('border', '1px solid red');
            return flag=false;
        }else if(($("#inStuPassword").val().length <= 5 )||( $("#inStuPassword").val().length >=17)) {
            document.getElementById("spanInStuPassword").innerHTML = "*  密码设置长度为6-16位";
            $("#spanInStuPassword").css('display', 'block');
            $("#inStuPassword").css('border', '1px solid red');
            return flag=false;
        }else{
            document.getElementById("spanInStuPassword").innerHTML="";
            $("#spanInStuId").css('display','none');
            $("#inStuPassword").css('border','1px solid #dddddd');
        }
    });
//学号验证
    $('input').on('input propertychange', function() {
        var reg = /^[0-9]{10}$/;
        if($("#inStuId").val()==""){
            $("#spanInStuId").css('display','block');
            $("#inStuId").css('border','1px solid red');
            document.getElementById("spanInStuId").innerHTML="*  学号输入不能为空";
            return flag=false;
        }else if(!reg.test($("#inStuId").val())) {
            $("#spanInStuId").css('display', 'block');
            document.getElementById("spanInStuId").innerHTML = "*  学号输入有误";
            $("#inStuId").css.borderColor = "red";
            return flag=false;
        }else{
            $("#spanInStuId").css('display','none');
            $("#inStuId").css('border','1px solid #dddddd');
            document.getElementById("spanInStuId").innerHTML="";
        }
    });
//姓名验证
    $('input').on('input propertychange', function()  {
        var reg1=/^[\u0391-\uFFE5]+$/;
        if($("#inStuName").val() == ""){
            document.getElementById("spanInStuName").innerHTML="*  姓名输入不能为空";
            $("#spanInStuName").css('display','block');
            $("#inStuName").css('border','1px solid red');
            return flag=false;
        }else if(!reg1.test($("#inStuName").val())){
            document.getElementById("spanInStuName").innerHTML="*  姓名只能为中文符号";
            $("#spanInStuName").css('display','block');
            $("#inStuName").css('border','1px solid red');
            return flag=false;
        }else{
            document.getElementById("spanInStuName").innerHTML="";
            $("#spanInStuName").css('display','none');
            $("#inStuName").css('border','1px solid #dddddd');
        }
    })
//学校
    $('input').on('input propertychange', function()  {
        var reg1=/^[\u0391-\uFFE5]+$/;
        if($("#inStuSchool").val() == ""){
            document.getElementById("spanInStuSchool").innerHTML="*  学校输入不能为空";
            $("#spanInStuSchool").css('display','block');
            $("#inStuSchool").css('border','1px solid red');
            return flag=false;
        }else if(!reg1.test($("#inStuSchool").val())){
            document.getElementById("spanInStuSchool").innerHTML="*  学校输入只能为中文符号";
            $("#spanInStuSchool").css('display','block');
            $("#inStuSchool").css('border','1px solid red');
            return flag=false;
        }else{
            document.getElementById("spanInStuSchool").innerHTML="";
            $("#spanInStuSchool").css('display','none');
            $("#inStuSchool").css('border','1px solid #dddddd');
        }
    });
//电话验证
    $('input').on('input propertychange', function() {
        var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if($("#inStuPhone").val()==""){
            $("#spanInStuPhone").css('display','block');
            $("#inStuPhone").css('border','1px solid red');
            document.getElementById("spanInStuPhone").innerHTML="*  电话输入不能为空";
            return flag=false;
        }else if(!myreg.test($("#inStuPhone").val())){
            $("#spanInStuPhone").css('display','block');
            document.getElementById("spanInStuPhone").innerHTML="*  请输入有效的电话号码";
            $("#inStuPhone").css('border','1px solid red');
            return flag=false;
        }else{
            $("#spanInStuPhone").css('display','none');
            document.getElementById("spanInStuPhone").innerHTML="";
            $("#inStuPhone").css('border','1px solid #dddddd');
        }
    });
//专业验证
    $('input').on('input propertychange', function() {
        if($("#inStuMajor").val() == "") {
            document.getElementById("spanInStuMajor").innerHTML = "*  输入不能为空";
            $("#spanInStuMajor").css('display', 'block');
            $("#inStuMajor").css('border', '1px solid red');
            return flag=false;
        }else{
            document.getElementById("spanInStuMajor").innerHTML="";
            $("#spanInStuMajor").css('display','none');
            $("#inStuMajor").css('border','1px solid #dddddd');
        }
    });

    //年级
    $('input').on('input propertychange', function() {
    if ($("#inStuGrade").val() == "") {
        document.getElementById("spanInStuGrade").innerHTML = "*  输入不能为空";
        $("#spanInStuGrade").css('display', 'block');
        $("#inStuGrade").css('border', '1px solid red');
        return flag = false;
    } else {
        document.getElementById("spanInStuGrade").innerHTML = "";
        $("#spanInStuGrade").css('display', 'none');
        $("#inStuGrade").css('border', '1px solid #dddddd');
    }
});
    //班级
    $('input').on('input propertychange', function() {
        if ($("#inStuClass").val() == "") {
            document.getElementById("spanInStuClass").innerHTML = "*  输入不能为空";
            $("#spanInStuClass").css('display', 'block');
            $("#inStuClass").css('border', '1px solid red');
            return flag = false;
        } else {
            document.getElementById("spanInStuClass").innerHTML = "";
            $("#spanInStuClass").css('display', 'none');
            $("#inStuClass").css('border', '1px solid #dddddd');
        }
    });
    //学院
    $('input').on('input propertychange', function() {
        var reg1=/^[\u0391-\uFFE5]+$/;
        if($("#inStuDepart").val() == ""){
            document.getElementById("spanInStuDepart").innerHTML="*  输入不能为空";
            $("#spanInStuDepart").css('display','block');
            $("#inStuDepart").css('border','1px solid red');
            return flag=false;
        }else if(!reg1.test($("#inStuDepart").val())){
            document.getElementById("spanInStuDepart").innerHTML="*  输入只能为中文符号";
            $("#spanInStuDepart").css('display','block');
            $("#inStuDepart").css('border','1px solid red');
            return flag=false;
        }else{
            document.getElementById("spanInStuDepart").innerHTML="";
            $("#spanInStuDepart").css('display','none');
            $("#inStuDepart").css('border','1px solid #dddddd');
        }
    });

}

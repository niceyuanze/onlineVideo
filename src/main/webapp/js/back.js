$(document).ready(function(){

    $("button[id^='button']").click(function(){

        var id = this.id;

        var index = id.split("")[id.length- 1];

        $("#menu" + index).toggle();
    });

    //题库列表和添加题库切换
    $("#questionBaseManage_panel_buttons button").click(function(){
        $("#questionBaseTable_panel").hide();
        $("#addQuestionBase_panel").hide();
        $("#"+$(this).attr('id')+"_panel").show();
    });



    $("#buttons ul li div button").click(function(){
        var id = this.id;
        var index= id.substring(0, id.length - 6);
        $("#panel > div").hide();
        $("#" + index+"_panel").show();
    });











});




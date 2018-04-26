<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>星星评分</title>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<style>
body,li,p,ul { 
    margin: 0;
    padding: 0;
    font: 12px/1 Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;
}
ul, li, ol { list-style: none; }
/* 重置文本格式元素 */
a { text-decoration: none; cursor: pointer; color:#333333; font-size:14px;}
a:hover { text-decoration: none; }
.clearfix::after{ display:block; content:''; height:0; overflow:hidden; clear:both;} 
/*星星样式*/
.content{ width:600px; margin:0 auto; padding-top:20px;}
.title{ font-size:14px; background:#dfdfdf; padding:10px; margin-bottom:10px;}
.block{ width:100%; margin:0 0 10px 0; padding-top:00px; padding-left:50px; line-height:21px;}
.block .star_score{ float:left;}
.star_list{height:21px;margin:0px; line-height:21px;}
.block p,.block .attitude{ padding-left:20px; line-height:21px; display:inline-block;}
.block p span{ color:#C00; font-size:16px; font-family:Georgia, "Times New Roman", Times, serif;}
.star_score { background:url(images/stark2.png); width:160px; height:21px;  position:relative; }
.star_score a{ height:21px; display:block; text-indent:-999em; position:absolute;left:0;}
.star_score a:hover{ background:url(images/stars2.png);left:0;}
.star_score a.clibg{ background:url(images/stars2.png);left:0;}
#starttwo .star_score { background:url(images/starky.png);}
#starttwo .star_score a:hover{ background:url(images/starsy.png);left:0;}
#starttwo .star_score a.clibg{ background:url(images/starsy.png);left:0;}
/*星星样式*/
.show_number{ padding-left:50px; padding-top:20px;}
.show_number li{ width:240px; border:1px solid #ccc; padding:10px; margin-right:5px; margin-bottom:20px;}
.atar_Show{background:url(images/stark2.png); width:160px; height:21px;  position:relative; float:left; }
.atar_Show p{ background:url(images/stars2.png);left:0; height:21px; width:134px;}
.show_number li span{ display:inline-block; line-height:21px;}
</style>
</head>

<body>
<div class="content">
    <p class="title">评级</p>
    <div id="startone"  class="block clearfix" >
          <div class="star_score"></div>
          <p style="float:left;">您的评级：<span class="fenshu"></span> 级</p>
          <div class="attitude"></div>
    </div>
    <script type="text/javascript" src="js/startScore.js"></script>
    <script>
     scoreFun($("#startone"))
     scoreFun($("#starttwo"),{
           fen_d:22,//每一个a的宽度
           ScoreGrade:5//a的个数 10或者
         })
    </script>
    <script>
    //显示分数
      $(".show_number li p").each(function(index, element) {
        var num=$(this).attr("tip");
        
        var www=num*2*16;//
        $(this).css("width",www);
        $(this).parent(".atar_Show").siblings("span").text(num+"分");
    });
    </script>
  </div>
</body>
</html>

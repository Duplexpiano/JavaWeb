<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/3/28
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>atlas of kobe</title>
    <link rel="stylesheet" href="styleKobe.css" type="text/css"/>
</head>
<body>
    <div id = "container">
        <div id="top">123</div>
        <div id="wrap">
            <div id="rightSide">
                <h1>导航</h1>
                <p>
                    <a class="nav" href="kobe.jsp">首页</a>
                    <a class="nav" href="atlas.jsp">图集</a>
                </p>
                <h1>更多..</h1>
                <p>
                    <a class="nav" href="https://baike.baidu.com/item/%E7%A7%91%E6%AF%94%C2%B7%E5%B8%83%E8%8E%B1%E6%81%A9%E7%89%B9/318773?fr=aladdin" target="_blank">详情</a>
                </p>
                <audio id="music" src="bgm/Unstoppable%20-%20Sia.mp3" controls="controls" width=30px hidden=true></audio>
                <input type="button" onclick="autoPlay()" value="Play"/>
                <input type="button" onclick="closePlay()" value="Pause"/>
                <script type="text/javascript">
                    function autoPlay() {
                        let myAuto = document.getElementById('music');
                        myAuto.play();
                    }
                    function closePlay() {
                        let myAuto = document.getElementById('music');
                        myAuto.pause();
                        myAuto.load();
                    }
                </script>
            </div>

            <div id="content_1">
                <ul>
                    <img src="Image/kobe_1.jpg"/>
                    <img src="Image/kobe_2.jpg"/>
                    <img src="Image/kobe_3.jpg"/>
                    <img src="Image/kobe_4.jpg"/>
                    <img src="Image/kobe_5.jpg"/>
                    <img src="Image/kobe_6.jpg"/>
                    <img src="Image/kobe_7.jpg"/>
                    <img src="Image/kobe_8.jpg"/>
                    <img src="Image/kobe_9.jpg"/>
                    <img src="Image/kobe_10.jpg"/>
                    <img src="Image/kobe_11.jpg"/>
                    <img src="Image/kobe_12.jpg"/>
                    <img src="Image/kobe_13.jpg"/>
                    <img src="Image/kobe_14.jpg"/>
                </ul>
            </div>

            <div class="clearingDiv">&nbsp;</div>
        </div>
        <div id="footer">&copy; 2020.3 | Design by Liu</div>
    </div>
</body>
</html>

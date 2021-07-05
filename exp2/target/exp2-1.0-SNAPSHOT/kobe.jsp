<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kobe</title>
    <link rel="stylesheet" href="styleKobe.css" type="text/css"/>
</head>
<body>
<div id = "container">
    <div id="top">
        <p>这儿是top</p>
    </div>
    <div id="wrap">
        <div id="rightSide">
            <h1>导航</h1>
            <p>
                <a class="nav" href="kobe.jsp">首页</a>
                <a class="nav" href="atlas.jsp">图集</a>
            </p>
            <h1>更多..</h1>
            <p>
                <a class="nav" target="_blank" href="https://baike.baidu.com/item/%E7%A7%91%E6%AF%94%C2%B7%E5%B8%83%E8%8E%B1%E6%81%A9%E7%89%B9/318773?fr=aladdin">详情</a>
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

        <div id="content">
            <ul>
                <p class="title">科比·布莱恩特</p>
                <li>
                    <h1>人物简介</h1>
                    <img src="Image/kobe_0.jpg"/>
                    <p>科比·比恩·布莱恩特（Kobe Bean Bryant，1978年8月23日—2020年1月26日），出生于美国宾夕法尼亚州费城，前美国职业篮球运动员，司职得分后卫/小前锋（锋卫摇摆人），绰号“黑曼巴”（Black Mamba）。</p>
                    <p>1996年NBA选秀，科比于第1轮第13位被夏洛特黄蜂队选中，后被交易至洛杉矶湖人队，整个NBA生涯都效力于洛杉矶湖人队。湖人生涯随湖人队5夺NBA总冠军；荣膺1次常规赛MVP，2次总决赛MVP，4次全明星赛MVP；共18次入选NBA全明星阵容，15次入选NBA最佳阵容，12次入选NBA最佳防守阵容；国家队生涯两夺奥运会金牌。</p>
                    <p>2016年4月14日，科比·布莱恩特在生涯最后一场主场对阵爵士的常规赛后宣布退役。2017年12月19日，湖人主场对阵勇士，中场时刻为科比的8号和24号两件球衣举行了退役仪式。2018年3月13日，科比凭借和动画师格兰·基恩合作的短片《亲爱的篮球》获第90届奥斯卡最佳短片奖。</p>
                    <p>2020年1月26日（当地时间，北京时间为2020年1月27日），科比在加州卡拉巴萨斯因直升机事故遇难，享年41岁；4月5日，科比正式入选奈·史密斯篮球名人纪念堂；8月13日，美国加州的橙县（Orange County）宣布8月24日为“科比日”。</p>
                </li>
                <hr/>
                <li>
                    <h1>获奖记录</h1>
                    <h2>个人荣誉</h2>
                    <img src="Image/kobe_honor.jpg"/>
                    <p>奥运会冠军：2次（2008年北京奥运会，2012年伦敦奥运会）</p>
                    <p>NBA总冠军：5次（2000，2001，2002，2009，2010）</p>
                    <p>NBA得分王：2次（2006，2007）</p>
                    <p>NBA西部冠军：7次（2000—2002，2004，2008—2010）</p>
                    <p>NBA总决赛MVP：2次（2009，2010）</p>
                    <p>NBA常规赛MVP：1次（2008）</p>
                    <p>NBA全明星赛MVP：4次（2002，2007，2009－与沙奎尔·奥尼尔共享，2011）</p>
                    <p>NBA全明星赛扣篮大赛冠军：1次（1997）</p>
                    <p>NBA全明星：18次（1998，2000—2016）</p>
                    <p>8号和24号球衣被湖人队退役（NBA首次在同一球队退役2件球衣）</p>
                    <p>2020年入选篮球名人堂, 费城体育名人堂</p>
                    <h2>NBA记录</h2>
                    <p>最年轻10000分先生:24岁193天（2003年3月4日）—被勒布朗·詹姆斯在2008年2月27日超越（23岁59天），被凯文·杜兰特在2012年11月1日超越（24岁34天）</p>
                    <p>最年轻出场球员：18岁72天（1996年11月3日） —先后被杰梅因·奥尼尔和安德鲁·拜纳姆打破</p>
                    <p>入选NBA最佳阵容第一阵容次数最多：11次（与卡尔·马龙分享）—被勒布朗·詹姆斯在2018年5月25日超越（12次）</p>
                    <p>单场命中三分球纪录：12个（2003年1月7日对超音速，与唐耶尔·马绍尔、斯蒂芬·库里分享，后被斯蒂芬·库里以13个打破）</p>
                    <p>历史上连续入选NBA全明星赛次数最多：17次</p>
                    <p>历史上圣诞大战得分最多：395分</p>
                    <p>历史首位连续3个赛季季后赛总得分超过600分的球员：633（2008），695（2009），671（2010）</p>
                    <p>历史首位在34岁之后连续10场比赛得分30+的球员：2012-2013赛季</p>
                </li>
                <hr/>
                <li>
                    <h1>个人生活</h1>
                    <h2>家庭生活</h2>
                    <img src="Image/kobe_family.jpg"/>
                    <p>科比是前NBA球员乔·布莱恩特的儿子。</p>
                    <p>1999年11月，21岁的科比遇到了17岁的瓦妮莎·兰尼（Vanessa Laine），当时她正为Tha Eastsidaz（一个说唱团体）的单曲"G'd Up"的MV做背景模特。</p>
                    <p>他们于2001年4月18日在加利福尼亚州的Dana Point（加州南端的一个海滨城市）举行了婚礼。</p>
                    <p>科比的第一个女儿名叫纳塔利亚·戴蒙特·布莱恩特，生于2003年1月19日。纳塔利亚出生的影响化解了科比与父母的隔阂。2005年春天瓦妮莎·布莱恩特由于宫外孕导致了流产。2006年5月1日，他们的第2个孩子吉安娜·玛利亚-奥诺尔·布莱恩特出生了。2011年12月16日，瓦妮莎·布莱恩特正式向科比提出离婚，原因是双方之间“无法协调的分歧（irreconcilable differences）”。在判决书发出之前，布莱恩特一家已经私下解决了所有关于离婚的问题。 [68]  科比和瓦妮莎申请共同承担对两个女儿纳塔利亚和吉娜的监护权。2013年1月12日，科比和瓦妮莎宣布撤销离婚。</p>
                    <p>科比给自己起的绰号是“黑曼巴（Black Mamba）”，他希望他的篮球技术能拥有这种蛇的能力，那就是“以99%的准确度用最大的速度，快速连续地打击。”</p>
                    <p>2019年6月22日，科比与瓦妮莎的第四个女儿Capri Kobe Bryant出生。</p>
                    <h2>人物逝世</h2>
                    <p>当地时间2020年1月26日上午10时左右，科比在美国加利福尼亚州南部卡拉巴萨斯市发生的直升机坠毁事故中遇难，年仅41岁。其13岁的二女儿吉安娜也在事故中不幸去世。</p>
                    <p>当地时间2020年2月7日，科比父女的葬礼在加州科罗纳德尔玛的太平洋景观纪念公园举行。</p>
                </li>
                <hr/>
                <li>
                    <h1>社会评价</h1>
                    <p>科比前队友、总冠军搭档沙奎尔·奥尼尔：没有言语可以形容我此时的痛苦，我正经历着失去我的侄女吉吉和兄弟科比·布莱恩特。我爱你们，会永远想念你们。我向科比及所有遇难人员的家人表示的慰问。我此时非常痛苦.</p>
                </li>
            </ul>
        </div>
        <div class="clearingDiv">&nbsp;</div>
    </div>
    <div id="footer">&copy; 2020.3 | Design by Liu</div>
</div>
</body>
</html>
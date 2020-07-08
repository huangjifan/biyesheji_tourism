
/* footer.js
 * 杩滅▼璋冪敤缁熶竴搴曢儴html
 * 涓轰簡SEO鐨勭洰鐨勶紝缃戠珯鍦板浘绉昏嚦topbar浣嶇疆
 */
(function(){
    var footerhtml =  '<!-- 鍏叡搴曢儴  --><!-- footer\\ -->'
                    + '<div class="wrap" style="clear: both;"><a class="public_ft" href="http://www.lvmama.com/public/user_security" target="_blank"><ul class="public_ft_list"><li><i class="ft_ioc1"></i><strong>价格保证</strong>同类产品，保证底价</li><li><i class="ft_ioc2"></i><strong>退订保障</strong>因特殊情况影响出行，保证退订</li><li><i class="ft_ioc3"></i><strong>救援保障</strong>旅途中遇意外情况，保证援助</li><li><i class="ft_ioc4"></i><strong>7x24小时服务</strong>快速响应，全年无休</li></ul></a></div>'
                    + '<!-- copyright\\ -->'
                    + '<div class="lv-footer clearfix wrap" style="margin:0 auto;">'
                    + '    <p class="footer-link">'
                    + '       <a href="" rel="nofollow">关于我们</a> | '
					+ '       <a href="" rel="nofollow">联系我们</a> | '
                    + '       <a href="">网站地图</a> | '
                    + '       <a href="">酒店品牌</a> | '
                    + '       <a href="">酒店查询</a> | '
                    + '       <a href="" rel="nofollow">帮助中心</a> | '
                    + '       <a href="">友情链接</a> | '
                    + '       <a href="" rel="nofollow">诚聘英才</a> | '
                    + '   <a href="http:" rel="nofollow">旅游度假资质</a> | '
                    + '       <a href="" rel="nofollow">一件返回</a> | '
                    + '       <a rel="nofollow" href="">广告业务</a>'
                    + '    </p>'
                    + '    <p class="lv-copyright">Copyright &copy; 2018 www.lvmama.com. 上海景域文化传播股份有限公司版权所有　沪ICP备13011172号-3　增值电信业务经营许可证编号：沪B2-20100030;<a href="" target="_blank" rel="nofollow"></a>&#12288;<a rel="nofollow" href="" target="_blank"></a></p>'
                    + '   <div class="lv-safety">'
                    + '      <a class="safety2" target="_blank" rel="nofollow" title="缁忚惀鎬х綉绔欏妗堜俊鎭�" href="http://www.miibeian.gov.cn/"></a>'
                    + '      <a class="safety3" target="_blank" rel="nofollow" title="缃戠粶110鎶ヨ鏈嶅姟" href="http://www.cyberpolice.cn"></a>'
                    + '      <a class="safety4" target="_blank" rel="nofollow" title="鏀粯瀹濈壒绾﹀晢瀹�"></a>'
                    + '      <a class="safety5" target="_blank" rel="nofollow" title="AAA绾т俊鐢ㄤ紒涓�" href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1664396140"></a>'
                    + '      <a class="safety6" target="_blank" rel="nofollow" title="涓婃捣宸ュ晢" href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110930103539539"></a>'
                    + '      <a class="safety7" target="_blank" rel="nofollow" title="鍙俊缃戠珯" href="https://ss.knet.cn/verifyseal.dll?sn=2010101800100002662&comefrom=trust&trustKey=dn&trustValue=www.lvmama.com"></a>'
                    + '      <a class="safety8" target="_blank" rel="nofollow" title="璇氫俊璁よ瘉绀鸿寖浼佷笟" href="https://credit.szfw.org/CX20160614015657160455.html" id="___szfw_logo___" hidefocus="false"></a>'
                    + '      <a class="safety9" target="_blank" rel="nofollow" title="缃戠粶绀句細寰佷俊缃�" href="http://www.zx110.org"></a>'
                    + '      <a class="safety10" target="_blank" rel="nofollow" title="360缃戠珯瀹夊叏妫€娴�" href="http://webscan.360.cn"></a>'
                    + '      <a class="safety11" target="_blank" rel="nofollow" title="缃戠洃瀹夊叏" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010702001030"></a>'
                    + '      <a class="safety13" target="_blank" rel="nofollow" title="涓炬姤涓績" href="http://www.shjbzx.cn/"></a>'
                    + '   </div>'
                    + '</div><!-- //footer -->'
                    + '<!-- 鍏叡搴曢儴缁撴潫  -->';
    document.write(footerhtml);
})();

/*娴侀噺鏁版嵁鏀堕泦(PC鐗�)鐨勯儴鐮�*/
(function() {
     var arr = ['https://pics.lvjs.com.cn/mobile/lib/src/bdcTrace/dist/bdctrace-pc.js'];
     for (var i = 0; i < arr.length; i++) {
          var lmm = document.createElement('script');
          lmm.type = 'text/javascript';
          //arr[i] = (document.location.protocol == 'https:' ? 'https:': 'http:')+ arr[i];
          lmm.src = arr[i];
          var s = document.getElementsByTagName('head')[0];
          s.parentNode.insertBefore(lmm, s);
     }
})();
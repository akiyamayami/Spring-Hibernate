<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head><title>
	WELCOME TO ICSSE 2017
	</title><link href="static/CSS/show_img.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="static/Portlets/PanelBar/jquery-1.7.2.min.js"></script>
    <script src="static/Scripts/Common.js" type="text/javascript"></script>
    <script src="static/Scripts/PagingContent.js" type="text/javascript"></script>
	<link rel="shortcut icon" type="image/png" href="static/Resources/Imagephoto/logo.png" /><link href="static/Components/lightbox/css/lightbox.css" rel="stylesheet" type="text/css" />
    <script src="static/Components/lightbox.min.js" type="text/javascript"></script>
    <link href="static/CSS/search_Article.css" rel="stylesheet" />
    <link href="static/Resources/ImagesPortal/PhongBan/main.css" rel="stylesheet"/>
	<link href="static/CSS/mainPortlets.css" rel="stylesheet" />
    <script language="javascript" type="text/javascript">
        function SearchProcess(event) {
            if (event.keyCode == 13) {
                OnSearch(document.getElementById('txtSearchArticle').value);
                return false;
            }
            return true;
        }
        function OnSearch(query) {
            PSCPortal.Services.CMS.SearchAndPaging(query, currentPage, OnSearchSuccess, OnSearchFailed);
        }

        function OnSearchSuccess(results, context, methodName) {
            var position = results.indexOf('_');
            totalRecords = results.substring(0, position);
            results = results.substring(position + 1);
            LoadContentAndPaging(results);
        }
        function OnSearchFailed(results, context, methodName) {
        }

        function retitleUrl(str) {
            str = str.replace(/^\s+|\s+$/g, ''); // trim
            str = str.toLowerCase();
            // remove accents, swap ñ for n, etc
            var from = "àáảãạăằắẳẵặâầấẩẫậđèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ·/_,:;";
            var to = "aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyy------";
            for (var i = 0, l = from.length ; i < l ; i++) {
                str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
            }
            str = str.replace(/[^a-z0-9 -]/g, '') // remove invalid chars
              .replace(/\s+/g, '-') // collapse whitespace and replace by -
              .replace(/-+/g, '-'); // collapse dashes
            return str;
        };

        function popunder() {
            $('a').not('[href^="http"],[href^="https"],[href^="mailto:"],[href^="#"]').each(function () {
                $(this).attr('href', function (index, value) {
                    if (value != undefined) {
                        var index = value.indexOf("Default.aspx");
                        if (index >= 0)
                            return value = "/" + value.substring(index, value.length);
                    }
                });
            });
            var articleId = '' != '' ? '' : '';
            var topicId = '' != '' ? '' : '';
            var moduleId = '' != '' ? '' : '';
            if (articleId != '') {
                if (window.history.state == null) {
                    if (articleId.indexOf("/") > -1)
                        articleId = articleId.substr(0, articleId.indexOf("/"));
                    window.history.replaceState({ ArticleId: articleId }, "ArticleId", "/ArticleId/" + articleId + "/" + retitleUrl(''));
                }
            }
            if (topicId != '') {
                if (window.history.state == null) {
                    if (topicId.indexOf("/") > -1)
                        topicId = topicId.substr(0, topicId.indexOf("/"));
                    window.history.replaceState({ TopicId: topicId }, "TopicId", "/TopicId/" + topicId + "/" + retitleUrl(''));
                }
            }
            
        }
    </script>

<link href="static/WebResources/WebResource1.css" type="text/css" rel="stylesheet" class="Telerik_stylesheet" /><link href="static/WebResources/WebResource2.css" type="text/css" rel="stylesheet" class="Telerik_stylesheet" /><link href="static/WebResources/WebResource3.css" type="text/css" rel="stylesheet" class="Telerik_stylesheet" /></head>
<body class="body" onload='popunder();'>
    <form name="form1" method="post" action="" id="form1">
<div>
<input type="hidden" name="RadScriptManager1_TSM" id="RadScriptManager1_TSM" value="" />
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPaA8FDzhkNDcyZmVhNWZjZTJiYxgBBR5fX0NvbnRyb2xzUmVxdWlyZVBvc3RCYWNrS2V5X18WAgURUmFkV2luZG93TWFuYWdlcjEFOmN0bDA2JHBvcnRsZXRfODAwODg2YTgtY2NiNS00MGRkLTgxM2EtMmMwMmFjMGQyZTkyJFJhZE1lbnUhEZ6YycV2obg+lJZgGWY696u9TQ==" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<script src="static/WebResources/WebResource.js" type="text/javascript"></script>


<script src="static/WebResources/Telerik.Web.UI.WebResource.js" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
if (typeof(Sys) === 'undefined') throw new Error('ASP.NET Ajax client-side framework failed to load.');
//]]>
</script>

<script src="static/Services/PortletProxy.asmx/jsdebug" type="text/javascript"></script>
<script src="static/Services/ModuleProxy.asmx/jsdebug" type="text/javascript"></script>
<script src="static/Services/CMS.asmx/jsdebug" type="text/javascript"></script>
<script src="static/Services/WeatherService.asmx/jsdebug" type="text/javascript"></script>
<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="CA0B0334" />
</div>
        <div id="RadWindowManager1" style="display:none;">
	<!-- 2011.1.315.35 --><div id="RadWindowManager1_alerttemplate" style="display:none;">
		<div class="rwDialogPopup radalert">			
			<div class="rwDialogText">
			{1}				
			</div>
			
			<div>
				<a  onclick="$find('{0}').close(true);"
				class="rwPopupButton" href="javascript:void(0);">
					<span class="rwOuterSpan">
						<span class="rwInnerSpan">##LOC[OK]##</span>
					</span>
				</a>				
			</div>
		</div>
		</div><div id="RadWindowManager1_prompttemplate" style="display:none;">
		 <div class="rwDialogPopup radprompt">			
			    <div class="rwDialogText">
			    {1}				
			    </div>		
			    <div>
				    <script type="text/javascript">
				    function RadWindowprompt_detectenter(id, ev, input)
				    {							
					    if (!ev) ev = window.event;                
					    if (ev.keyCode == 13)
					    {															        
					        var but = input.parentNode.parentNode.getElementsByTagName("A")[0];					        
					        if (but)
						    {							
							    if (but.click) but.click();
							    else if (but.onclick)
							    {
							        but.focus(); var click = but.onclick; but.onclick = null; if (click) click.call(but);							 
							    }
						    }
					       return false;
					    } 
					    else return true;
				    }	 
				    </script>
				    <input title="Eneter Value" onkeydown="return RadWindowprompt_detectenter('{0}', event, this);" type="text"  class="rwDialogInput" value="{2}" />
			    </div>
			    <div>
				    <a onclick="$find('{0}').close(this.parentNode.parentNode.getElementsByTagName('input')[0].value);"				
					    class="rwPopupButton" href="javascript:void(0);" ><span class="rwOuterSpan"><span class="rwInnerSpan">##LOC[OK]##</span></span></a>
				    <a onclick="$find('{0}').close(null);" class="rwPopupButton"  href="javascript:void(0);"><span class="rwOuterSpan"><span class="rwInnerSpan">##LOC[Cancel]##</span></span></a>
			    </div>
		    </div>				       
		</div><div id="RadWindowManager1_confirmtemplate" style="display:none;">
		<div class="rwDialogPopup radconfirm">			
			<div class="rwDialogText">
			{1}				
			</div>						
			<div>
				<a onclick="$find('{0}').close(true);"  class="rwPopupButton" href="javascript:void(0);" ><span class="rwOuterSpan"><span class="rwInnerSpan">##LOC[OK]##</span></span></a>
				<a onclick="$find('{0}').close(false);" class="rwPopupButton"  href="javascript:void(0);"><span class="rwOuterSpan"><span class="rwInnerSpan">##LOC[Cancel]##</span></span></a>
			</div>
		</div>		
		</div><input id="RadWindowManager1_ClientState" name="RadWindowManager1_ClientState" type="hidden" />
</div>
        <script type="text/javascript">
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('RadScriptManager1', 'form1', [], [], [], 90, '');
//]]>
</script>

        
	
<script language="javascript" type="text/javascript">
    function SearchProcess(event) {
        if (event.keyCode == 13) {
            OnSearch(document.getElementById('txtSearchArticle').value);
            return false;
        }
        return true;
    }
    function OnSearch(query) {
        PSCPortal.Services.CMS.SearchAndPaging(query, currentPage, OnSearchSuccess, OnSearchFailed);
    }

    function OnSearchSuccess(results, context, methodName) {
        var position = results.indexOf('_');
        totalRecords = results.substring(0, position);
        results = results.substring(position + 1);
        LoadContentAndPaging(results);
    }
    function OnSearchFailed(results, context, methodName) {
    }


</script>
<div class="gray">
    <div class="wrapper">
        <table cellspacing="0" cellpadding="0" border="0" style="border-collapse:collapse;">
	<tr>
		<td colspan="2"><div id="pnTop">
			<div id="pnTopDisplay" style="width:1000px;float:left">
				<div id='ctl06_portlet_83a3e05a-eb99-4512-bd1a-5af90706fcf3' style="width:574px;float:left"><div>
					<div class="P_top">
<div class="P_logo">
<div class="anh_logo"><img alt="" src="static/Resources/Images/Banner Hoi nghi quoc te sua.jpg" style="width: 800px; height: 188px;" /><br />
</div>
<div class="name_ute">
</div>
</div>
</div>

				</div></div><div id='ctl06_portlet_6299a742-1878-4325-8536-4faefa3c1b4c' style="width:199px;float:right"><div>
					<div class="search_phong"><input class="bgsearch_phong" id="txtSearchArticle" onkeydown="return SearchProcess(event);" type="text" /><input class="btsearch_phong" onclick="OnSearch(document.getElementById('txtSearchArticle').value);" type="button" /> </div>
<div class="link_trang"><a href="http://icsse2017.hcmute.edu.vn">http://icsse2017.hcmute.edu.vn</a></div>

				</div></div><div id='ctl06_portlet_e28a24d5-befe-4213-a3d5-2e1ebcb2a71e' style="width:1000px;float:left"><div>
					
<link href="static/Portlets/NivoSlider/CSS/nivo-slider.css" rel="stylesheet" />
<link href="static/Portlets/NivoSlider/CSS/themes/default.css" rel="stylesheet" />

<script src="static/Portlets/NivoSlider/Scripts/jquery.nivo.slider.js"></script>




<div class="container" style="height:350px;">
    <div class="slider-wrapper theme-default">
        <div id="slider" class="nivoSlider">
          
        <a href="" target="_blank">
                <img src= "static/Resources/ImagesPortlet/HNQT3.jpg" title="" /></a>
    
        <a href="" target="_blank">
                <img src= "static/Resources/ImagesPortlet/HNQT2.jpg" title="" /></a>
    
        <a href="" target="_blank">
                <img src= "static/Resources/ImagesPortlet/HNQT1.jpg" title="" /></a>
    
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $(".nivoSlider").nivoSlider({
            effect: 'random',
            slices: 15,
            boxCols: 8,
            boxRows: 4,
            animSpeed: 500,
            pauseTime: 3000,
            startSlide: 0,
            directionNav: true,
            controlNav: true,
            controlNavThumbs: false,
            pauseOnHover: true,
            manualAdvance: false,
            prevText: 'Prev',
            nextText: 'Next',
            randomStart: false,
            beforeChange: function () { },
            afterChange: function () { },
            slideshowEnd: function () { },
            lastSlide: function () { },
            afterLoad: function () { }
        });
        $('.nivoSlider').css('height', '350px');
        $('.nivoSlider img').css('height', '350px');
    })
   
</script>
				</div></div>
				<div id='ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92' style="padding:10px 0px 0px 0px;width:1000px;float:left">
			  <div>
			
			    <link href="static/Portlets/MenuRad/Menu.Green.css" rel="stylesheet" type="text/css" />
			    <div id="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu" class="RadMenu RadMenu_Green rmSized" style="height:40px;z-index: 1; width: 100%;">
			      <ul class="rmRootGroup rmHorizontal">
			        <li class="rmItem rmFirst"><a href="/home" class="rmLink rmRootLink"><span class="rmText">Home</span></a></li>
			        <li class="rmItem "><a href="/about" class="rmLink rmRootLink"><span class="rmText">About</span></a></li>
			        <li class="rmItem "><a href="/callforpapers" class="rmLink rmRootLink"><span class="rmText">Call for papers</span></a></li>
			        <li class="rmItem "><a href="/submission" class="rmLink rmRootLink"><span class="rmText">Submission</span></a></li>
			        <li class="rmItem "><a href="/login" class="rmLink rmRootLink"><span class="rmText">Login</span></a></li>
			        <li class="rmItem "><a href="/keynote" class="rmLink rmRootLink"><span class="rmText">Keynote Speakers</span></a></li>
			        <li class="rmItem "><a href="/program" class="rmLink rmRootLink"><span class="rmText">Program</span></a></li>
			        <li class="rmItem "><a href="/hotel" class="rmLink rmRootLink"><span class="rmText">Venue & Hotel</span></a></li>
			        <li class="rmItem rmLast"><a href="/contact" class="rmLink rmRootLink"><span class="rmText">Contact</span></a></li>
			      </ul><input id="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu_ClientState" name="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu_ClientState" type="hidden" />
			    </div>
			
			  </div>
</div>
			</div>
		</div></td>
	</tr>
	<tr valign="top">
		<td>
			<div id="pnCenter">
				<c:choose>	
					<c:when test="${MODE == 'LIST'}">
						<p style="border-bottom:1px solid black;">LATEST NEWS</p>
						<div id="pnCenterDisplay" style="width:692px;float:left;border-bottom:1px solid black;margin:5px;">
				            <div id='ctl06_portlet_43f9ded1-4c3b-4b8b-8d8a-01a3ec30711c' style="float:left;">
					            <div>
						            <div id="xxx">
						            	<div style="margin-top: 10px; width: 670px;">
									        <ul>
									        	<c:forEach items="${New}" var="item2">
									        		<li>
									        			<div style="margin-left: 5px; margin: 15px 5px; float: left; width: 660px;">
											                  <h4>
												                  <a class="title_topicdisplay" href="viewNews?id=<c:out value="${item2.id}"/>">
												                  <c:out value="${item2.tieude}"/>
												                  <span style="color:#666;font-size:13px;font-style:italic;">
												                  (<c:out value="${item2.date}"/>)
												                  </span>
												                  </a>
															  </h4>
											            </div>
									        		</li>
									        	</c:forEach>
											</ul>
									    </div>
						            </div>
					            </div>
				            </div>
				      	</div>
					</c:when>
					<c:otherwise>
						<c:if test="${not empty title}">
							<p style="border-bottom:1px solid black;">${title}</p>
							<div id="pnCenterDisplay" style="width:692px;float:left;">
					            <div id='ctl06_portlet_43f9ded1-4c3b-4b8b-8d8a-01a3ec30711c' style="float:left;">
						            <div>
							            <div class="main">
							            	<c:set var="xx" value="${odernews.noidung}"/>
							            	${xx}
							            </div>
						            </div>
					            </div>
					      	</div>
						</c:if>
						<c:if test="${empty title}">
							<p style="border-bottom:1px solid black;">${news3.tieude}</p>
							<div id="pnCenterDisplay" style="width:692px;float:left;border-bottom:1px solid black;">
					            <div id='ctl06_portlet_43f9ded1-4c3b-4b8b-8d8a-01a3ec30711c' style="float:left;">
						            <div>
							            <div class="main">
							            	<c:set var="xx" value="${news3.noidung}"/>
							            	${xx}
							            </div>
							            <div id="footer">
							            	<c:if test="${not empty news3.hinhanh}">
							            		<p>Hinh ảnh đính kèm </p>
							            		<img src="<c:out value="${news3.hinhanh}"/>" height="100px" width="100px" />
							            	</c:if>
							            	<c:if test="${not empty news3.file}">
							            		<p>File đính kèm</p>
							            		<a href="<c:out value="${news3.file}"/>" download>File</a>
							            	</c:if>
							            </div>
						            </div>
					            </div>
					      	</div>
						</c:if>

					</c:otherwise>
				</c:choose>
			      
			</div>
		
		</td>
		<td><div id="pnRight">
			<div id="pnRightDisplay" style="padding:0px 0px 0px 6px;width:300px;float:left">
				<div id='ctl06_portlet_b633be64-8363-4e53-9952-6acf34d3e9e9' style="float:left;"><div>
					
		<div class="thongbao_phong">
		      <div class="topictb_phong_blue">
		            <h3>Latest news</h3>
		            <a class="wobble-horizontal" href="/listNews">
		                  <img src="static/Resources/ImagesPortal/PhongBan/arrow_all_phong.png" /></a>
		      </div>
		      <div class="listtb_phong">
		      <!-- Phòng CODE HERE -->
		            <ul style="width:90%;">
		            	<c:forEach items="${news}" var="item">
							<li>
		            			<a href="/viewNews?id=<c:out value="${item.id}"/>">
		            				<p>Create Date ${item.date}</p>
		            				${item.tieude}
		            			</a>
		            		</li>
						</c:forEach>
		            </ul>
		      </div>
		      <!--end listtb_phong-->
		</div>

				</div></div><div id='ctl06_portlet_9d945843-6c22-4daf-9b88-835da3891673' style="float:left"><div>
					<table>
    <tbody>
        <tr>
            <td style="text-align: left; width: 350px; height: 40px; vertical-align: middle; background-color: #ff0000;">&nbsp;<span style="font-size: 20px; color: #ffff00;"><strong>IMPORTANT DEADLINES</strong></span></td>
        </tr>
    </tbody>
</table>
<p style="text-align: justify;"><span style="font-size: 12px; color: #002060;"><strong><br />
</strong></span></p>
<div style="text-align: center;"><strong><strong style="text-align: left;"><span style="font-size: 16px;"><span style="text-decoration: line-through;">March 7, 2017</span><br />
<strong><span style="color: #c00000;">Extended untill March 26, 2017</span></strong><br />
</span></strong></strong></div>
<span style="font-size: 16px; color: #002060;"><strong>
</strong>
</span>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><span style="text-align: left; font-size: 16px;">2-Pages &nbsp;Extended Abstract&nbsp;</span><span style="font-size: 16px;">Submission</span></span></div>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><br />
</span></div>
<span style="font-size: 16px; color: #002060;">
<div style="text-align: center;"><strong style="text-align: left;">March 30, 2017</strong></div>
<div style="text-align: center;"><span style="text-align: left; font-size: 16px;">Notification of Acceptance</span></div>
</span>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><br />
</span></div>
<span style="font-size: 16px; color: #002060;">
<div style="text-align: center;"><strong style="text-align: left;">May 10, 2017</strong></div>
<div style="text-align: center;"><span style="text-align: left; font-size: 16px;">2-6 Pages Final Papers Submission</span></div>
</span><span style="font-size: 16px;"><span style="font-size: 16px; color: #002060;">
</span>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><br />
</span></div>
<span style="font-size: 14px;"><span style="font-size: 16px; color: #002060;">
</span>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><strong style="font-size: medium; text-align: left;">May 30, 2017</strong><span style="text-align: left; font-size: 16px;">:&nbsp;</span></span></div>
<span style="font-size: 16px; color: #002060;"><span style="font-size: 16px;">
</span>
<div style="text-align: center;"><span style="text-align: left; font-size: 16px;">Online Registration</span></div>
</span>
</span>
<br />
</span>

				</div></div><div id='ctl06_portlet_553574d9-9245-4da8-a214-baf51898689a' style="float:left;"><div>
					<table>
    <tbody>
        <tr>
            <td style="width: 350px; height: 40px; background-color: #92d050;"><strong><span><span style="font-size: 20px; color: #c00000;">SPECIAL SESSION</span><br />
            </span></strong></td>
        </tr>
    </tbody>
</table>
<span style="font-size: 10.5pt; letter-spacing: 0.85pt; font-family: &quot;times new roman&quot;, serif;"><strong style="font-weight: bold; color: #002060; font-family: &quot;times new roman&quot;, serif; font-size: 14px; letter-spacing: 1.13333px;"><strong><br />
<a href="https://easychair.org/conferences/?conf=icsse2017specialsess" target="_blank">SPECIAL SESSION SUBMISSION LINK</a>&nbsp;</strong></strong><br />
<span style="font-size: 14px;"><br />
<div style="text-align: center;"><strong style="letter-spacing: 0.85pt; background-color: #ffff00;"><span style="color: #002060;"><strong style="letter-spacing: 1.13333px;"><strong>SPECIAL SESSION&nbsp;</strong></strong>01</span></strong></div>
<strong>
<div style="text-align: center;"><strong style="letter-spacing: 0.85pt;"><span style="background-color: #ffff00; color: #002060;">INTELLIGENT HEALTHCARE SYSTEMS</span></strong></div>
</strong></span>
<div style="font-weight: bold; color: #002060; text-align: center;"><span style="font-size: 10.5pt; letter-spacing: 0.85pt;"><a href="static/Resources/Docs/SubDomain/icsse2017/SS_cfp_Huang.pdf">CALL FOR PAPERS</a></span></div>
<br />
<div style="text-align: center;"><strong style="font-size: 10.5pt; letter-spacing: 0.85pt; margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 20px;"><strong style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 14px; background-color: #ffff00; color: #002060;"><strong style="font-family: &quot;times new roman&quot;, serif; font-size: 14px; letter-spacing: 0.85pt; text-align: -webkit-center; background-color: #ffff00;"><span style="color: #002060;"><strong style="letter-spacing: 1.13333px;"><strong>SPECIAL SESSION&nbsp;</strong></strong></span></strong>02<br />
FUZZY SYSTEMS &amp; ITS APPLICATIONS</span></strong></span></strong></div>
<strong style="margin: 0px; padding: 0px; font-size: 14px;">
<div style="text-align: center;"><strong style="letter-spacing: 0.85pt; margin: 0px; padding: 0px;"><a href="static/Resources/Docs/SubDomain/icsse2017/SS02 - call4pp.pdf" style="margin: 0px; padding: 0px; text-decoration: none;">CALL FOR PAPER</a></strong></div>
</strong>
<br />
</span>

				</div></div><div id='ctl06_portlet_78439b67-a318-4ced-ac29-33d02da2a0fb' style="float:left;"><div>
					<table>
    <tbody>
        <tr>
            <td style="text-align: left; width: 350px; vertical-align: middle; height: 40px; background-color: #002060;">&nbsp;<span style="font-size: 20px; color: #ffff00;"><strong>KEY LINKS</strong></span></td>
        </tr>
    </tbody>
</table>
<br />
<span style="color: #002060;"><span style="font-size: 14px;"><a href="https://easychair.org/conferences/?conf=icsse2017" target="_blank"><strong>EASYCHAIR SUBMISSION SITE</strong></a></span><br />
<span style="font-size: 14px;"><a href="static/Resources/Docs/SubDomain/icsse2017/ieeeconf_letter.doc"><br />
<strong>
PAPER FORMAT TEMPLATE DOWNLOAD</strong></a>&nbsp;<br />
</span></span><span style="font-size: 14px;"><br />
<strong><strong style="font-size: 14px;"></strong><strong style="font-size: 14px;"></strong><a href="static/Resources/Docs/SubDomain/icsse2017/Instruction easychair_ICSSE2017.docx"><strong style="font-size: 14px;">EASYCHAIR&nbsp;</strong>SUBMISSION INSTRUCTION</a></strong></span>

				</div></div>
			</div>
		</div></td>
	</tr><tr>
		<td colspan="2"><div id="pnBottom">
			<div id="pnBottomDisplay" style="clear:both;
	background:url(static/Resources/ImagesPortal/PhongBan/bgfooter_phong.png) repeat-x;
	width:1000px;
	height:110px;">
				<div id='ctl06_portlet_5c231c9e-b9b3-474f-bb01-834b95465666' style="float:right"><div>
					
<div class="truycap_ute">
    <p>Visit month:
        <span id="ctl06_portlet_5c231c9e-b9b3-474f-bb01-834b95465666_Label4">3,485</span></p>
    <p class="line_footer"></p>
    <p>Visit total:<span id="ctl06_portlet_5c231c9e-b9b3-474f-bb01-834b95465666_Label1">6,963</span></p>
</div>

				</div></div><div id='ctl06_portlet_8b056785-3dc4-4de8-9516-a546e8152a5c' style="float:left;"><div>
					<div class="addute">
<p><span style="font-size: 14px; color: #ffffff;">2017 IEEE International Conference on System Science and Engineering<br />
<span style="font-size: 14px;">HCMC University of Technology and Education</span><br />
Add: No 1 Vo Van Ngan Street, Linh Chieu Ward, Thu Duc District, Ho Chi Minh City<br />
Tel: (+84.8) 37 221 223 - Ext: 8161 / 8163<br />
E-mail: icsse2017@hcmute.edu.vn</span></p>
</div>

				</div></div>
			</div>
		</div></td>
	</tr>
</table>
    </div>
</div>

    


</form>
</body>
</html>

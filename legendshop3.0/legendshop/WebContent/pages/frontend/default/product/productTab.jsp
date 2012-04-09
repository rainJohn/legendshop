<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/common.jsp"%>
<%@ include file="/pages/common/taglib.jsp"%>
<%@ taglib uri="http://www.legendesign.net/biz" prefix="lb"%>

	<script type='text/javascript' src="<ls:templateResource item='/dwr/interface/CommonService.js'/>"></script>
    <script type='text/javascript' src="<ls:templateResource item='/dwr/engine.js'/>"></script>
    <script type='text/javascript' src="<ls:templateResource item='/dwr/util.js'/>"></script>
	<lb:shopDetail var="shopDetail" />	
		
<link rel="stylesheet" type="text/css" media='screen' href="<ls:templateResource item='/css/productTab.css'/>" />
<script type="text/javascript" language="javascript" src="<ls:templateResource item='/common/js/productTab.js'/>"></script>
<DIV id="con">
	<UL id="tags">
	  <LI class="selectTag">
	 	 <A onClick="selectTag('tagContent0',this)" href="javascript:void(0)"><fmt:message key="prod_content"/></A>
	  </LI>
	  <LI>
		<A onClick="selectTag('tagContent1',this)" href="javascript:void(0)"><fmt:message key="product.parameter"/></A>
	 </LI> 
	   <LI>
	  	<A onClick="selectTag('tagContent2',this)" href="javascript:void(0)"><fmt:message key="product.comment"/></A> 
	  </LI>
	  <c:if test="${requestScope.productList != null && fn:length(requestScope.productList) > 0}">
	  <LI>
	  	<A onClick="selectTag('tagContent3',this)" href="javascript:void(0)"><fmt:message key="related.products"/></A> 
	  </LI>
	  </c:if>
	</UL>
	<DIV id="tagContent">
		<DIV class="tagContent selectTag" id="tagContent0">
			 ${prod.content}
			 <br></br>
			 ${shopDetail.detailDesc}
			  <br/>
		</DIV> 
		<DIV class="tagContent" id="tagContent1">
		<div id="prodParameter" name="prodParameter"></div>
			<br/><br/>
			 ${shopDetail.detailDesc}
			  <br/>
		</DIV>
		<DIV class="tagContent" id="tagContent2">
		<div id="productComment" name="productComment"></div>
				<%@ include file="productcomment.jsp"%>
		</DIV>
		<c:if test="${requestScope.productList != null && fn:length(requestScope.productList) > 0}">
		<DIV class="tagContent" id="tagContent3">
		<table width=100%" cellpadding="0" cellspacing="10" align="left">
		<tr>
			<c:forEach items="${requestScope.productList}" var="prod" varStatus="status">
				<td width="33%" align="left">
					<c:choose>
						<c:when test="${fn:length(prod.name) > 30}">
						<span>
							<a href="<ls:url address='/views'/>" >
							<img src="<ls:templateResource item='/photoserver/images/${prod.pic}'/>" width="150px" height="110px"
									title="${prod.name}" id="pic"></a></span><br>${fn:substring(prod.name,0,30)}...<br>
									
						</c:when>
						<c:otherwise>
						<span>
				     <a href="<ls:url address='/views'/>">
				     <img src="<ls:templateResource item='/photoserver/images/${prod.pic}'/>" width="150px" height="110px" id="pic"></a>
				     </span><br>${prod.name}<br>
						</c:otherwise>
					</c:choose>
					<c:if test="${not empty prod.cash}">
						<fmt:message key="prod_cash" /><font color="red"><fmt:formatNumber
								type="currency" value="${prod.cash}" pattern="${CURRENCY_PATTERN}"/></font>
					</c:if>
				</td>
				<c:if test="${(status.index+1)%3==0&&(status.index+1)>=3}">
					</tr>
					<tr>
				</c:if>
			</c:forEach>
		</tr>
	</table>

   <table>
   	<tr><td></td></tr>
   </table>

		</DIV>
		</c:if>
	</DIV>
</DIV>
  <SCRIPT type=text/javascript>
  	function getProductComment(){
			 var prodId = ${prod.prodId};   
             CommonService.getProductComment(prodId,"1",function(dataArray){
                try{
                document.getElementById("productComment").innerHTML =dataArray;
                //alert(dataArray);
               }catch(e){}
           }) ;
	
		}
	function queryParameter(){
		    var prodId = ${prod.prodId}; 
             CommonService.queryParameter(prodId,function(dataArray){
                try{
                document.getElementById("prodParameter").innerHTML =dataArray;
                //alert(dataArray);
               }catch(e){}
           }) ;
		 }
		
  	function pager(curPageNO){
			 var prodId = ${prod.prodId};   
             CommonService.getProductComment(prodId,curPageNO,function(dataArray){
                try{
                document.getElementById("productComment").innerHTML =dataArray;
                //alert(dataArray);
               }catch(e){}
           }) ;
		}
</SCRIPT>



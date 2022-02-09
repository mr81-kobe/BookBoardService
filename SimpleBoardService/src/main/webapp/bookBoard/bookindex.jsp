<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="/include/header.jsp" %>
	

		<section style="width: 80%">
			<div class="panel panel-default" id="section">
				
				
				<!-- 본문 내용 -->
				<!-- Table -->
				<table class="table table-hover" style="width: 100%">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">Title</th>
							<th scope="col">Author</th>
							<th scope="col">Publisher</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list }" var="book">
						<tr>
							<th scope="row">${book.no }</th>
							<td><a href="../getBook.do?title=${book.title}"> ${book.title }</a></td>
							<td>${book.author }</td>
							<td>${book.publisher}</td>
						</tr>
					</c:forEach>	
					</tbody>
				</table>
				<c:if test="${page.startPage>1}">
					<button  id="prev" value="${prePage-1}">이전</button>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
				<button  id="indexBut">${i}</button>
				
				</c:forEach>
				<c:if test="${page.wholePage>5}">
					<button id="next" value="${prePage+1}">다음</button>
				</c:if>
			</div>
		<div id="formDiv">
		<form id="searchForm">
		<select name="option" id="selectBox">
			<option value="title" >제목</option>
			<option value="author">작가</option>
			<option value="publisher">츌판사</option>
		</select>	
		<input type="text" name="search" id="search">
		<input type="submit" value="검색" id="searchBut">
		</form>
		</div>
		</section>
		</div>
		<script>
			
		$(document).on('click','#searchBut',function(e){
			
			e.preventDefault();
			var data=$(this).parent('form').serializeObject();
			
			$.ajax({
				
			url:'https://localhost:8443/bookBoardsync.do',
			data:JSON.stringify(data),
			dataType:'json',
			contentType:'application/json; charset-utf-8',
			type:'post',
			success:function(result){
				
				makeTable(result);
				
				
			},
			error:function(){
				alert(e.statusText);
			}
			
			
			
			
			})
			
			
			
			
			
			
			
		})
		
		
		
		
		
			$(document).on('click','#indexBut',function(e){
				
					
			$.ajax({
					
			url:'https://localhost:8443/bookBoardsync.do',
			data:JSON.stringify({
			'prePage': Number($(this).html()),	
			'option' :$("#selectBox").val(),
			'search':$("#search").val()	
			
			}),
			type:"post",
			contentType:"application/json; charset-utf-8",
			dataType:"json",
			success:function(result){
				$("#section").html('');
				makeTable(result);
			},
			error:function(error){
				console.log(error.statusText);
			}
			
		})
				
				
				
				
			
			})	
			
	
		$(document).on('click','#next',function(e){
			
				
				
				$.ajax({
						
				url:'https://localhost:8443/bookBoardsync.do',
				data:JSON.stringify({
				'prePage': Number($(this).val())+Number(1),	
				'option' :$("#selectBox").val(),
				'search':$("#search").val()
				}),
				type:"post",
				contentType:"application/json; charset-utf-8",
				dataType:"json",
				success:function(result){
					$("#section").html('');
					makeTable(result);
					
				},
				error:function(error){
					console.log(error.statusText);
				}
				
			})
		
		
			})
			
			
			
			
			$(document).on('click','#prev',function(e){
			
				
				
				$.ajax({
						
				url:'https://localhost:8443/bookBoardsync.do',
				data:JSON.stringify({
				'prePage': Number($(this).val())-Number(1),	
				'option' :$("#selectBox").val(),
				'search':$("#search").val()	
				
				}),
				type:"post",
				contentType:"application/json; charset-utf-8",
				dataType:"json",
				success:function(result){
					$("#section").html('');
					makeTable(result);
					
				},
				error:function(error){
					console.log(error.statusText);
				}
				
			})
		
		
			})
			
			
			
			
			
			
			
			
			function makeTable(result){
				var prePage=result.prePage;
				var list = result.list;
				var startPage=result.startPage;
				var endPage=result.endPage; 
				var wholePage =result.wholePage;
				var ht='<table class="table table-hover" style="width: 100%"><thead><tr><th scope="col">No</th><th scope="col">Title</th><th scope="col">Author</th><th scope="col">Publisher</th></tr></thead><tbody>';
				var search = '<div id="formDiv"><form id="searchForm"><select name="option" id="selectBox"><option value="title" >제목</option><option value="author">작가</option><option value="publisher">츌판사</option></select>';	
				search+='<input type="text" name="search" id="search" value="'+result.search+'">';
				search+='<input type="submit" value="검색" id="searchBut">';
				search+='</form>'
				$("#select_box").val(result.option).attr("selected", "selected");

				
			
				
				
				$.each(list,function(index,book){
				
					ht+='<tr><th scope="row">'+book.no+'</th><td><a href="../getBook.do?title='+book.title+'">'+book.title+'</a></td><td>'+book.author+'</td><td>'+book.publisher+'</td></tr>'
						
						
				})	
						
					
					
					
					
					
				
				ht+='</tbody></table>'
				if(startPage>1){
					
					ht+='<button id="prev" value="'+ prePage+'">이전</button>'
					
				}
				for(var i=startPage; i<=Number(endPage); i++){
					
					ht+='<button id="indexBut">'+i+'</button>';
					
				}
				
				
				
				if(wholePage>5){
				
					ht+='<button id="next" value="'+prePage +'">다음</button>'
					
				}
				$("#section").html(ht);
		        
				$("#formDiv").html();
		
		}
		
		
		$.fn.serializeObject = function() {
			  "use strict"
			  var result = {}
			  var extend = function(i, element) {
			    var node = result[element.name]
			    if ("undefined" !== typeof node && node !== null) {
			      if ($.isArray(node)) {
			        node.push(element.value)
			      } else {
			        result[element.name] = [node, element.value]
			      }
			    } else {
			      result[element.name] = element.value
			    }
			  }

			  $.each(this.serializeArray(), extend)
			  return result
			}
		
		</script>
	
<%@ include file="/include/footer.jsp" %>


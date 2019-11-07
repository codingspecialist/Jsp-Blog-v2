<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/include/nav.jsp"%>

<!--================Blog Area =================-->
<section class="blog_area single-post-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="main_blog_details">
					<a href="#"><h4>${board.title}</h4></a>
					<div class="user_details">
						<div class="float-left">
							<c:if test="${board.userId eq sessionScope.user.id}">
								<a href="/blog/board?cmd=updateForm&id=${board.id}">update</a>
								<a href="/blog/board?cmd=delete&id=${board.id}">delete</a>
							</c:if>
						</div>
						<div class="float-right">
							<div class="media">
								<div class="media-body">
									<h5>${board.user.username}</h5>
									<p>${board.createDate}</p>
								</div>
								<div class="d-flex">
									<img src="/blog/img/blog/user-img.jpg" alt="">
								</div>
							</div>
						</div>
					</div>
					<!-- 본문 시작 -->
					<p>${board.content}</p>
					<!-- 본문 끝 -->
					<hr />
				</div>

				<!-- 댓글 시작 -->
				<!--  before -->
				<div class="comments-area" id="comments-area">
					<!-- prepend -->
					<c:forEach var="comment" items="${comments}">
						
						<!-- 댓글 아이템 시작 -->
						<div class="comment-list" id="comment-id-${comment.id}">
							<!-- ID 동적으로 만들기 -->
							<div class="reply-btn">
								<button onClick="commentDelete(${comment.id})" class="btn-reply text-uppercase" style="display: inline-block; float: left; margin-right: 10px;">댓글삭제</button>
								<button onClick="replyListShow(${comment.id})" class="btn-reply text-uppercase" style="display: inline-block; float: left; margin-right: 10px;">댓글보기</button>
								<button onClick="replyForm(${comment.id})" class="btn-reply text-uppercase">댓글쓰기</button>
							</div>
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c1.jpg" alt="">
									</div>
									<div class="desc">
										<h5>
											<a href="#">${comment.user.username}</a>
										</h5>
										<p class="date">${comment.createDate}</p>
										<p class="comment" style='word-break: break-all;'>${comment.content}</p>
									</div>
								</div>
							</div>
						</div>
						<!-- 댓글 아이템 끝 -->
					</c:forEach>
					
					
					<!--  append -->

				</div>
				<!-- after -->
				<!-- 댓글 끝 -->

				<!-- 댓글 쓰기 시작 -->
				<div class="comment-form" style="margin-top: 0px;">
					<h4 style="margin-bottom: 20px">Leave a Comment</h4>
					<form id="comment-submit">
						<input type="hidden" name="userId" value="${sessionScope.user.id}" /> <input type="hidden" name="boardId" value="${board.id}" />
						<div class="form-group">
							<textarea id="content" style="height: 60px" class="form-control mb-10" rows="2" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
								required=""></textarea>
						</div>
						<button type="button" onClick="commentWrite()" class="primary-btn submit_btn">Post Comment</button>
					</form>
				</div>
				<!-- 댓글 쓰기 끝 -->
			</div>

			<div class="col-lg-2"></div>
		</div>
	</div>
</section>

<!--================Blog Area =================-->

<%@ include file="/include/footer.jsp"%>

<!--================Comment Script =================-->
<script>
	
	function commentItemForm(id, username, content, createDate){
	    var commentItem = "<div class='comment-list' id='comment-id-"+id+"'> ";
	    commentItem += "<div class='single-comment justify-content-between d-flex'> ";
	    commentItem += "<div class='user justify-content-between d-flex'> ";
	    commentItem += "<div class='thumb'> <img src='img/blog/c1.jpg' alt=''> </div> ";
	    commentItem += "<div class='desc'><h5><a href='#'>"+username+"</a></h5> ";
	    commentItem += "<p class='date'>"+createDate+"</p><p class='comment' style='word-break: break-all;'>"+content+"</p></div></div> ";
	    commentItem += "<div class='reply-btn'>";
	    commentItem += "<button onClick='commentDelete("+id+")' class='btn-reply text-uppercase' style='display:inline-block; float:left; margin-right:10px;'>삭제</button>";
	    commentItem += "<button onClick='replyListShow("+id+")' class='btn-reply text-uppercase'  style='display:inline-block; float:left; margin-right:10px;'>보기</button>";
	    commentItem += "<button onClick='replyForm("+id+")' class='btn-reply text-uppercase'>쓰기</button></div></div></div>";
	    console.log(commentItem);
	    return commentItem;
	}
	
	function replyItemForm(id, username, content, createDate){
		var replyItem = "<div class='comment-list left-padding' id='reply-id-"+id+"'>";
		replyItem+= "<div class='single-comment justify-content-between d-flex'>";
		replyItem+= "<div class='user justify-content-between d-flex'>";
		replyItem+= "<div class='thumb'><img src='img/blog/c2.jpg' alt=''></div>";
		replyItem+= "<div class='desc'><h5><a href='#'>"+username+"</a></h5>";
		replyItem+= "<p class='date'>"+createDate+"</p>";
		replyItem+= "<p class='comment'>"+content+"</p>";
		replyItem+= "</div></div><div class='reply-btn'><button onClick='replyDelete("+id+")' class='btn-reply text-uppercase'>삭제</button>";
		replyItem+= "</div></div></div>";
		
		return replyItem;
	}
	
	//reply 보기 - ajax
	function replyListShow(comment_id) {
		//comment_id 로 reply 전부다 select 해서 가져오기
		$.ajax({
			method: "POST",
			url: "/blog/api/reply?cmd=list",
			data: comment_id +"",
			contentType: "text/plain; charset=utf-8",
			dataType: "json",
			success: function(replys){ //javascript object
				for(reply of replys){ 
					//잘 받았으면 화면에 표시하면 됨.
					console.log(reply);
					var reply_et = replyItemForm(reply.id, reply.user.username, reply.content, reply.createDate);
					$("#comment-id-"+reply.commentId).after(reply_et);
				}
			},
			error: function(xhr){
				console.log(xhr);
			}
		});
	}
	
	//reply 삭제
	function replyDelete(reply_id){
		$.ajax({
			method: "POST",
			url: "/blog/api/reply?cmd=delete",
			data: reply_id+"",
			contentType: "text/plain; charset=utf-8",
			success: function(result){
				if(result === "ok"){
					//해당 엘레멘트 삭제
					$("#reply-id-"+reply_id).remove();
				}
			},
			error: function(xhr){
				console.log(xhr);
			}
		});
	}
	
	//comment 쓰기
	function commentWrite(){
		var comment_submit_string = $("#comment-submit").serialize();
		$.ajax({
			method: "POST",
			url: "/blog/api/comment?cmd=write",
			data: comment_submit_string,
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			
			success: function(comment){
				//화면에 적용
				var comment_et = commentItemForm(comment.id, comment.user.username, comment.content, comment.createDate);
				$("#comments-area").prepend(comment_et);
				//입력폼 초기화하기
				$("#content").val("");
				
			},
			error: function(xhr){
				console.log(xhr.status);
				console.log(xhr);
			}
			
		});
		
	}
	
	
	//comment 삭제
	function commentDelete(comment_id){ //자바스크립트는 하이픈 사용 불가
		$.ajax({
			method: "POST",
			url: "/blog/api/comment?cmd=delete",
			data: comment_id+"",
			contentType: "text/plain; charset=utf-8", //MIME 타입
			success: function(result){
				console.log(result);
				//해당 엘레멘트(DOM)을 찾아서 remove() 해주면 됨.
				if(result === "ok"){
					$("#comment-id-"+comment_id).remove();
				}
				
			},
			error: function(xhr){
				console.log(xhr.status);
			}
		});
	}

	//reply Form 만들기  - 화면에 로딩!!

	function replyForm(comment_id) {
		var comment_form_inner = "<h4 style='margin-bottom:20px'>Leave a Reply</h4><form id='reply-submit'><div class='form-group'><textarea style='height:60px' class='form-control mb-10' rows='2' name='content' placeholder='Messege' required=''></textarea></div><button class='primary-btn submit_btn'>Post Comment</button></form>";

		//<div class="comment-form" style="margin-top:0px;"></div>
		var comment_form = document.createElement("div"); //div 빈 박스 생성
		comment_form.className = "comment-form"; //div에 클래스 이름을 주고
		comment_form.style = "margin-top:0px"; //div에 style을 준다.

		comment_form.innerHTML = comment_form_inner;
		console.log(comment_form);

		var comment_list = document.querySelector("#comment-id-"+comment_id);
		comment_list.append(comment_form); //after와 append, before와 prepend 
	}
</script>
</body>
</html>





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
				<div class="comments-area">

					<c:forEach var="comment" items="${comments}">
					
					
						<!-- 댓글 아이템 시작 -->
						<div class="comment-list" id="comment-id-${comment.id}">
							<!-- id 동적으로 만들기 -->

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
										<p class="comment">${comment.content}</p>
									</div>
								</div>
						
								<div class="reply-btn">
									<button onClick="commentDelete(${comment.id})" class="btn-reply text-uppercase" style="display:inline-block; float:left; margin-right:10px;">삭제</button>
									<button onClick="replyListShow(${comment.id})" class="btn-reply text-uppercase"  style="display:inline-block; float:left; margin-right:10px;">보기</button>
									<button onClick="replyForm(${comment.id})" class="btn-reply text-uppercase">쓰기</button>
								</div>
							</div>

							<!-- Reply 쓰기 -->

						</div>
						<!-- 댓글 아이템 끝 -->
						
						
					</c:forEach>

					<!-- 대 댓글 아이템 시작 -->
					<div class="comment-list left-padding">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="img/blog/c2.jpg" alt="">
								</div>
								<div class="desc">
									<h5>
										<a href="#">Elsie Cunningham</a>
									</h5>
									<p class="date">December 4, 2017 at 3:12 pm</p>
									<p class="comment">Never say goodbye till the end comes!</p>
								</div>
							</div>
						</div>
					</div>
					<!-- 대 댓글 아이템 끝 -->
				</div>
				<!-- 댓글 끝 -->

				<!-- 댓글 쓰기 시작 -->
				<div class="comment-form" style="margin-top: 0px;">
					<h4 style="margin-bottom: 20px">Leave a Comment</h4>
					<form id="comment-submit">
						<div class="form-group">
							<textarea style="height: 60px" class="form-control mb-10" rows="2" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
						</div>
						<a href="#" class="primary-btn submit_btn">Post Comment</a>
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
	
	//comment 삭제
	function commentDelete(comment_id){ //자바스크립트는 하이픈 사용 불가

		$.ajax({
			method: "POST",
			url: "/blog/api/comment?cmd=delete",
			data: comment_id+"",
			contentType: "text/plain; charset=utf-8", //MIME 타입
			success: function(r){
				console.log(r);
				//해당 엘레멘트(DOM)을 찾아서 remove() 해주면 됨.
				$("#comment-id-"+comment_id).remove();
			},
			error: function(xhr){
				console.log(xhr.status);
			}
		});
	}

	//reply 보기 - ajax
	function replyListShow() {

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





<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>
<section class="contact_area">
	<div class="container" style="text-align:center">
		<div class="row">
			<div class="col-lg-12">
				<form class="row contact_form" action="/blog/user?cmd=userProfile" method="post" enctype="multipart/form-data">
					<div class="col-md-12">
						<div class="form-group">
							<img id="img__wrap" src="${sessionScope.user.userProfile}" width="350px" height="300px" /> 
						</div>
					</div>
					<input type="hidden" name="id" value="${sessionScope.user.id}" />
					<div class="col-md-12">
						<div class="form-group">
							<input id="img__input" type="file" name="userProfile">
						</div>
					</div>

					<div class="col-md-12">
						<button type="submit" value="submit" class="btn submit_btn">사진 업로드</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<br/><br/>

<%@ include file="/include/footer.jsp"%>

<script>
	$("#img__input").on("change", handleImgFile);

	function handleImgFile(e) {
		var f = e.target.files[0];

		if (!f.type.match("image.*")) {
			alert("이미지만 첨부할 수 있습니다.");
			return;
		}

		var reader = new FileReader();

		reader.onload = function(e) {
			$("#img__wrap").attr("src", e.target.result);
		}

		reader.readAsDataURL(f);

	}
</script>





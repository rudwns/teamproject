<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
input[type="radio"] {
	display: inline-block;
	width: 19px;
	height: 19px;
	margin: -2px 10px 0 0;
	vertical-align: middle;
	background-color: blue;
	cursor: pointer;
	
}
</style>
<title>Dimension by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>

</head>
<body class="is-article-visible">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<!-- Login -->
			<article id="Login" class="active">
				<h2 class="major">JOIN</h2>
				<form id="form" onsubmit="return check()" method="post"	action="Join">
					<div class="field half">
						<label for="id">ID</label> <input type="text" name="id" id="id"
							style="padding: 10px;" />
					</div>
					<div class="field half">
						<label for="pw">PW</label> <input type="text" name="pw" id="pw"
							style="padding: 10px;" />
					</div>
					
					<div class="field half">
						<label for="pw">PWȮ��</label> <input type="text" name="pw" id="pw2"
							style="padding: 10px;" />
					</div>
					
					<div class="field half">
						<label for="nickname">NICKNAME</label> <input type="text"
							name="nick" id="nick" style="padding: 10px;" />
					</div>
					<div class="field half">
						<label for="personnumber">�������</label> <input type="date"
							name="email" id="personnumber"
							style="padding: 10px; background-color: black" />

					</div>
					<div class="field half">
						���� 
						<input type="radio" name="gen" id="sex" style="display: inline-block; clear: both; opacity: 1; margin-right: 0px;float:none; -webkit-appearance:radio;" />��
						<input type="radio" name="gen" id="sex" style="display: inline-block; clear: both; opacity: 1; margin-right: 0px; float:none; -webkit-appearance:radio;"/>��

					</div>

					<ul class="actions">
						<li><input type="submit" value="Join" class="special" /></li>
						<li><input type="button" value="Cancel"
							onclick="history.go(-1)" /></li>
					</ul>
				</form>

				<script type="text/javascript">
					
				
					function check() {
						var idTag = document.getElementById("id");
						var pwTag = document.getElementById("pw");
						var pwTag2 = document.getElementById("pw2");
						var nickTag = document.getElementById("nick");
						var birthTag = document.getElementById("personnumber");
						var sexTag = document.getElementById("sex");
				
				
						if (idTag.value == "") {
							alert("���̵� �Է����ּ���.");
							idTag.focus();
							return false;
						} 
				
						//���̵� ���� �ҹ���, ���ڸ� ��� 5�� �̻� 
						var regex1 = /[a-z|0-9]{5,}/;
						
						//��й�ȣ&�̸���  ���� �빮�� Ȥ�� �ҹ��� Ȥ�� ���� ���� 6�� �̻�
						var regex2 = /[a-z|A-Z|0-9]{6,}/;
						
						if(regex1.test(id.value)==false){
							alert("���̵� ���� �ҹ���, ���ڸ� ��� 5�� �̻� �Է����ּ���.");
							return false;				
						}
						
				
						if (pwTag.value == "") {
							alert("��й�ȣ�� �Է����ּ���.");
							pwTag.focus();
							return false;
						}
						
						if (pwTag2.value == "") {
							alert("��й�ȣ�� Ȯ�����ּ���.");
							pwTag2.focus();
							return false;
						}
						
						if(pwTag.value != pwTag2.value){
							alert("�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
							pwTag2.focus();
							return false;
						}
				
				
						if (nickTag.value == "") {
							alert("�г����� �Է����ּ���.");
							nickTag.focus();
							return false;
						} 
				
						if (birthTag.value == "") {
							alert("��������� �Է����ּ���.");
							birthTag.focus();
							return false;
						} 
				
				
						if (sexTag.value == "") {
							alert("������ �������ּ���.");
							sexTag.focus();
							return false;
						} else {
							document.form.submit;
						}
				
				
					}
				</script>

			</article>
		</div>
	</div>
	<!-- BG -->
	<div id="bg"></div>
</body>
</html>

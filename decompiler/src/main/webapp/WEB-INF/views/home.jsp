<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="<c:url value="/resources/docs.css" />" />

<style>
.some-css {
	color: red;
	line-height: 2;
}
</style>
<link rel="stylesheet" href="<c:url value="/resources/dialog.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/codemirror.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/foldgutter.css" />"  />
<link rel="stylesheet" href="<c:url value="/resources/matchesonscrollbar.css" />" />
<script src="<c:url value="/resources/codemirror.js" />" ></script>
<script src="<c:url value="/resources/foldcode.js"/>" ></script>
<script src="<c:url value="/resources/foldgutter.js"/>" ></script>
<script src="<c:url value="/resources/brace-fold.js"/>" ></script>
<script src="<c:url value="/resources/indent-fold.js"/>" ></script>
<script src="<c:url value="/resources/comment-fold.js"/>" ></script>
<script src="<c:url value="/resources/python.js"/>" ></script>
<script src="<c:url value="/resources/dialog.js"/>" ></script>

<script src="<c:url value="/resources/annotatescrollbar.js"/>" ></script>
<script src="<c:url value="/resources/jump-to-line.js"/>" ></script>
<script src="<c:url value="/resources/matchesonscrollbar.js"/>" ></script>
<script src="<c:url value="/resources/search.js"/>" ></script>
<script src="<c:url value="/resources/searchcursor.js"/>" ></script>

<style type="text/css">
.CodeMirror {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	height: 100%;
}
</style>

<script type="text/javascript">
	function loadTextArea() {
		var te_python = document.getElementById("code-result");
		window.editor_python = CodeMirror.fromTextArea(te_python, {
			mode : "python",
			lineNumbers : true,
			extraKeys : {
				"Ctrl-Q" : function(cm) {
					cm.foldCode(cm.getCursor());
				}
			},
			foldGutter : true,
			gutters : [ "CodeMirror-linenumbers", "CodeMirror-foldgutter" ]
		});
	}
</script>
</head>
<body>

	<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
		<input type="file" name="files" /> <input type="submit"
			value="Submit" id="btnSubmit" />
	</form>


	<div  height: 95%;">
		<textarea id="code-result" name="code"></textarea>
	</div>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

	<script type="text/javascript" src="<c:url value="/resources/main.js" /> "></script>


</body>

</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="<c:url value="/resources/docs.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/bootstrap.min.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-theme.min.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/converts.css" />" />

<style>
.some-css {
	color: red;
	line-height: 2;
}
</style>
<link rel="stylesheet" href="<c:url value="/resources/dialog.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/codemirror.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/foldgutter.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/matchesonscrollbar.css" />" />
<script src="<c:url value="/resources/codemirror.js" />"></script>
<script src="<c:url value="/resources/foldcode.js"/>"></script>
<script src="<c:url value="/resources/foldgutter.js"/>"></script>
<script src="<c:url value="/resources/brace-fold.js"/>"></script>
<script src="<c:url value="/resources/indent-fold.js"/>"></script>
<script src="<c:url value="/resources/comment-fold.js"/>"></script>
<script src="<c:url value="/resources/python.js"/>"></script>
<script src="<c:url value="/resources/dialog.js"/>"></script>

<script src="<c:url value="/resources/annotatescrollbar.js"/>"></script>
<script src="<c:url value="/resources/jump-to-line.js"/>"></script>
<script src="<c:url value="/resources/matchesonscrollbar.js"/>"></script>
<script src="<c:url value="/resources/search.js"/>"></script>
<script src="<c:url value="/resources/searchcursor.js"/>"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	
	function bs_input_file() {
		$(".input-file").before(
			function() {
				if ( ! $(this).prev().hasClass('input-ghost') ) {
					var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
					element.attr("name",$(this).attr("name"));
					element.change(function(){
						element.next(element).find('input').val((element.val()).split('\\').pop());
					});
					$(this).find("button.btn-choose").click(function(){
						element.click();
					});
					$(this).find("button.btn-reset").click(function(){
						element.val(null);
					    $(this).parents(".input-file").find('input').val('');
					});
					$(this).find('input').css("cursor","pointer");
					$(this).find('input').mousedown(function() {
						$(this).parents('.input-file').prev().click();
						return false;
					});
					return element;
				}
			}
		);
	}
	$(function() {
		bs_input_file();
		$('[data-toggle="popover"]').popover();  
		$(".btn-danger").click(function(){
			location.reload(true);
		});
	});
</script>
</head>
<body>
		<div id="header" class="animated bounceInDown">
			<div class="container">
				<div class="row">
					<div class="span12">
						<div class="navbar">
							<div class="navbar-inner">
								<div class="container">
									
									<a  href="#"></a><span class="logo"> Converter* </span>
									<div class="nav-collapse collapse">
										<ul class="nav pull-right">
											<li class="active">
												<a href="#/index.html">Home</a>
											</li>
											<li>
												<a href="#/about.html">About</a>
											</li>
											<li>
												<a href="#/blog.html">Blog</a>
											</li>
											<li class="dropdown"  style="display: none;">
												<a id="drop" href="#/work.html" role="button" class="dropdown-toggle" data-toggle="dropdown">Work <b class="caret"></b></a>
												<ul class="dropdown-menu" role="menu" aria-labelledby="drop">
													<li><a tabindex="-1" href="#/work-4cols.html">4 Columns</a></li>
													<li><a tabindex="-1" href="#/work-3cols.html">3 Columns</a></li>
													<li><a tabindex="-1" href="#/work-2cols.html">2 Columns</a></li>
													<li><a tabindex="-1" href="#/work-single.html">Single Work</a></li>
												</ul>
											</li>
											<li class="dropdown"  style="display: none;">
												<a id="drop2" href="#/#" role="button" class="dropdown-toggle" data-toggle="dropdown">Features <b class="caret"></b></a>
												<ul class="dropdown-menu" role="menu" aria-labelledby="drop">
													<li><a tabindex="-1" href="#/typography.html">Typography</a></li>
													<li><a tabindex="-1" href="#/elements.html">Elements</a></li>
													<li><a tabindex="-1" href="#/full-width.html">Full Width</a></li>
													<li><a tabindex="-1" href="#/pricing-tables.html">Pricing Tables</a></li>
													<li><a tabindex="-1" href="#/right-sidebar.html">Right Sidebar</a></li>
													<li><a tabindex="-1" href="#/left-sidebar.html">Left Sidebar</a></li>
													<li><a tabindex="-1" href="#/404.html">404 Page</a></li>
												</ul>
											</li>
											<li>
												<a href="#/contact.html">Contact</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div><!--/span12-->
				</div><!--/row-->
			</div><!--/container-->
		</div><!--/header-->
		
         <!-- Preload our loader image -->
		<!--/hero-->
		
		<!--/content-->
		
		<div id="white-content">
			<div class="container">
				<div class="col-md-8 col-md-offset-2">
   
        <h3>Online Java Decompiler</h3>
<form method="POST" action="#" enctype="multipart/form-data" id="fileUploadForm">
	<!-- COMPONENT START -->
	<div class="form-group">
		<div class="input-group input-file" name="files">
    		<input type="text" class="form-control" placeholder='Choose a file...' />			
            <span class="input-group-btn">
        		<button class="btn btn-default btn-choose" type="button">Choose</button>
    		</span>


		</div>
	</div>
	<!-- COMPONENT END -->
	<div class="form-group">
		<button type="submit" id="btnSubmit" class="btn btn-primary pull-right" >Submit</button>
		
		<button type="reset" class="btn btn-danger">Reset</button>
		<span style=" margin-left: 30%; color: #2d71ac;">
		<a href="#" data-toggle="popover" style="color: #2d71ac;font-size: 16px;" title="Keys *" 
		data-content="Ctrl-F   Searching.          Ctrl-G   Find Next.          Alt-G
Jump to line.">Shortcut keys</a></span>
	</div>
</form>

</div>
<div>
 </div>
			</div><!--/container-->
			<!-- <div class="alert alert-info fade in">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>Note!</strong> Please read the comments carefully.
</div> -->
			<textarea id="code-result" name="code" style="display: none;"></textarea>
		</div><!--/white content-->
		
		<div id="footer">
			<div class="container">
				<div class="row">
					<div class="span8">
						<p>© Copyright 2018 Decompiler | All rights reserved</p>
					</div><!--/span8-->
					<div class="span4">
						<ul id="footer-nav">
							
						</ul>
					</div><!--/span4-->
				</div><!--/row-->
			</div><!--/container-->
		</div><!--/footer-->
		

	<script type="text/javascript"
		src="<c:url value="/resources/main.js" /> "></script>


</body>

</html>

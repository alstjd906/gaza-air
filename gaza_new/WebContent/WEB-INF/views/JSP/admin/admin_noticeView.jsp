<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminHeader.jspf" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">공지사항 상세페이지</h1>
                        </div>
                    </div>
                    
                    <div class="row2 row">
                        <div class="col-lg-12">	
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form method="post" action="noticeAddOk">
										<div class="row2 clearfix">
                                            <div class="col-tenth">글타입:</div>
                                            <div class="col-nine-tenth"><input type="text" name="noticeType" value="${vo.noticeType }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">제목:</div>
                                            <div class="col-nine-tenth"><input type="text" name="subject" value="${vo.subject }"></div>
                                        </div>
										<div class="row2 clearfix">
                                            <div class="col-tenth">공지내용:</div>
                                            <div class="col-nine-tenth"><textarea rows="25" cols="87" name="content" readonly>${vo.content }</textarea></div>
                                        </div>
									</form>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="<%=resources %>/Admin/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<%=resources %>/Admin/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="<%=resources %>/Admin/js/metisMenu.min.js"></script>

       
        <!-- Custom Theme JavaScript -->
        <script src="<%=resources %>/Admin/js/startmin.js"></script>

    </body>
</html>

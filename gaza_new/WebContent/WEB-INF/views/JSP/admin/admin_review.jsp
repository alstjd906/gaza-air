<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminHeader.jspf" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">이용후기(Review)</h1>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables">
                                            <col-group>
                                                <col width="9%">
                                                <col width="9%">
                                                <col width="10.25%">
                                                <col width="10.25%">
                                                <col width="10.25%">
                                                <col width="10.25%">
                                                <col width="10.25%">
                                                <col width="10.25%">
                                            </col-group>
                                            <thead>
                                                <tr>
                                                    <th>리뷰번호</th>
                                                    <th>글타입</th>
                                                    <th>제목</th>
                                                    <th>글내용</th>
                                                    <th>작성자</th>
                                                    <th>조회수</th>
                                                    <th>등록일</th>
                                                    <th>아이피</th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach var="vo" items="${lst }">
                                                <tr class="odd gradeX">
                                                    <td>${vo.reviewNum }</td>
                                                    <td>${vo.reviewType }</td>
                                                    <td onClick="location.href='<%=jsp%>/admin/admin_reviewView?reviewNum=${vo.reviewNum}'">${vo.subject }</td>
                                                    <td class="center">${vo.content }</td>
                                                    <td class="center">${vo.writer }</td>
                                                    <td class="center">${vo.hit }</td>
                                                    <td>${vo.regdate }</td>
                                                    <td>${vo.ip }</td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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

        <!-- DataTables JavaScript -->
        <script src="<%=resources %>/Admin/js/dataTables/jquery.dataTables.min.js"></script>
        <script src="<%=resources %>/Admin/js/dataTables/dataTables.bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="<%=resources %>/Admin/js/startmin.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
            $(document).ready(function() {
                $('#dataTables').DataTable({
                    responsive: true
                });
            });
        </script>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminHeader.jspf" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">제휴이벤트(Alliance)</h1>
                            <a href="<%=jsp%>/admin/admin_allianceForm"><input type="button" id="addBtn" value="추가"></a>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables">
                                            <col-group>
                                                <col width="11.1%">
                                                <col width="11.1%">
                                                <col width="11.1%">
                                                <col width="11.1%">
                                                <col width="11.1%">
                                                <col width="11.1%">
                                                <col width="11.1%">
                                                <col width="11.1%">
                                                <col width="11.1%">
                                            </col-group>
                                            <thead>
                                                <tr>
                                                    <th>이벤트번호</th>
                                                    <th>이벤트제목</th>
                                                    <th>썸네일이미지</th>
                                                    <th>이벤트이미지</th>
                                                    <th>이벤트내용</th>
                                                    <th>제휴사</th>
                                                    <th>이벤트시작일</th>
                                                    <th>이벤트마감일</th>
                                                    <th>이벤트등록일</th>
                                                    <th>삭제</th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach var="vo" items="${lst }">
                                                <tr class="odd gradeX">
                                                    <td>${vo.eventNum }</td>
                                                    <td>${vo.eventName }</td>
                                                    <td>${vo.eventThumbnail }</td>
                                                    <td class="center">${vo.eventImg }</td>
                                                    <td class="center">${vo.eventContent }</td>
                                                    <td class="center">${vo.eventCompany }</td>
                                                    <td>${vo.startDate }</td>
                                                    <td>${vo.endDate }</td>
                                                    <td>${vo.regDate }</td>
                                                    <td><a href="allianceDel?eventNum=${vo.eventNum}">삭제</a></td>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminHeader.jspf" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">기내식(food)</h1>
                            <a href="<%=jsp %>/admin/admin_foodForm"><input type="button" id="addBtn" value="추가"></a>
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
                                                <col width="16.4%">
                                                <col width="16.4%">
                                                <col width="16.4%">
                                                <col width="16.4%">
                                                <col width="16.4%">
                                            </col-group>
                                            <thead>
                                                <tr>
                                                    <th>기내식번호</th>
                                                    <th>기내식종류</th>
                                                    <th>기내식이름</th>
                                                    <th>기내식이미지</th>
                                                    <th>기내식설명</th>
                                                    <th>기내식재료</th>
                                                    <th>기내식가격</th>
                                                    <th>삭제</th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach var="vo" items="${lst }">
                                                <tr class="odd gradeX">
                                                    <td>${vo.foodNum }</td>
                                                    <td>${vo.foodType }</td>
                                                    <td>${vo.foodName }</td>
                                                    <td class="center">${vo.foodImg }</td>
                                                    <td class="center">${vo.foodContent }</td>
                                                    <td class="center">${vo.foodIngredient }</td>
                                                    <td>${vo.foodPrice }</td>
                                                    <td><a href="admin_foodEdit?foodNum=${vo.foodNum }">수정</a>/<a href="foodDelOk?foodNum=${vo.foodNum }">삭제</a></td>
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

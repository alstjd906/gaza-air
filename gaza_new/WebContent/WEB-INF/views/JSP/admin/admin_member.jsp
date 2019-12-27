<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminHeader.jspf" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">회원(Member)</h1>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables">
                                            <col-group>
                                                <col width="80px">
                                                <col width="150px">
                                                <col width="100px">
                                                <col width="150px">
                                                <col width="200px">
                                                <col width="50px">
                                                <col width="150px">
                                                <col width="150px">
                                                <col width="100px">
                                                <col width="400px">
                                                <col width="400px">
                                                <col width="200px">
                                                <col width="150px">
                                                <col width="200px">
                                                <col width="150px">
                                                <col width="100px">
                                                <col width="150px">
                                            </col-group>
                                            <thead>
                                                <tr>
                                                    <th>회원번호</th>
                                                    <th>아이디</th>
                                                    <th>한글이름</th>
                                                    <th>영어이름</th>
                                                    <th>국가</th>
                                                    <th>성별</th>
                                                    <th>전화번호</th>
                                                    <th>유선전화</th>
                                                    <th>우편번호</th>
                                                    <th>주소</th>
                                                    <th>상세주소</th>
                                                    <th>이메일</th>
                                                    <th>생년월일</th>
                                                    <th>개인정보동의</th>
                                                    <th>이벤트동의</th>
                                                    <th>탑승횟수</th>
                                                    <th>등록일</th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach var="vo" items="${lst }">
                                                <tr class="odd gradeX">
                                                    <td>${vo.memberNum}</td>
                                                    <td>${vo.memberId}</td>
                                                    <td>${vo.memberNameKor }</td>
                                                    <td class="center">${vo.memberNameEng}</td>
                                                    <td class="center">${vo.nation}</td>
                                                    <td>${vo.gender}</td>
                                                    <td>${vo.tel }</td>
                                                    <td>${vo.altTel }</td>
                                                    <td>${vo.zipcode }</td>
                                                    <td>${vo.addr }</td>
                                                    <td>${vo.detailAddr }</td>
                                                    <td>${vo.email }</td>
                                                    <td>${vo.birthDay }</td>
                                                    <td>${vo.agree }</td>
                                                    <td>${vo.directronic }</td>
                                                    <td>${vo.flightCnt }</td>
                                                    <td>${vo.regdate }</td>
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

<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/base/taglibs.jsp" %>
<s:layout-render name="/WEB-INF/base/base.jsp">
    <s:layout-component name="page_css">
    </s:layout-component>
    <s:layout-component name="page_css_inline">
    </s:layout-component>
    <s:layout-component name="page_container">
        <div class="col-lg-12">
            <h1>Edit User</h1>
            <div class="row">
                <div class="col-lg-8">
                    <div class="main-box">
                        <h2>User Information</h2>
                        <form id="edit_user_form" class="form-horizontal" role="form" action="${contextPath}/user/userProfile" method="post">
                            <input type="hidden" name="userId" value="${user.id}">
                            <div class="form-group">
                                <label for="loginId" class="col-lg-3 control-label">Login ID *</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" id="loginId" name="loginId" placeholder="Login ID" value="${sessionScope.userSession.loginId}" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="fullname" class="col-lg-3 control-label">Name *</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Name" value="${sessionScope.userSession.fullname}" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-lg-3 control-label">Email *</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" id="email" name="email" placeholder="Email" value="${sessionScope.userSession.email}" readonly>
                                </div>
                            </div>
                            <!--<div class="form-group">
                                <label for="groupId" class="col-lg-3 control-label">Group *</label>
                                <div class="col-lg-8">
                                    <!--<input type="text" class="form-control" id="groupCode" name="groupCode" placeholder="Code" value="${user.groupCode}" readonly>-->
                                    <!--select id="groupId" name="groupId" class="form-control" disabled>
                                        <option value="" selected="" disabled>Select Group...</option>
                                        <c:forEach items="${userGroupList}" var="group">
                                            <option value="${user.groupId}" ${group.selected}>${user.groupCode} - ${user.groupName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>-->
                            <!--<div class="form-group">
                                <label for="isActive" class="col-lg-3 control-label">Status *</label>
                                <div class="col-lg-8">
                                    <select id="isActive" name="isActive" class="form-control" disabled>
                                        <option value="0" <c:if test="${user.isActive == '0'}">selected=""</c:if>>Inactive</option>
                                        <option value="1" <c:if test="${user.isActive == '1'}">selected=""</c:if>>Active</option>
                                    </select>
                                </div>
                            </div>-->
                            <a href="${contextPath}/" class="btn btn-info pull-left"><i class="fa fa-reply"></i> Back</a>
                            <!--<div class="pull-right">
                                <button type="reset" class="btn btn-secondary cancel">Reset</button>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>-->
                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="main-box">
                        <h2>Change Password</h2>
                         <form id="password_user_form" class="form-horizontal" role="form" action="${contextPath}/user/password" method="post">
                            <input type="hidden" name="userId" value="${sessionScope.userSession.id}">
                            <div class="form-group">
                                <label for="currentPassword" class="col-lg-3 control-label">Current Password *</label>
                                <div class="col-lg-8">
                                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="Current Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-lg-3 control-label">Password *</label>
                                <div class="col-lg-8">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword" class="col-lg-3 control-label">Confirm Password *</label>
                                <div class="col-lg-8">
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password">
                                </div>
                            </div>
                            <div class="pull-right">
                                <button type="reset" class="btn btn-secondary cancel">Reset</button>
                                <button type="submit" class="btn btn-primary">Change Password</button>
                            </div>
                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </s:layout-component>
        <s:layout-component name="page_js">
            <script src="${contextPath}/resources/validation/jquery.validate.min.js"></script>
            <script src="${contextPath}/resources/validation/additional-methods.js"></script>
        </s:layout-component>
        <s:layout-component name="page_js_inline">
            <script>
                $(document).ready(function () {
                    var password_user_form = $("#password_user_form").validate({
                        rules: {
                            currentPassword: {
                                required: true
                            },
                            password: {
                                required: true,
                                minlength: 8
                            },
                            confirmPassword: {
                                required: true,
                                minlength: 8,
                                equalTo: password
                            }
                        }
                    });
                    $("#password_user_form .cancel").click(function () {
                        password_user_form.resetForm();
                    });
                });
            </script>
        </s:layout-component>
    </s:layout-render>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="util.FileUtil" %>
<%@ page import="dao.FeedDAO" %>
<%
    request.setCharacterEncoding("utf-8");

    String uid = null, ucon = null, ufname = null;
    byte[] ufile = null;

    ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
    List items = sfu.parseRequest(request);

    Iterator iter = items.iterator();
    while(iter.hasNext()) {
        FileItem item = (FileItem) iter.next();
        String name = item.getFieldName();
        if(item.isFormField()) {
            String value = new String((item.getString()).getBytes("8859_1"),"utf-8");
            if (name.equals("id")) uid = value;
            else if (name.equals("content")) ucon = value;
        }
        else {
            if (item.getSize() > 0) {
                ufname = item.getName();
                ufile = item.get();
                // 이미지가 있을 때만 저장하도록 변경
                String root = getServletContext().getRealPath(java.io.File.separator);
                FileUtil.saveImage(root, ufname, ufile);
            }
        }
    }

    FeedDAO dao = new FeedDAO();
    if (dao.insert(uid, ucon, ufname)) {
        response.sendRedirect("main.jsp");
    }
    else {
        out.print("작성 글의 업로드 중 오류가 발생하였습니다.");
    }
%>

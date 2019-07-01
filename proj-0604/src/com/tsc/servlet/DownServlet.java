package com.tsc.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.stream.FileImageInputStream;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class DownServlet
 */
@WebServlet("/DownServlet")
public class DownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DownServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String photopath=request.getParameter("photopath");
		System.out.println(photopath);
		response.setHeader("Content-Disposition", "attachmen;filename=x.jpg");
		String realPath = getServletContext().getRealPath(photopath);
		File file = new File(realPath);
		FileInputStream fis = new FileInputStream(file);
		ServletOutputStream out = response.getOutputStream();
		byte[] b = new byte[1024];
		int len;
		while ((len = fis.read(b)) != -1) {
			out.write(b, 0, len);
		}
		out.flush();
		fis.close();
		System.err.println("OK...");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package cn.edu.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ValidCodeServlet
 */
@WebServlet("/ValidCodeServlet")
public class ValidCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ValidCodeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.生成验证码
		String s = "abcdefghijklmnopqrstuvwxyzQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		Random random = new Random();
		int len = 4;
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < len; i++) {
			int index = random.nextInt(s.length());
			buffer.append(s.charAt(index));
		}
		String code = buffer.toString();
		// 2.将生成的验证码保存在session中
		request.getSession().setAttribute("code", code);
		//3.画验证码
		int width = 120;// 单位px
		int height = 25;// 单位px
		// 创建一副内存图片：BufferedImage.设置宽度和高度
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// 得到属于该图片的画笔：Graphics
		Graphics g = image.getGraphics();
		// 画边框
		g.setColor(Color.BLUE);
		g.drawRect(0, 0, width, height);
		// 填充背景色
		g.setColor(Color.YELLOW);
		g.fillRect(1, 1, width - 2, height - 2);
		// 干扰线
		g.setColor(Color.GRAY);
		Random r = new Random();
		for (int i = 0; i < 15; i++) {
			g.drawLine(r.nextInt(width), r.nextInt(height), r.nextInt(width), r.nextInt(height));
		}
		// 验证码
		g.setColor(Color.RED);// 设置颜色
		// 设置字体大小和字体
		g.setFont(new Font("宋体", Font.BOLD | Font.ITALIC, 18));
		int x = 18;
		// 数字验证码
		for (int i = 0; i < code.length(); i++) {
			g.drawString(code.charAt(i) + "", x, 20);
			x += 22;
		}

		// 用字节流进行输出：ImageIO
		// 设置三个响应消息头，通知浏览器不要缓存
		response.setHeader("Expires", "-1");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(image, "jpg", out);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

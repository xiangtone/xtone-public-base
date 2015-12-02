package org.demo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.common.util.ConnectionService;
import org.demo.info.Content;

public class ContentService {
	public List<Content> getAllContents() {
		List<Content> list = null;
		Content content = null;
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = ConnectionService.getInstance().getConnectionForLocal();
			String sql = "SELECT * FROM tbl_cms_contents;";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				if(list==null||list.isEmpty()){
					list=new ArrayList<Content>();
				}
				content = new Content();
				content.setId(rs.getInt("id"));
				content.setCatalog(rs.getString("catalog"));
				content.setTitle(rs.getString("title"));
				content.setStatus(rs.getInt("status"));
				content.setContent(rs.getString("content"));
				content.setAuthorId(rs.getLong("authorId"));
				content.setAddTime(rs.getLong("addTime"));
				content.setLastModifyId(rs.getLong("lastModifyId"));
				content.setLastModifyTime(rs.getLong("lastModifyTime"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return list;
	}
}

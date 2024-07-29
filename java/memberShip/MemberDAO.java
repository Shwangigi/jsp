package memberShip;

import java.sql.SQLException;

import common.JDBConnect;

public class MemberDAO extends JDBConnect { // JDBConnect를 상속하여 1,2,5단계를 적용
	// jdbc를 처리하는 용도
	
	public MemberDAO(String drv, String url, String id,String pw) { // 2번째 방법 테스트
		super(drv,url,id,pw); // 부모 생성자에게 전달
	} // 1단계, 2단계
	
	// 3단계 (sql문 생성)
	public MemberDTO getMemberDTO(String id, String pass) {
		MemberDTO memberDTO = new MemberDTO(); // 빈 객체 생성
		String query = "select * from member where id=? and pass=?";
			
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, pass);
			
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				memberDTO.setId(resultSet.getString("id"));
				memberDTO.setPass(resultSet.getString("pass"));
				memberDTO.setName(resultSet.getString("name"));
				memberDTO.setRegdate(resultSet.getString("regidate"));
			}
		} catch (SQLException e) {
			System.out.println("MemberDTO.getMemberDTO() 메서드 오류(3단계)");
			e.printStackTrace();
		}
		return memberDTO;
	}
	
}
